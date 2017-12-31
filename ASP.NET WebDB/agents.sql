spool agents.lst
SET ECHO ON
DROP TABLE agents CASCADE CONSTRAINTS;
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
  
DESC agents

DROP SEQUENCE agents_sequence;
CREATE SEQUENCE agents_sequence 
  MINVALUE 1
  MAXVALUE 1000
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

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

 SELECT * FROM agents;
 
 COMMIT

 SPOOL OFF

