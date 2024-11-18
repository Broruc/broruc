CREATE TABLE Elevi (
    cod NUMBER PRIMARY KEY,
    nume VARCHAR2(50),
    specializare VARCHAR2(10)
);

-- Inserare date în tabelul Elevi
INSERT INTO Elevi (cod, nume, specializare) VALUES (1, 'Popescu Ion', 'FB');
INSERT INTO Elevi (cod, nume, specializare) VALUES (2, 'Georgescu Vasile', 'MNG');
INSERT INTO Elevi (cod, nume, specializare) VALUES (3, 'Pintilei Mihaela', 'FB');
INSERT INTO Elevi (cod, nume, specializare) VALUES (4, 'Papuc Ion', 'CIG');

-- Creare tabel Note
CREATE TABLE Note (
    cod_elev NUMBER,
    disciplina VARCHAR2(50),
    data DATE,
    nota NUMBER,
    CONSTRAINT fk_cod_elev FOREIGN KEY (cod_elev) REFERENCES Elevi(cod)
);

-- Inserare date în tabelul Note
INSERT INTO Note (cod_elev, disciplina, data, nota) VALUES (1, 'Matematica', TO_DATE('23/02/2015', 'DD/MM/YYYY'), 4);
INSERT INTO Note (cod_elev, disciplina, data, nota) VALUES (2, 'Baze de date', TO_DATE('19/03/2015', 'DD/MM/YYYY'), 5);
INSERT INTO Note (cod_elev, disciplina, data, nota) VALUES (3, 'Informatica', TO_DATE('19/03/2015', 'DD/MM/YYYY'), 6);
INSERT INTO Note (cod_elev, disciplina, data, nota) VALUES (4, 'Statistica', TO_DATE('19/03/2015', 'DD/MM/YYYY'), 7);
INSERT INTO Note (cod_elev, disciplina, data, nota) VALUES (4, 'Cioban', TO_DATE('18/10/2015', 'DD/MM/YYYY'), 9);
--  Afisati toate informatiile din tabelul Note
SELECT * FROM Note;
SELECT cod_elev, disciplina, data, nota AS nota_initiala, nota + 2 AS nota_noua
FROM Note;
SELECT * FROM USER_CONSTRAINTS;
SELECT nume, specializare, disciplina, nota FROM elevi, note WHERE cod=cod_elev ORDER BY nume;
-- media peste 6 de la toti studentii
-- SELECT * FROM elev, note WHERE AVG  
-- media din toate notele
SELECT AVG(nota) FROM note;
-- media lui Papuc Ion
SELECT AVG(nota) FROM note WHERE cod_elev = 4;
-- media peste 6 de la toti studentii
SELECT * FROM elevi, note n WHERE cod=cod_elev AND 6 <= (SELECT AVG(nota) FROM note  WHERE n.cod_elev=cod_elev);
-- sa setam data de la mic la mare
SELECT * FROM note ORDER BY data DESC;
-- selectam toate notele si adaugam 1 la nota
SELECT nota+1 nota_marita FROM note;
-- nume, selectam toate notele si adaugam 1 la nota
SELECT nume, nota+1 nota_marita FROM elevi, note WHERE cod_elev=cod;

BEGIN
    FOR i IN 6..50 LOOP  -- Start from the next unused cod value
        INSERT INTO Elevi (cod, nume, specializare)
        VALUES (
            i,
            'Student ' || i,
            CASE MOD(i, 3)
                WHEN 0 THEN 'FB'
                WHEN 1 THEN 'MNG'
                ELSE 'CIG'
            END
        );
    END LOOP;
    COMMIT;
END;
/

BEGIN
    FOR i IN 1..50 LOOP
        FOR j IN 1..5 LOOP
            INSERT INTO Note (cod_elev, disciplina, data, nota)
            VALUES (
                i,
                CASE MOD(j, 5)
                    WHEN 0 THEN 'Matematica'
                    WHEN 1 THEN 'Baze de date'
                    WHEN 2 THEN 'Informatica'
                    WHEN 3 THEN 'Statistica'
                    ELSE 'Algebra'
                END,
                TO_DATE('01/01/2015', 'DD/MM/YYYY') + TRUNC(DBMS_RANDOM.VALUE(0, 365)),
                TRUNC(DBMS_RANDOM.VALUE(4, 10))
            );
        END LOOP;
    END LOOP;
    COMMIT;
END;
/
SELECT * FROM elevi;
SELECT * FROM note;
INSERT INTO elevi(cod, nume, specializare) VALUES(5, 'Dani Mocanu', 'SEX');
SELECT * FROM elevi WHERE 10> cod;
SELECT * FROM note;
BEGIN
    FOR i IN 1..50 LOOP
        FOR j IN 1..5 LOOP
            INSERT INTO Note (cod_elev, disciplina, data, nota)
            VALUES (
                i,
                CASE MOD(j, 5)
                    WHEN 0 THEN 'Matematica'
                    WHEN 1 THEN 'Baze de date'
                    WHEN 2 THEN 'Informatica'
                    WHEN 3 THEN 'Statistica'
                    ELSE 'Algebra'
                END,
                TO_DATE('01/01/2015', 'DD/MM/YYYY') + TRUNC(DBMS_RANDOM.VALUE(0, 365)),
                TRUNC(DBMS_RANDOM.VALUE(4, 10))
            );
        END LOOP;
    END LOOP;
    COMMIT;
END;
/
UPDATE elevi
SET nume = 'Ion Prapastie'
WHERE cod = 31;
