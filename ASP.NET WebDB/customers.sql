  spool customers.lst
  SET ECHO ON
  DROP TABLE customers CASCADE CONSTRAINTS;
  CREATE TABLE customers
   (customer_id int CONSTRAINT pk_customers PRIMARY KEY,
   last_name VARCHAR2(50) NOT NULL,
   first_name  VARCHAR2(30) NOT NULL,
   mi VARCHAR2(2),
   dob DATE,
   home_phone VARCHAR2(13),
   cell_phone VARCHAR2(13),
   street_address VARCHAR2(255) NOT NULL,
   city VARCHAR2(50) NOT NULL,
   state CHAR(2) NOT NULL,
   zip VARCHAR2(10) NOT NULL,
   profession VARCHAR2(50),
   employer VARCHAR2(50),
   referrer VARCHAR2(100),
   agent_id int NOT NULL,
   CONSTRAINT fk_agents FOREIGN KEY(agent_id) REFERENCES agents(agent_id));
   
   DESC customers
  
  DROP SEQUENCE customers_sequence; 
  CREATE SEQUENCE customers_sequence 
   MINVALUE 1
   MAXVALUE 1000
   START WITH 1
   INCREMENT BY 1
   CACHE 20;
 
 INSERT INTO customers (customer_id, last_name, first_name, mi, dob, cell_phone, street_address,
                       city, state, zip, profession, employer, referrer, agent_id)
      VALUES (customers_sequence.nextval, 'Smith', 'John', 'F.', TO_DATE('15-NOV-1968', 'DD-MM-YYYY'),
             '(910)252-7856', '252 Rossmoore Blvd', 'Ashville', 'NC', '25345-4589',
             'Carpenter', 'Jonson Custom Homes', 'Nancy Clark', 1);
 
 INSERT INTO customers (customer_id, last_name, first_name, mi, dob, home_phone, cell_phone,
                       street_address, city, state, zip, profession, employer,
                       referrer, agent_id)
         VALUES (customers_sequence.nextval, 'Johnson', 'Dave', 'Q', TO_DATE('20-DEC-1955', 'DD-MM-YYYY'),
                 '(401)520-5555', '(401)455-4551', '4875 West Way', 'Mechanicsville',
                 'MD', '20879', 'Plumber', 'Rotorooter', 'Jim Jones', 1);
 
 SELECT * FROM customers;
 COMMIT
SPOOL OFF