spool agents.lst
SET ECHO ON
DROP TABLE sales CASCADE CONSTRAINTS;
DROP TABLE customers CASCADE CONSTRAINTS;
DROP TABLE homes CASCADE CONSTRAINTS;
DROP TABLE agents CASCADE CONSTRAINTS;
DROP SEQUENCE agents_sequence;
DROP SEQUENCE customers_sequence; 
DROP SEQUENCE homes_sequence; 
DROP SEQUENCE sales_sequence;

CREATE TABLE agents
  (agent_id int CONSTRAINT pk_agents PRIMARY KEY,
  last_name VARCHAR2(50) NOT NULL,
  first_name  VARCHAR2(30) NOT NULL,
  mi VARCHAR2(2),
  title VARCHAR2(4),
  home_phone VARCHAR2(13),
  cell_phone VARCHAR2(13),
  office_phone VARCHAR2(13) NOT NULL,
  pager VARCHAR2(13),
  hire_date   DATE NOT NULL);
  
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

CREATE TABLE sales
  (sale_id int CONSTRAINT pk_sales PRIMARY KEY,
  contract_id VARCHAR2(10) NOT NULL,
  sale_date DATE NOT NULL,
  actual_amount FLOAT NOT NULL,
  home_id int NOT NULL,
  agent_id int NOT NULL,
   customer_id int NOT NULL,
  CONSTRAINT fk_homes FOREIGN KEY(home_id) REFERENCES homes(home_id),
  CONSTRAINT fk_salesagents FOREIGN KEY(agent_id) REFERENCES agents(agent_id),
  CONSTRAINT fk_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id));   

CREATE SEQUENCE agents_sequence 
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE customers_sequence 
   START WITH 1
   INCREMENT BY 1
   NOCACHE;
   

 CREATE SEQUENCE homes_sequence 
  START WITH 1
  INCREMENT BY 1
  NOCACHE;
 
 CREATE SEQUENCE sales_sequence 
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

INSERT INTO agents (agent_id, last_name,first_name, mi,
      	 title, home_phone, cell_phone, office_phone, hire_date)
         VALUES (agents_sequence.nextval, 'Williams', 'Keller', 'J.', 'Mr.', '(919)568-8186',
         '(570)568-9745', '(919)568-7215', TO_DATE('10-FEB-2010', 'DD-MM-YYYY' ));

 INSERT INTO agents (agent_id, last_name,first_name, mi,
      	 title, home_phone, cell_phone, office_phone, hire_date)
         VALUES (agents_sequence.nextval,'Smith', 'John', 'R.', 'Mr.', '(301)424-1544',
         '(240)451-5221', '(301)455-5241', TO_DATE('15-MAR-2002', 'DD-MM-YYYY' ));

 INSERT INTO agents (agent_id, last_name,first_name, mi,
      	 title, home_phone, cell_phone, office_phone, pager, hire_date)
         VALUES (agents_sequence.nextval,'Jones', 'Cathy', 'M.', 'Mrs.', '(910)451-6521',
         '(919)542-1554', '(910)451-6510', '(919)451-5145', TO_DATE('12-OCT-2000', 'DD-MM-YYYY' ));
         
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

INSERT INTO homes (home_id, model_id, lot_size, home_location, purchase_price,
                      street_address, city, state, zip)
     VALUES (homes_sequence.nextval, '5789', '.75 acres', 'Pine Village', 375000,
              '123 Main Street', 'Southern Pines', 'NC', '28388');

INSERT INTO homes (home_id, model_id, lot_size, home_location, purchase_price,
                      street_address, city, state, zip)
        VALUES (homes_sequence.nextval, '236543','2500 sq feet','Green Village',
                150000, '5623 Turning Leaf Dr', 'Pinehurst', 'NC', '28394');

INSERT INTO sales (sale_id, contract_id, sale_date, actual_amount, home_id,
                      agent_id, customer_id)
     VALUES (sales_sequence.nextval, '235454', TO_DATE('23-APR-2015', 'DD-MM-YYYY'),
              273978.00, 1, 3, 2);

INSERT INTO sales (sale_id, contract_id, sale_date, actual_amount, home_id,
                      agent_id, customer_id)
        VALUES (sales_sequence.nextval, '2345', TO_DATE('21-NOV-2005', 'DD-MM-YYYY'),
                167983.00, 2, 1, 1);
                
COMMIT

SPOOL OFF

