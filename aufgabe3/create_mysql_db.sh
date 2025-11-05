#!/bin/sh

print_import_commands() {
cat << END
LOAD DATA INFILE '$2'
INTO TABLE $1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

END
}

create_kunden_db() {
cat << END
CREATE TABLE kunden (
    kundennummer VARCHAR(255) PRIMARY KEY,
    vorname VARCHAR(255),
    nachname VARCHAR(255),
    strasse VARCHAR(255),
    hausnummer VARCHAR(50),
    plz VARCHAR(20),
    stadt VARCHAR(255),
    land VARCHAR(255)
);

END
    print_import_commands kunden kunden.CSV
}

create_hersteller_db(){
cat << END	
CREATE TABLE hersteller (
    name VARCHAR(255) PRIMARY KEY,
    land VARCHAR(255)
);

END
    print_import_commands hersteller hersteller.CSV
}

create_produkte_db() {
cat << END
CREATE TABLE produkte (
    produktnummer VARCHAR(255) PRIMARY KEY,
    bezeichnung VARCHAR(255),
    hersteller VARCHAR(255),
    FOREIGN KEY (hersteller) REFERENCES hersteller(name)
);
END
    print_import_commands produkte produkte.CSV
}

create_warenkorb_db() {
cat << END

CREATE TABLE warenkorb (
    bestellnummer INT,
    produktnummer VARCHAR(255),
    menge INT,
    preis DECIMAL(10,2),
    PRIMARY KEY (bestellnummer, produktnummer),
    FOREIGN KEY (produktnummer) REFERENCES produkte(produktnummer)
);
END
    print_import_commands warenkorb warenkorb.CSV
}

create_bestellung_db(){
cat << END

CREATE TABLE bestellung (
    bestellnummer INT PRIMARY KEY,
    datum DATE VALUES (STR_TO_DATE('15.01.2025', '%d.%m.%Y')),
    kundennummer VARCHAR(255),
    versandkosten DECIMAL(10,2),
    gesamtkosten DECIMAL(10,2),
    FOREIGN KEY (bestellnummer) REFERENCES warenkorb(bestellnummer),
    FOREIGN KEY (kundennummer) REFERENCES kunden(kundennummer)
);
END
    print_import_commands bestellung bestellung.CSV
}


show_db() {
cat << END
SELECT * FROM kunden;
END
}

drop_dbs() {
cat << END
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS bestellung;
DROP TABLE IF EXISTS produkte;
DROP TABLE IF EXISTS warenkorb;
DROP TABLE IF EXISTS hersteller;
DROP TABLE IF EXISTS kunden;
SET FOREIGN_KEY_CHECKS = 1;
END
}

drop_dbs

create_kunden_db
create_hersteller_db
create_produkte_db
create_warenkorb_db
create_bestellung_db
show_db


