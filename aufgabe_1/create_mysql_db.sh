#!/bin/sh

print_import_commands() {
cat << END
LOAD DATA INFILE "'$1'"
INTO TABLE your_table_name
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
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
    print_import_commands kunden.CSV
}

create_hersteller_db(){
CREATE TABLE hersteller (
    name VARCHAR(255) PRIMARY KEY,
    land VARCHAR(255)
);
END
    print_import_commands hersteller.CSV
}

create_produkte_db() {
CREATE TABLE produkte (
    produktnummer VARCHAR(255) PRIMARY KEY,
    bezeichnung VARCHAR(255),
    hersteller VARCHAR(255),
    FOREIGN KEY (hersteller) REFERENCES hersteller(name)
);
END
    print_import_commands produkte.CSV
}

create_warenkorb_db() {
CREATE TABLE warenkorb (
    bestellnummer INT,
    produktnummer VARCHAR(255),
    menge INT,
    preis DECIMAL(10,2),
    PRIMARY KEY (bestellnummer, produktnummer),
    FOREIGN KEY (produktnummer) REFERENCES produkte(produktnummer)
);
END
    print_import_commands warenkorb.CSV
}

create_bestellung_db(){
CREATE TABLE bestellung (
    bestellnummer INT PRIMARY KEY,
    datum DATE,
    kundennummer VARCHAR(255),
    versandkosten DECIMAL(10,2),
    gesamtkosten DECIMAL(10,2),
    FOREIGN KEY (bestellnummer) REFERENCES warenkorb(bestellnummer),
    FOREIGN KEY (kundennummer) REFERENCES kunden(kundennummer)
);
END
    print_import_commands bestellung.CSV
}


show_db() {
cat << END
SELECT * FROM kunden;
END
}

drop_dbs() {
cat << END
DROP TABLE bestellung;
DROP TABLE warenkorb;
DROP TABLE produkte;
DROP TABLE hersteller;
DROP TABLE kunden;
END
}

drop_dbs

create_kunden_db
create_hersteller_db
create_produkte_db
create_warenkorb_db
create_bestellung_db
save_db
show_db


