Create PROCEDURE premiaPoDacie
@rok int,
@miesiac int,
@dzien int,
@podwyzka int
AS
BEGIN
DECLARE Test1 CURSOR FOR SELECT IdPracownika, Pensja, Nazwisko
FROM Pracownicy;
OPEN Test1
DECLARE @Nazwisko Varchar(20), @IdPracownika Int, @sal Int;
FETCH NEXT FROM Test1 INTO @IdPracownika, @sal, @Nazwisko;
WHILE @@Fetch_status = 0
BEGIN
IF exists (select 1 from spektakl_pracownicy where IdPracownika = @IdPracownika AND IdSpektakl IN (select IdPrzedstawienia from Przedstawienie where Year(DataICzas) = @rok
AND Month(DataICzas) = @miesiac AND Day(DataICzas) = @DZIEN))
BEGIN
PRINT @Nazwisko+ ' zarabia przed podwyzka '
+ Cast(@sal As Varchar) + '   ' + Cast(@IdPracownika As Varchar);
update Pracownicy
set Pensja = @sal + @podwyzka 
where IdPracownika = @IdPracownika
END
FETCH NEXT FROM Test1 INTO @IdPracownika, @sal, @Nazwisko;
End
Close Test1
Deallocate Test1
END
Exec premiaPoDacie 2018, 08, 18, 200

select * from status


alter PROCEDURE odwolaniePrzedst
@rok int,
@miesiac int,
@dzien int
AS
BEGIN
DECLARE Test2 CURSOR FOR SELECT IdPrzedstawienia, IdStatusu
FROM Przedstawienie;
OPEN Test2
DECLARE @IdPrzedstawienia int, @IdStatusu varchar(20);
FETCH NEXT FROM Test2 INTO @IdPrzedstawienia, @IdStatusu;
WHILE @@Fetch_status = 0
BEGIN
IF EXISTS (SELECT 1 FROM przedstawienie p where p.IdPrzedstawienia = @IdPrzedstawienia AND Year(p.DataICzas) = @rok
AND Month(p.DataICzas) = @miesiac AND Day(p.DataICzas) = @DZIEN)
BEGIN
print 'przedstawienie nr. ' + cast(@IdPrzedstawienia as varchar) + ' zostaje odwolane ';
update przedstawienie
set IdStatusu = 3 where IdPrzedstawienia = @IdPrzedstawienia
END
FETCH NEXT FROM Test2 INTO @IdPrzedstawienia, @IdStatusu;
END
Close Test2
Deallocate Test2
end
exec odwolaniePrzedst 2018, 08, 05

select * from przedstawienie
select * from status

CREATE TRIGGER CZYZAPLACONE
ON MIEJSCEZAREZERWOWANE
for INSERT
AS
DECLARE TR_CURSOR CURSOR FOR SELECT idRezerwacji FROM INSERTED
DECLARE @IDREZ INT;
OPEN TR_CURSOR
FETCH NEXT FROM TR_CURSOR INTO @IDREZ;
WHILE @@FETCH_STATUS = 0
BEGIN
IF EXISTS(SELECT 1 FROM MiejscaPlanowane WHERE IDPLANOWANIA = @IDREZ 
AND IDSTATUSU IN (SELECT IDSTATUSU FROM STATUSPLATNOSCI sp WHERE StatusPlatnosci = 'NIEOPLACONE'))
BEGIN
PRINT 'NIE OPLACONO JESZCZE BILETU'
ROLLBACK
END
FETCH NEXT FROM TR_CURSOR INTO @IDREZ;
END
CLOSE TR_cursor;
DEALLOCATE TR_cursor;


SELECT * FROM MiejscaPlanowane
inner join StatusPlatnosci
on StatusPlatnosci.idStatusu=MiejscaPlanowane.idStatusu

insert into MiejsceZarezerwowane values (2, 27,1, 1)

select * from miejsceZarezerwowane
select * from przedstawienie
select * from Miejsce



CREATE TRIGGER ZLEMIEJSCE ON MIEJSCEZAREZERWOWANE FOR INSERT, UPDATE
AS
DECLARE @IDPRZEDST INT;
DECLARE @IDMIEJSC INT;
SELECT @IDPRZEDST = IDPRZEDSTAWIENIA, @IDMIEJSC = idMiejsca FROM INSERTED;
IF @IDMIEJSC NOT IN (SELECT IDMIEJSCA FROM MIEJSCE WHERE IDSALI = (SELECT IDSALI FROM PRZEDSTAWIENIE WHERE IdPrzedstawienia=@IDPRZEDST))
begin 
print 'zle miejsce'
rollback 
end


--CREATE TRIGGER TR1 ON EMP FOR INSERT
--AS
--IF EXISTS (SELECT 1 FROM inserted WHERE Sal < 100)
--BEGIN
--DECLARE TR_cursor CURSOR FOR SELECT empno FROM INSERTED
--WHERE Sal < 100;
--DECLARE @empno INT;
--OPEN TR_cursor
--FETCH NEXT FROM TR_cursor INTO @empno;
--WHILE @@FETCH_STATUS = 0
--BEGIN
--DELETE FROM EMP WHERE EMPNO = @empno;
--FETCH NEXT FROM TR_cursor INTO @empno;
--END;
--CLOSE TR_cursor;
--DEALLOCATE TR_cursor;
--END;
--