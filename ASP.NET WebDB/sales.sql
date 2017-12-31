spool sales.lst
 SET ECHO ON
 DROP TABLE sales CASCADE CONSTRAINTS;
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
  
  DESC sales
 
 DROP SEQUENCE sales_sequence; 
 CREATE SEQUENCE sales_sequence 
  MINVALUE 1
  MAXVALUE 1000
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

INSERT INTO sales (sale_id, contract_id, sale_date, actual_amount, home_id,
                      agent_id, customer_id)
     VALUES (sales_sequence.nextval, '235454', TO_DATE('23-APR-2015', 'DD-MM-YYYY'),
              273978.00, 1, 3, 2);

INSERT INTO sales (sale_id, contract_id, sale_date, actual_amount, home_id,
                      agent_id, customer_id)
        VALUES (sales_sequence.nextval, '2345', TO_DATE('21-NOV-2005', 'DD-MM-YYYY'),
                167983.00, 2, 1, 1);

SELECT * FROM sales;
COMMIT
SPOOL OFF