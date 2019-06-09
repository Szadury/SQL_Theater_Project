INSERT INTO SALA (IDSali, ILOSCMIEJSC, NAZWASALI)
VALUES (1, 260, 'ZIELONA');
INSERT INTO SALA (IDSali, NAZWASALI, ILOSCMIEJSC)
VALUES (2, 'FIOLETOWA', 150);
INSERT INTO SALA (IDSali, NAZWASALI, ILOSCMIEJSC)
VALUES (3, 'DIAMENTOWA', 500);
INSERT INTO SALA (IDSali, NAZWASALI, ILOSCMIEJSC)
VALUES (4, 'SZMARAGDOWA', 150);
--SELECT * FROM SALA;

INSERT INTO MIEJSCE (IDMIEJSCA, NRRZEDU, NRKOLUMNY, IDSALI, TYPMIEJSCA) values
	(1, 1, 1, 1, 'PRZED SCENA'),   
    (2, 2, 1, 1, 'PRZED SCENA'),
    (3, 3, 1, 1, 'PRZED SCENA'),
    (4, 4, 1, 1, 'PRZED SCENA'),
    (5, 5, 1, 1, 'PRZED SCENA'),
	(6, 1, 2, 1, 'PRZED SCENA'),
	(7, 2, 2, 1, 'PRZED SCENA'),
	(8, 3, 2, 1, 'PRZED SCENA'),
	(9, 4, 2, 1, 'PRZED SCENA'),
	(10, 5, 2, 1, 'PRZED SCENA'),
	(11, 1, 3, 1, 'PRZED SCENA'),
	(12, 2, 3, 1, 'PRZED SCENA'),
	(13, 3, 3, 1, 'PRZED SCENA'),
	(14, 4, 3, 1, 'PRZED SCENA'),
	(15, 5, 3, 1, 'PRZED SCENA'),
	(16, 8, 1, 1, 'BALKON'),
	(17, 8, 2, 1, 'BALKON'),
	(18, 8, 3, 1, 'BALKON'),
	(19, 8, 4, 1, 'BALKON'),
	(20, 1, 1, 2, 'PRZED SCENA'),
	(21, 2, 1, 2, 'PRZED SCENA'),
	(22, 3, 1, 2, 'PRZED SCENA'),
	(23, 4, 1, 2, 'PRZED SCENA'),
	(24, 1, 1, 2, 'PRZED SCENA'),
	(25, 2, 1, 2, 'PRZED SCENA'),
	(26, 3, 1, 2, 'PRZED SCENA'),
	(27, 1, 1, 3, 'PRZED SCENA'),
	(28, 1, 2, 3, 'PRZED SCENA');
      
INSERT INTO ZAWOD_PRACOWNIKA (IDZAWODU, NAZWA) VALUES 
	(1, 'AKTOR'),
	(2, 'REZYSER'),
	(3, 'CHOREOGRAF'),
	(4, 'SUFLER'),
	(5, 'CHARAKTERYZATOR'),
	(6, 'SCENOGRAF');
    
INSERT INTO PRACOWNICY (IDPRACOWNIKA, IDZAWODU, PENSJA, IMIE, NAZWISKO, NRTELEFONU) VALUES
	(1, 1, 10000, 'PIOTR', 'ADAMCZYK', '650 302 432'), --AKTORZY
	(2, 1, 15000, 'BORYS', 'SZYC', '985 021 114'),
	(3, 1, 10000, 'JANUSZ', 'GAJOS', '578 253 112'),
	(4, 1, 19000, 'JAN', 'ENGLERT', '412 425 642'),
	(5, 1, 12500, 'KRZYSZTOF', 'STELMASZYK', '750 000 532'),
	(6, 2, 30000, 'ANDRZEJ', 'WAJDA', '698 980 986'), --REZYSERZY
	(7, 2, 14000, 'KRZYSZTOF', 'CZECZOT', '412 525 111'),
	(8, 2, 18000, 'AGNIESZKA', 'HOLLAND', '124 958 247'),
	(9, 3, 6000, 'JAN', 'KOWALSKI', '698 754 344'), --CHOREAGRAFOWIE
	(10, 3, 8000, 'ZBIGNIEW', 'KULCZYK', '157 732 221'),
	(11, 4, 4500, 'PIOTR', 'NIEDZIALKOWSKI', '124 678 432'), --SUFLER
	(12, 6, 6000, 'WIKTOR', 'ANDROSUK','650 123 424'), --SCENOGRAFOWIE
	(13, 6, 7000, 'ANTONIO', 'PEREZ', '650 302 412');
    
INSERT INTO GOSCIE (IDGOSCIA, IMIE, NAZWISKO) VALUES 
(1, 'JAN', 'SZCZESNY'),
(2, 'KAROL', 'KOWALSKI'),
(3, 'ANNA', 'LEON'),
(4, 'ZBIGNIEW', 'GRYZ'),
(5, 'DANIEL', 'LEWANDOWSKI'),
(6, 'JERZY', 'PISZCZEK'),
(7, 'WOJCIECH', 'TWARDOWSKI'),
(8, 'ANDRZEJ', 'WOJEWODZKI'),
(9, 'JOANNA', 'DANSKI'),
(10, 'GABRIELA', 'ENGLERT'),
(11, 'KINGA', 'DANSKA'),
(12, 'KONSTANTY', 'WOJTOWICZ'),
(13, 'JAN', 'DOBOSZ'),
(14, 'DAMIAN', 'ZIENTARSKI'),
(15, 'ROBERT', 'KULCZYL'),
(16, 'KRYSTIAN', 'WOZNIAK'),
(17, 'PAWEL', 'WOJCIECHOWSKI'),
(18, 'JOLANTA', 'MALINOWSKA');

INSERT INTO STATUSPLATNOSCI VALUES
(1, 'OPLACONE', 'GOTOWKA', 500),
(2, 'NIEOPLACONE', 'BRAK', 330),
(3, 'NIEOPLACONE', 'KARTA', 105),
(4, 'OPLACONE', 'GOTOWKA', 750),
(5, 'OPLACONE', 'KARTA', 300),
(6, 'OPLACONE', 'KARTA', 60),
(7, 'NIEOPLACONE', 'GOTOWKA', 110),
(8, 'OPLACONE', 'GOTOWKA', 200),
(9, 'OPLACONE', 'KARTA', 520);
    
INSERT INTO GATUNEK VALUES 
(1, 'KOMEDIA'),
(2, 'DRAMAT'),
(3, 'THRILLER'),
(4, 'MUSICAL'),
(5, 'OPERA');
    
INSERT INTO SPEKTAKL (IDSPEKTAKL, NAZWA, IDGATUNKU, REZYSER) VALUES 
(1, 'ULANI', 1, 'Piotr Cieplak'),
(2, 'DZIADY', 2, 'Eimuntas Nekrosius'),
(3, 'IDIOTA', 2, 'Pawe³ Miœkiewicz'),
(4, 'ELEMENTARZ', 1, 'Piotr Cieplak'),
(5, 'GARDEROBIANY', 1, 'Adam Sajnuk'),
(6, 'NEDZNICY', 4, 'Daniel Wyszogrodzki');

INSERT INTO STATUS VALUES 
(1, 'SKONCZONE'),
(2, 'PLANOWANE'),
(3, 'ODWOLANE');    
    
INSERT INTO PRZEDSTAWIENIE VALUES
(1, 1, 2, 2, convert(datetime, '22-07-18 6:30:00 PM', 5)),
(2, 1, 2, 2, convert(datetime, '18-08-18 8:30:00 PM', 5)),
(3, 2, 1, 2, convert(datetime, '20-07-18 5:30:00 PM', 5)),
(4, 2, 3, 2, convert(datetime, '22-07-18 8:00:00 PM', 5)),
(5, 2, 3, 1, convert(datetime, '06-03-18 9:00:00 PM', 5)),
(6, 2, 1, 2, convert(datetime, '24-07-18 7:30:00 PM', 5)),
(7, 4, 4, 2, convert(datetime, '22-07-18 8:00:00 PM', 5)),
(8, 5, 1, 1, convert(datetime, '06-06-18 4:30:00 PM', 5)),
(9, 6, 2, 3, convert(datetime, '22-07-18 10:00:00 PM', 5)),
(10, 6, 2, 1, convert(datetime, '22-05-18 10:30:00 AM', 5)),
(11, 4, 3, 2, convert(datetime, '05-08-18 5:00:00 PM', 5)),
(12, 3, 3, 2, convert(datetime, '01-09-18 4:30:00 PM', 5)),
(13, 4, 3, 3, convert(datetime, '22-07-18 6:30:00 PM', 5));

select * from Przedstawienie
select * from Spektakl_Pracownicy
INSERT INTO SPEKTAKL_PRACOWNICY VALUES
(1, 1, 1),
(1, 2, 2),
(1, 5, 3),
(1, 9, 4),
(1, 11, 5),
(1, 12, 6),
(2, 3, 7),
(2, 4, 8),
(2, 7, 9),
(2, 13, 10),
(3, 1, 11),
(3, 4, 12),
(3, 3, 13),
(3, 5, 14),
(3, 6, 15),
(4, 3, 16),
(4, 2, 17),
(4, 13, 18),
(4, 12, 19),
(4, 5, 20),
(5, 3, 21),
(5, 2, 22),
(5, 1, 23),
(5, 6, 24),
(5, 9, 25),
(5, 10, 26),
(1, 13, 27);
        
INSERT INTO MIEJSCAPLANOWANE VALUES
(1, 1, 3, 1),
(2, 2, 3, 2),
(3, 3, 1, 3),
(4, 4, 6, 4),
(5, 5, 2, 5),
(6, 6, 1, 6),
(7, 7, 1, 7),
(8, 8, 2, 8),
(9, 1, 4, 9);

INSERT INTO MIEJSCEZAREZERWOWANE VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 4, 4, 1),
(5, 5, 4, 1),
(6, 6, 4, 1),
(7, 7, 4, 1),
(8, 8, 4, 1),
(9, 8, 5, 2),
(10, 6, 5, 3),
(11, 8, 6, 3),
(12, 9, 8, 3),
(13, 10, 8, 3),
(14, 8, 9, 4),
(15, 9, 9, 4),
(16, 10, 9, 4),
(17, 11, 9, 4);
    