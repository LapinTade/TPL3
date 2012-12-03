DROP TABLE IF EXISTS Notation, Epreuve, Etudiant, Matiere;

CREATE TABLE Etudiant (
    NUMETU int(5),
    NOM varchar(25),
    PRENOM varchar(25),
    DATENAISS date,
    RUE varchar(25),
    CP int(5),
    VILLE varchar(25),
    PRIMARY KEY (NUMETU)
)  engine=InnoDB;

CREATE TABLE Matiere (
    CODEMAT varchar(5),
    LIBELLE varchar(25),
    COEF float(3),
    PRIMARY KEY (CODEMAT)
)  engine=InnoDB;

CREATE TABLE Epreuve (
    NUMEPREUVE int(10),
    DATEPREUVE date,
    LIEU varchar(25),
    CODEMAT varchar(25),
    PRIMARY KEY (NUMEPREUVE),
    FOREIGN KEY (CODEMAT)
        REFERENCES Matiere (CODEMAT)
)  engine=InnoDB;

CREATE TABLE Notation (
    NUMETU int(5),
    NUMEPREUVE int(5),
    NOTE int(3),
    FOREIGN KEY (NUMETU)
        REFERENCES Etudiant (NUMETU),
    FOREIGN KEY (NUMEPREUVE)
        REFERENCES Epreuve (NUMEPREUVE)
)  engine=InnoDB;