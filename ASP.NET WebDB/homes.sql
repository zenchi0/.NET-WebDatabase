spool homes.lst
 SET ECHO ON
 DROP TABLE homes CASCADE CONSTRAINTS;
 CREATE TABLE homes
  (home_id int CONSTRAINT pk_homes PRIMARY KEY,
  model_id VARCHAR2(6) NOT NULL,
  lot_size  VARCHAR2(30),
  home_location VARCHAR2(50) NOT NULL,
  purchase_price FLOAT,
  street_address VARCHAR2(100) NOT NULL,
  city VARCHAR2(50) NOT NULL,
  state CHAR(2) NOT NULL,
  zip VARCHAR2(10) NOT NULL);
  
  DESC homes
 
 DROP SEQUENCE homes_sequence; 
 CREATE SEQUENCE homes_sequence 
  MINVALUE 1
  MAXVALUE 1000
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

INSERT INTO homes (home_id, model_id, lot_size, home_location, purchase_price,
                      street_address, city, state, zip)
     VALUES (homes_sequence.nextval, '5789', '.75 acres', 'Pine Village', 375000,
              '123 Main Street', 'Southern Pines', 'NC', '28388');

INSERT INTO homes (home_id, model_id, lot_size, home_location, purchase_price,
                      street_address, city, state, zip)
        VALUES (homes_sequence.nextval, '236543','2500 sq feet','Green Village',
                150000, '5623 Turning Leaf Dr', 'Pinehurst', 'NC', '28394');

SELECT * FROM homes;
COMMIT
SPOOL OFF