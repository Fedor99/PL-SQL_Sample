/*
-- foreign keys
ALTER TABLE Competition
    DROP CONSTRAINT Competition_Country;

ALTER TABLE History_Status
    DROP CONSTRAINT History_Status_Registration;

ALTER TABLE History_Status
    DROP CONSTRAINT History_Status_Status;

ALTER TABLE Registration
    DROP CONSTRAINT Registration_Competition;

ALTER TABLE Registration
    DROP CONSTRAINT Registration_Swimmer;

ALTER TABLE Registration
    DROP CONSTRAINT Registration_SwimmingStyle;

ALTER TABLE S_T
    DROP CONSTRAINT S_T_Swimmer;

ALTER TABLE S_T
    DROP CONSTRAINT S_T_Trainer;

-- tables
DROP TABLE Competition;

DROP TABLE Country;

DROP TABLE History_Status;

DROP TABLE Registration;

DROP TABLE S_T;

DROP TABLE Status;

DROP TABLE Swimmer;

DROP TABLE SwimmingStyle;

DROP TABLE Trainer;
*/


-- tables
-- Table: Competition
CREATE TABLE Competition (
    ID int  NOT NULL,
    Date1 date  NOT NULL,
    Date2 date  NOT NULL,
    Price int  NOT NULL,
    Country_ID int  NOT NULL,
    CONSTRAINT Competition_pk PRIMARY KEY (ID)
) ;

-- Table: Country
CREATE TABLE Country (
    ID int  NOT NULL,
    Name varchar2(50)  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (ID)
) ;

-- Table: History_Status
CREATE TABLE History_Status (
    Registration_ID int  NOT NULL,
    Status_ID int  NOT NULL,
    ID int  NOT NULL,
    updateDate date  NOT NULL,
    CONSTRAINT History_Status_pk PRIMARY KEY (ID)
) ;

-- Table: Registration
CREATE TABLE Registration (
    ID int  NOT NULL,
    Time_From_Competition number(3,2)  NOT NULL,
    Place int  NULL,
    Swimmer_ID int  NOT NULL,
    SwimmingStyle_ID int  NOT NULL,
    Competition_ID int  NOT NULL,
    PrizeSet varchar2(10)  NOT NULL,
    CONSTRAINT Registration_pk PRIMARY KEY (ID)
) ;

-- Table: S_T
CREATE TABLE S_T (
    ID int  NOT NULL,
    Swimmer_ID int  NOT NULL,
    Trainer_ID int  NOT NULL,
    Sport_Level int  NOT NULL,
    CONSTRAINT S_T_pk PRIMARY KEY (ID)
) ;

-- Table: Status
CREATE TABLE Status (
    ID int  NOT NULL,
    Description varchar2(50)  NOT NULL,
    CONSTRAINT Status_pk PRIMARY KEY (ID)
) ;

-- Table: Swimmer
CREATE TABLE Swimmer (
    ID int  NOT NULL,
    Name varchar2(50)  NOT NULL,
    Surname varchar2(50)  NOT NULL,
    Prize number(9,2)  NOT NULL,
    CONSTRAINT Swimmer_pk PRIMARY KEY (ID)
) ;

-- Table: SwimmingStyle
CREATE TABLE SwimmingStyle (
    ID int  NOT NULL,
    Style_Name varchar2(50)  NOT NULL,
    Specification varchar2(50)  NOT NULL,
    CONSTRAINT SwimmingStyle_pk PRIMARY KEY (ID)
) ;

-- Table: Trainer
CREATE TABLE Trainer (
    ID int  NOT NULL,
    Name varchar2(50)  NOT NULL,
    Surname varchar2(50)  NOT NULL,
    Prize number(10,2)  NOT NULL,
    CONSTRAINT Trainer_pk PRIMARY KEY (ID)
) ;

-- foreign keys
-- Reference: Competition_Country (table: Competition)
ALTER TABLE Competition ADD CONSTRAINT Competition_Country
    FOREIGN KEY (Country_ID)
    REFERENCES Country (ID);

-- Reference: History_Status_Registration (table: History_Status)
ALTER TABLE History_Status ADD CONSTRAINT History_Status_Registration
    FOREIGN KEY (Registration_ID)
    REFERENCES Registration (ID);

-- Reference: History_Status_Status (table: History_Status)
ALTER TABLE History_Status ADD CONSTRAINT History_Status_Status
    FOREIGN KEY (Status_ID)
    REFERENCES Status (ID);

-- Reference: Registration_Competition (table: Registration)
ALTER TABLE Registration ADD CONSTRAINT Registration_Competition
    FOREIGN KEY (Competition_ID)
    REFERENCES Competition (ID);

-- Reference: Registration_Swimmer (table: Registration)
ALTER TABLE Registration ADD CONSTRAINT Registration_Swimmer
    FOREIGN KEY (Swimmer_ID)
    REFERENCES Swimmer (ID);

-- Reference: Registration_SwimmingStyle (table: Registration)
ALTER TABLE Registration ADD CONSTRAINT Registration_SwimmingStyle
    FOREIGN KEY (SwimmingStyle_ID)
    REFERENCES SwimmingStyle (ID);

-- Reference: S_T_Swimmer (table: S_T)
ALTER TABLE S_T ADD CONSTRAINT S_T_Swimmer
    FOREIGN KEY (Swimmer_ID)
    REFERENCES Swimmer (ID);

-- Reference: S_T_Trainer (table: S_T)
ALTER TABLE S_T ADD CONSTRAINT S_T_Trainer
    FOREIGN KEY (Trainer_ID)
    REFERENCES Trainer (ID);



----------------------------------------------------------------------------
--Add data
INSERT INTO Trainer VALUES (1, 'Jason', 'Smith', 0.00);
INSERT INTO Trainer VALUES (2, 'Miles', 'Adams', 0.00);
INSERT INTO Trainer VALUES (3, 'Robert', 'Morgan', 0.00);

INSERT INTO Swimmer VALUES (1, 'Zoe', 'Sanders', 0.00);
INSERT INTO Swimmer VALUES (2, 'Emily', 'Clark', 0.00);
INSERT INTO Swimmer VALUES (3, 'Alexander', 'Ross', 0.00);
INSERT INTO Swimmer VALUES (4, 'Oliver', 'Morris', 0.00);
INSERT INTO Swimmer VALUES (5, 'Maya', 'Jones', 0.00);

INSERT INTO S_T VALUES (1, 1, 1, 3);
INSERT INTO S_T VALUES (2, 2, 3, 3);
INSERT INTO S_T VALUES (3, 3, 3, 3);
INSERT INTO S_T VALUES (4, 4, 2, 3);
INSERT INTO S_T VALUES (5, 5, 3, 3);

INSERT INTO SwimmingStyle VALUES (1, 'Crawl', 'Front');
INSERT INTO SwimmingStyle VALUES (2, 'Stroke', 'Back');
INSERT INTO SwimmingStyle VALUES (3, 'Stroke', 'Butterfly');
INSERT INTO SwimmingStyle VALUES (4, 'Freestyle', '-');

INSERT INTO Country VALUES (1, 'Australia');
INSERT INTO Country VALUES (2, 'Brazil');
INSERT INTO Country VALUES (3, 'Spain');
INSERT INTO Country VALUES (4, 'Slovakia');
INSERT INTO Country VALUES (5, 'Morocco');

INSERT INTO Competition VALUES (1, TO_DATE('2019-09-10', 'YYYY-MM-DD'), TO_DATE('2019-09-15', 'YYYY-MM-DD'), 499.99, 2);
INSERT INTO Competition VALUES (2, TO_DATE('2020-05-01', 'YYYY-MM-DD'), TO_DATE('2020-06-01', 'YYYY-MM-DD'), 250.00, 2);
INSERT INTO Competition VALUES (3, TO_DATE('2019-06-07', 'YYYY-MM-DD'), TO_DATE('2019-06-28', 'YYYY-MM-DD'), 190.50, 2);

INSERT INTO Status VALUES (1, 'Planning');
INSERT INTO Status VALUES (2, 'Active');
INSERT INTO Status VALUES (3, 'Closed');

INSERT INTO Registration VALUES (1, 1.05, 1, 3, 4, 2, 'FALSE');
INSERT INTO Registration VALUES (2, 2.01, 2, 4, 4, 2, 'FALSE');
INSERT INTO Registration VALUES (3, 0.00, NULL, 5, 1, 1, 'FALSE');
INSERT INTO Registration VALUES (4, 0.00, NULL, 2, 1, 1, 'FALSE');
INSERT INTO Registration VALUES (5, 0.00, NULL, 1, 1, 1, 'FALSE');
INSERT INTO Registration VALUES (6, 0.00, NULL, 1, 3, 1, 'FALSE');

INSERT INTO History_Status VALUES (1, 2, 1, TO_DATE('2018-05-08', 'YYYY-MM-DD'));
INSERT INTO History_Status VALUES (2, 2, 2, TO_DATE('2018-04-01', 'YYYY-MM-DD'));
INSERT INTO History_Status VALUES (3, 2, 3, TO_DATE('2018-03-25', 'YYYY-MM-DD'));
INSERT INTO History_Status VALUES (4, 2, 4, TO_DATE('2018-08-08', 'YYYY-MM-DD'));
INSERT INTO History_Status VALUES (5, 2, 5, TO_DATE('2019-02-02', 'YYYY-MM-DD'));

-------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON 

--1 PL/SQL block with cursor
-------------------------------------------------------------------------------------------
DECLARE
swimmerID INTEGER;
countryID INTEGER;
CURSOR cur IS SELECT r.swimmingStyle_ID, c.ID, r.ID FROM 
                Registration r JOIN Competition c ON r.competition_ID = c.ID 
                WHERE swimmer_ID = swimmerID AND c.country_ID = countryID;
TYPE CustomType IS RECORD (swimmingStyleID INTEGER, competitionID INTEGER, registrationID INTEGER);
thisRecord CustomType;
counter INTEGER;
swimmingStyleNmae VARCHAR2(50);
countryName VARCHAR2(50);

neverRegistered EXCEPTION;
BEGIN
    swimmerID := 1;
    countryID := 2;
    counter := 0;
    SELECT name INTO countryName FROM Country WHERE ID = countryID;

    OPEN cur;
    LOOP
        FETCH cur INTO thisRecord;
        EXIT WHEN cur%NOTFOUND;
         
         SELECT style_name INTO swimmingStyleNmae 
         FROM SwimmingStyle 
         WHERE ID = (SELECT swimmingStyle_ID FROM Registration WHERE ID = thisRecord.registrationID)
         AND ROWNUM = 1;
         
          dbms_output.put_line(
            'Swimmer ' || swimmerID || 
            ' registered for competition ' || thisRecord.competitionID ||
            ', swimming style: ' || swimmingStyleNmae ||
            ', country: ' || countryName);
         counter := counter + 1;
    END LOOP;
    --CLOSE cur;
    
    IF counter = 0
    THEN
        RAISE neverRegistered;
    END IF;

    EXCEPTION WHEN neverRegistered THEN 
        dbms_output.put_line(
            'Swimmer ' || 
            swimmerID || ' has never been registegered for a competition in country ' ||
            countryID);
END;

SELECT * FROM Country;
-------------------------------------------------------------------------------------------

--2 PL/SQL Procedure
-------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE GetMostPopularCountry (mostPopularCountry OUT integer)
AS
CURSOR cur IS SELECT ID FROM Country;
numberOfCountries INTEGER;
thisCountry INTEGER;
maxCount INTEGER;
thisCount INTEGER;
noCountriesInCompetitions EXCEPTION;
emptyTableCountries EXCEPTION;

BEGIN
    maxCount := 0;
    mostPopularCountry := -1;
    thisCountry := -1;
    
    SELECT COUNT(0) INTO numberOfCountries FROM Country;
    IF numberOfCountries = 0
    THEN
    RAISE emptyTableCountries;
    END IF;
    
    OPEN cur;
    LOOP
        thisCount := 0;
        FETCH cur INTO thisCountry;
        EXIT WHEN cur%NOTFOUND;
    
        SELECT COUNT(0) INTO thisCount FROM Competition WHERE Country_ID = thisCountry;
        IF thisCount > maxCount
        THEN
        maxCount := thisCount;
        mostPopularCountry := thisCountry;
        END IF;
    END LOOP;
    --CLOSE cur;
    
   IF mostPopularCountry = -1
   THEN
    RAISE noCountriesInCompetitions;
   END IF;

   EXCEPTION 
   WHEN noCountriesInCompetitions THEN 
    dbms_output.put_line('There are no countries that are assigned to any competition');
   WHEN emptyTableCountries THEN
    dbms_output.put_line('Table "Country" is empty');
END GetMostPopularCountry;

-- Test
DECLARE 
outValue INTEGER;
countryName VARCHAR2(100);
BEGIN
    GetMostPopularCountry (outValue);
    IF outValue != -1
    THEN
    SELECT name INTO countryName FROM Country WHERE ID = outValue;
    dbms_output.put_line('The most popular country: ' || countryName);
    END IF;
END;
-------

SELECT * FROM Country;
-------------------------------------------------------------------------------------------


--ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';

--3 PL/SQL TRIGGER FOR EACH ROW
-------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER AfterRegistrationUpdate
AFTER INSERT OR UPDATE ON Registration
FOR EACH ROW
DECLARE 
newHistoryID INTEGER;
newStatusID INTEGER;
newStatusName VARCHAR2(100);
previousHistoryCount INTEGER;
previousHistory VARCHAR2(100);
outputMessage VARCHAR2(100);
negativeValue EXCEPTION;
BEGIN
    dbms_output.put_line(':new.time_from_competition = ' || :new.time_from_competition);
    
    SELECT MAX(ID) INTO newHistoryID FROM history_status;
    newHistoryID := newHistoryID + 1;
    
    IF :new.time_from_competition  < 0
    THEN
        RAISE negativeValue;
    END IF;
    
    IF :new.time_from_competition = 0.00
    THEN
        newStatusName := 'Planning';
        --SELECT ID INTO newStatusID FROM Status WHERE DESCRIPTION LIKE 'Planning';
        outputMessage := ' newStatusName := Planning';
    END IF;
    
    IF :new.place IS NOT NULL OR :new.time_from_competition != 0.00
    THEN
        newStatusName := 'Active';    
        --SELECT ID INTO newStatusID FROM Status WHERE DESCRIPTION LIKE 'Active';
        outputMessage := ' newStatusName := Active';
    END IF;
    
    
    
    IF :new.prizeSet NOT LIKE 'FALSE'
    THEN
        newStatusName := 'Closed';
        --SELECT ID INTO newStatusID FROM Status WHERE DESCRIPTION LIKE 'Closed';
        outputMessage := ' newStatusName := Closed';
    END IF;
    
     dbms_output.put_line('step 1');
     dbms_output.put_line('newStatusName: ' || newStatusName);

    IF newStatusName IS NOT NULL
    THEN
    
        SELECT s.ID INTO newStatusID FROM Status s WHERE s.description = newStatusName;
        
         dbms_output.put_line('step 2');
        
        SELECT COUNT(0) INTO previousHistoryCount
        FROM Status s JOIN History_Status h ON h.status_ID = s.ID
        WHERE updateDate = (SELECT MAX(h1.updateDate) FROM History_Status h1) 
        AND registration_ID = :new.ID; 
        
        dbms_output.put_line('previousHistoryCount : ' || previousHistoryCount);
        
        IF previousHistoryCount != 0
        THEN
            SELECT s.description INTO previousHistory 
            FROM Status s JOIN History_Status h ON h.status_ID = s.ID
            WHERE updateDate = (SELECT MAX(h1.updateDate) FROM History_Status h1) 
            AND registration_ID = :new.ID
            AND ROWNUM = 1;
        ELSE
            previousHistory := -1;
        END IF;
        
         dbms_output.put_line('step 3');
         
         dbms_output.put_line('newStatusName: ' || newStatusName);
         dbms_output.put_line('previousHistory: ' || previousHistory);
        
        IF newStatusName != previousHistory
        THEN
            INSERT INTO History_Status VALUES (:new.ID, newStatusID, newHistoryID, SYSDATE);
            dbms_output.put_line('New history record inserted');
            dbms_output.put_line(outputMessage);
        END IF;
    END IF;
    
    EXCEPTION WHEN negativeValue THEN
        dbms_output.put_line('Cannot insert negative value as time_from_competition');
END Trigger_1;

-- Test
SAVEPOINT test2;
    -- Insert new
    INSERT INTO Registration VALUES (7, 0.00, NULL, 1, 1, 1, 'FALSE');
        SELECT * FROM Registration;
        SELECT * FROM history_Status;
    -- Set result time
    UPDATE Registration SET time_from_competition = 5.01 WHERE ID = 6;
        SELECT * FROM history_Status;
    -- Assign place
    UPDATE Registration SET place = 1 WHERE ID = 6;
        SELECT * FROM history_Status;
    -- Set prize somewhere
    UPDATE Registration SET prizeSet = 'TRUE' WHERE ID = 6;
        SELECT * FROM history_Status;
ROLLBACK TO SAVEPOINT test2;
-------
-------------------------------------------------------------------------------------------

--4.0
CREATE TYPE Array IS TABLE OF INTEGER;

--4 PL/SQL FUNCTION
-- Find trainer whose swimmers have the best average result
CREATE OR REPLACE FUNCTION BestAverageTrainer (excludeCompetitions Array) RETURN INTEGER
IS
CURSOR cur IS SELECT ID FROM Trainer;
thisTrainer INTEGER;
CURSOR subCur IS SELECT * FROM Registration
                 WHERE Swimmer_ID IN 
                 (SELECT Swimmer_ID FROM S_T WHERE Trainer_ID = thisTrainer);
thisRegistration INTEGER;
thisCompetition INTEGER;
thisSum registration.time_from_competition%type;
thisTime registration.time_from_competition%type;
thisCounter INTEGER;
thisAverage registration.time_from_competition%type;

bestAverage registration.time_from_competition%type;
bestTrainer INTEGER; -- trainer with the best average
--trainersAverage ARRAY;

/*
TYPE tAverage IS TABLE OF registration.time_from_competition%type INDEX BY BINARY_INTEGER;
trainersAverage tAverage;
*/
noTrainersFound EXCEPTION;
numberOfTrainers INTEGER;

belongsToExclude INTEGER;
BEGIN
    SELECT COUNT(0) INTO numberOfTrainers FROM Trainer;
    IF numberOfTrainers = 0 THEN
        RAISE noTrainersFound;
    END IF;

    SELECT MAX(time_from_competition) INTO bestAverage FROM Registration; -- bestAverage will never be greater than MAX(time)
    thisCounter := 0;
    thisSum := 0;

    -- Find avg of each trainer
    OPEN cur;
    LOOP
        FETCH cur INTO thisTrainer;
        EXIT WHEN cur%NOTFOUND;
        
        FOR thisSub IN subCur LOOP -- there may be several registrations for the same swimmer and trainer        
            SELECT r.Competition_ID INTO thisCompetition FROM Registration r WHERE r.ID = thisSub.ID;    
            
            IF thisCompetition NOT MEMBER OF excludeCompetitions
            THEN
                SELECT r.time_from_competition INTO thisTime FROM Registration r WHERE r.ID = thisSub.ID;
                thisCounter := thisCounter + 1;
                thisSum := thisSum + thisTime;
                dbms_output.put_line('thisTime: ' || thisTime);
            END IF;
        END LOOP;
    
    IF thisCounter != 0
    THEN
        thisAverage := thisSum / thisCounter;
        dbms_output.put_line('thisSum: ' || thisSum);
        dbms_output.put_line('thisCounter: ' || thisCounter);
        dbms_output.put_line('thisAverage: ' || thisAverage);
        dbms_output.put_line('thisTrainer: ' || thisTrainer);
        --trainersAverage(thisTrainer) := thisAverage;
        
        IF thisAverage < bestAverage AND thisAverage != 0
        THEN
            bestAverage := thisAverage;
            bestTrainer := thisTrainer;
            dbms_output.put_line('New best');
        END IF;
    END IF;
        
    END LOOP;
    CLOSE cur;
    
    RETURN bestTrainer;
    
    EXCEPTION WHEN noTrainersFound THEN 
        dbms_output.put_line('No trainers found');
        RETURN -1;
END BestAverageTrainer;

SET SERVEROUTPUT ON

-- Test
DECLARE
excludeCompetitions Array;
resultValue INTEGER;
BEGIN
    excludeCompetitions := Array(0);
    resultValue := BestAverageTrainer(excludeCompetitions);
    dbms_output.put_line('Trainer with the best average: ' || resultValue);
END;
------

SELECT * FROM Registration
                 WHERE Swimmer_ID IN 
                 (SELECT Swimmer_ID FROM S_T WHERE Trainer_ID = 1);
                 
SELECT * FROM Registration r JOIN S_T st ON r.swimmer_ID = st.swimmer_ID;
-------

-- End of file