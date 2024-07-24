select * from passenger 

alter table passenger 
add Family int

update passenger 
set family = SibSp + Parch +1
-----------------------------------------------

alter table passenger 
add Title varchar(255)

update passenger 
set Title = case 
WHEN Name LIKE '%Mr.%' THEN 'Mr'
               WHEN Name LIKE '%Mrs.%' THEN 'Mrs'
               WHEN Name LIKE '%Miss.%' THEN 'Miss'
               WHEN Name LIKE '%Master.%' THEN 'Master'
               WHEN Name LIKE '%Dr.%' THEN 'Dr'
               WHEN Name LIKE '%Rev.%' THEN 'Rev'
			   WHEN Name LIKE '%Major.%' THEN 'Major'
			   WHEN Name LIKE '%Don.%' THEN 'Don' 
			   WHEN Name LIKE '%Sir.%' THEN 'Sir'
			   else 'other' End
---------------------------------------------------------
alter table passenger 
add embarked2 varchar(255)

update passenger 
set embarked2 = case 
                 when embarked = 'c' then 'Cherbourg'
				 when embarked = 'S' then 'Southampton'
				 when embarked = 'Q' then 'Queenstown'
				 end 
--------------------------------------------------------------
alter table passenger 
add ISAlone int

update passenger
set ISAlone  = case
when SibSp + Parch = 0 then 1
else 0 ENd 
----------------------------------------------------------------

ALTER TABLE passenger
ADD Deck CHAR(1);

UPDATE passenger
SET Deck = LEFT(Cabin, 1)

update passenger 
set Deck = case 
              WHEN Deck = 'U' AND Pclass = 1 THEN 'B'
              WHEN Deck ='U' AND Pclass = 2 THEN 'E'
              WHEN Deck = 'U' AND Pclass = 3 THEN 'G'
			  else Deck
              End
-----------------------------------------------------------------------
-- Analyze Survival Rates by Deck
SELECT Deck, AVG(Survived) AS SurvivalRate
FROM passenger
GROUP BY Deck;

-- Use Deck and Deck_Missing in Predictive Models
SELECT PassengerId, Survived, Pclass, Name, Sex, Age, SibSp, Parch, Ticket, Fare, Cabin, Deck, Embarked
FROM passenger;


