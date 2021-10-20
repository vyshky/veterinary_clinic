CREATE TABLE tab_veterinarians
(
    id      INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(15) NOT NULL,
    surname VARCHAR(15) NOT NULL
);

CREATE TABLE tab_owner
(
    id          INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(15) NOT NULL,
    surname     VARCHAR(15) NOT NULL,
    passport_id VARCHAR(15) NOT NULL
);

CREATE TABLE tab_animal
(
    id              INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(15)  NOT NULL CHECK ( name != '' ),
    breed           VARCHAR(100) NOT NULL CHECK ( breed != '' ),
    kind_animal     VARCHAR(100) NOT NULL CHECK ( kind_animal != '' ),
    tag             INT          NOT NULL,
    id_veterinarian INT          NOT NULL,
    id_owner        INT          NOT NULL,

    FOREIGN KEY (id_veterinarian)
        REFERENCES tab_veterinarians (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,

    FOREIGN KEY (id_owner)
        REFERENCES tab_owner (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);



CREATE TABLE tab_medical_history
(
    id                   INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_animal            INT          NOT NULL,
    data                 DATE         NOT NULL,
    prescribed_treatment VARCHAR(100) NOT NULL CHECK ( prescribed_treatment != '' ),


    FOREIGN KEY (id_animal)
        REFERENCES tab_animal (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);


CREATE VIEW view_info AS
SELECT id_owner         AS 'Хозяин',
       id_veterinarian  AS 'Ветеринар',
       tab_animal.name  AS 'Кличка',
       tab_animal.breed AS 'Животное'
FROM tab_animal
         JOIN tab_owner t_o on tab_animal.id_owner = t_o.id
         JOIN tab_veterinarians t_v on tab_animal.id_veterinarian = t_v.id
;





