-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-07-18 22:02:24.24

-- tables
-- Table: Gatunek
CREATE TABLE Gatunek (
    idGatunku integer  NOT NULL,
    NazwaGatunku varchar(20)  NOT NULL,
    CONSTRAINT Gatunek_pk PRIMARY KEY (idGatunku)
) ;

-- Table: Goscie
CREATE TABLE Goscie (
    IdGoscia integer  NOT NULL,
    Imie varchar(30)  NOT NULL,
    Nazwisko varchar(40)  NOT NULL,
    nrTelefonu varchar(20)  NULL,
    CONSTRAINT Goscie_pk PRIMARY KEY (IdGoscia)
) ;

-- Table: MiejscaPlanowane
CREATE TABLE MiejscaPlanowane (
    idPlanowania integer  NOT NULL,
    IdGoscia integer  NOT NULL,
    LiczbaMiejsc integer  NOT NULL,
    idStatusu integer  NOT NULL,
    CONSTRAINT MiejscaPlanowane_pk PRIMARY KEY (idPlanowania)
) ;

-- Table: Miejsce
CREATE TABLE Miejsce (
    idMiejsca integer  NOT NULL,
    nrRzedu integer  NOT NULL,
    nrKolumny integer  NOT NULL,
    idSali integer  NOT NULL,
    TypMiejsca varchar(30)  NOT NULL,
    CONSTRAINT Miejsce_pk PRIMARY KEY (idMiejsca)
) ;

-- Table: MiejsceZarezerwowane
CREATE TABLE MiejsceZarezerwowane (
    idZarezerwowanego integer  NOT NULL,
    idMiejsca integer  NOT NULL,
    idRezerwacji integer  NOT NULL,
    IdPrzedstawienia integer  NOT NULL,
    CONSTRAINT MiejsceZarezerwowane_pk PRIMARY KEY (idZarezerwowanego)
) ;

-- Table: Pracownicy
CREATE TABLE Pracownicy (
    IdPracownika integer  NOT NULL,
    idZawodu integer  NOT NULL,
    Pensja Integer  NOT NULL,
    Imie varchar(30)  NOT NULL,
    Nazwisko varchar(40)  NOT NULL,
    nrTelefonu varchar(13)  NOT NULL,
    CONSTRAINT Pracownicy_pk PRIMARY KEY (IdPracownika)
) ;

-- Table: Przedstawienie
CREATE TABLE Przedstawienie (
    IdPrzedstawienia integer  NOT NULL,
    idSpektakl integer  NOT NULL,
    idSali integer  NOT NULL,
    IdStatusu integer  NOT NULL,
    DataICzas datetime  NOT NULL,
    CONSTRAINT Przedstawienie_pk PRIMARY KEY (IdPrzedstawienia)
) ;

-- Table: Sala
CREATE TABLE Sala (
    idSali integer  NOT NULL,
    iloscMiejsc integer  NOT NULL,
    nazwaSali varchar(40)  NOT NULL,
    CONSTRAINT Sala_pk PRIMARY KEY (idSali)
) ;

-- Table: Spektakl
CREATE TABLE Spektakl (
    idSpektakl integer  NOT NULL,
    Nazwa varchar(40)  NOT NULL,
    IdGatunku integer  NOT NULL,
    Rezyser varchar(40)  NOT NULL,
    CONSTRAINT Spektakl_pk PRIMARY KEY (idSpektakl)
) ;

-- Table: Spektakl_Pracownicy
CREATE TABLE Spektakl_Pracownicy (
    IdSpektakl integer  NOT NULL,
    IdPracownika integer  NOT NULL,
    IdSpektakl_Pracownicy integer  NOT NULL,
    CONSTRAINT Spektakl_Pracownicy_pk PRIMARY KEY (IdSpektakl_Pracownicy)
) ;

-- Table: Status
CREATE TABLE Status (
    IdStatusu integer  NOT NULL,
    StatusNazwa varchar(20)  NOT NULL,
    CONSTRAINT Status_pk PRIMARY KEY (IdStatusu)
) ;

-- Table: StatusPlatnosci
CREATE TABLE StatusPlatnosci (
    idStatusu integer  NOT NULL,
    StatusPlatnosci varchar(15)  NOT NULL,
    FormaPlatnosci varchar(20)  NOT NULL,
    Cena integer  NOT NULL,
    CONSTRAINT StatusPlatnosci_pk PRIMARY KEY (idStatusu)
) ;

-- Table: Zawod_Pracownika
CREATE TABLE Zawod_Pracownika (
    idZawodu integer  NOT NULL,
    nazwa varchar(20)  NOT NULL,
    CONSTRAINT Zawod_Pracownika_pk PRIMARY KEY (idZawodu)
) ;

-- foreign keys
-- Reference: MiejsceZarezerwowane_Siedzenie (table: MiejsceZarezerwowane)
ALTER TABLE MiejsceZarezerwowane ADD CONSTRAINT MiejsceZarezerwowane_Siedzenie
    FOREIGN KEY (idMiejsca)
    REFERENCES Miejsce (idMiejsca);

-- Reference: MiejsceZarezerwowane_Spektakl (table: MiejsceZarezerwowane)
ALTER TABLE MiejsceZarezerwowane ADD CONSTRAINT MiejsceZarezerwowane_Spektakl
    FOREIGN KEY (IdPrzedstawienia)
    REFERENCES Przedstawienie (IdPrzedstawienia);

-- Reference: Pracownicy_Zawod_Pracownika (table: Pracownicy)
ALTER TABLE Pracownicy ADD CONSTRAINT Pracownicy_Zawod_Pracownika
    FOREIGN KEY (idZawodu)
    REFERENCES Zawod_Pracownika (idZawodu);

-- Reference: Przedstawienie_Status (table: Przedstawienie)
ALTER TABLE Przedstawienie ADD CONSTRAINT Przedstawienie_Status
    FOREIGN KEY (IdStatusu)
    REFERENCES Status (IdStatusu);

-- Reference: Rezerwacja (table: MiejsceZarezerwowane)
ALTER TABLE MiejsceZarezerwowane ADD CONSTRAINT Rezerwacja2
    FOREIGN KEY (idRezerwacji)
    REFERENCES MiejscaPlanowane (idPlanowania);

-- Reference: Rezerwacja_Goscie (table: MiejscaPlanowane)
ALTER TABLE MiejscaPlanowane ADD CONSTRAINT Rezerwacja_Goscie
    FOREIGN KEY (IdGoscia)
    REFERENCES Goscie (IdGoscia);

-- Reference: Rezerwacja_Platnosc (table: MiejscaPlanowane)
ALTER TABLE MiejscaPlanowane ADD CONSTRAINT Rezerwacja_Platnosc
    FOREIGN KEY (idStatusu)
    REFERENCES StatusPlatnosci (idStatusu);

-- Reference: Siedzenie_Sala (table: Miejsce)
ALTER TABLE Miejsce ADD CONSTRAINT Siedzenie_Sala
    FOREIGN KEY (idSali)
    REFERENCES Sala (idSali);

-- Reference: Spektakl_Gatunek (table: Spektakl)
ALTER TABLE Spektakl ADD CONSTRAINT Spektakl_Gatunek
    FOREIGN KEY (IdGatunku)
    REFERENCES Gatunek (idGatunku);

-- Reference: Spektakl_Pracownicy_Pracownicy (table: Spektakl_Pracownicy)
ALTER TABLE Spektakl_Pracownicy ADD CONSTRAINT Spektakl_Pracownicy_Pracownicy
    FOREIGN KEY (IdPracownika)
    REFERENCES Pracownicy (IdPracownika);

-- Reference: Spektakl_Pracownicy_Spektakl (table: Spektakl_Pracownicy)
ALTER TABLE Spektakl_Pracownicy ADD CONSTRAINT Spektakl_Pracownicy_Spektakl
    FOREIGN KEY (IdSpektakl)
    REFERENCES Przedstawienie (IdPrzedstawienia);

-- Reference: Spektakl_Sala (table: Przedstawienie)
ALTER TABLE Przedstawienie ADD CONSTRAINT Spektakl_Sala
    FOREIGN KEY (idSali)
    REFERENCES Sala (idSali);

-- Reference: Spektakl_historiaSpektaklu (table: Przedstawienie)
ALTER TABLE Przedstawienie ADD CONSTRAINT Spektakl_historiaSpektaklu
    FOREIGN KEY (idSpektakl)
    REFERENCES Spektakl (idSpektakl);

--
