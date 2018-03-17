
--------------------------------------------------------
--  DDL for Sequences
--------------------------------------------------------
   CREATE SEQUENCE  "PBAB"."CINEMA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
   CREATE SEQUENCE  "PBAB"."CITY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
   CREATE SEQUENCE  "PBAB"."HALL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
   CREATE SEQUENCE  "PBAB"."FLR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
   CREATE SEQUENCE  "PBAB"."SEAT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
   CREATE SEQUENCE  "PBAB"."SHW_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
   CREATE SEQUENCE  "PBAB"."ORD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
   CREATE SEQUENCE  "PBAB"."SCH_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
   CREATE SEQUENCE  "PBAB"."TCT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
   
--------------------------------------------------------
--  DDL for Table CITY
--------------------------------------------------------

  CREATE TABLE "PBAB"."CITY" 
   (	"CIT_ID" NUMBER NOT NULL,
	"CIT_NAME" VARCHAR2(100 BYTE) NOT NULL, 
	"CIT_COUNTRY" VARCHAR2(100 BYTE) NOT NULL,
	CONSTRAINT "CITY_PK" PRIMARY KEY ("CIT_ID")
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
  --------------------------------------------------------
--  DDL for Table CINEMA
--------------------------------------------------------

  CREATE TABLE "PBAB"."CINEMA" 
   (	"CIN_ID" NUMBER NOT NULL, 
	"CIN_NAME" VARCHAR2(100 BYTE) NOT NULL,
	"CIN_ICON" BLOB, 
	"CIN_ADDRESS" VARCHAR2(255 BYTE) NOT NULL,
	"CIN_CITY_ID" NUMBER NOT NULL,
	CONSTRAINT "CINEMA_PK" PRIMARY KEY ("CIN_ID"),
	CONSTRAINT "CINEMA_FK" FOREIGN KEY ("CIN_CITY_ID") REFERENCES "PBAB"."CITY" ("CIT_ID")
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("CIN_ICON") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
  
--------------------------------------------------------
--  DDL for Table HALL
--------------------------------------------------------

  CREATE TABLE "PBAB"."HALL" 
   (	"HAL_ID" NUMBER NOT NULL,
	"HAL_CIN_ID" NUMBER NOT NULL,
	"HAL_NAME" VARCHAR2(100 BYTE) NOT NULL,
	"HAL_SITSCOUNT" NUMBER NOT NULL,
	CONSTRAINT "HALL_PK" PRIMARY KEY ("HAL_ID"),
	CONSTRAINT "HALL_FK" FOREIGN KEY ("HAL_CIN_ID") REFERENCES "PBAB"."CINEMA" ("CIN_ID") ON DELETE CASCADE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  
--------------------------------------------------------
--  DDL for Table FLOOR
--------------------------------------------------------
  
  CREATE TABLE "PBAB"."FLOOR" 
   (	"FLR_HAL_ID" NUMBER NOT NULL,
	"FLR_ID" NUMBER NOT NULL,
	"FLR_NAME" VARCHAR2(100 BYTE),
	CONSTRAINT "FLOOR_PK" PRIMARY KEY ("FLR_ID"),
	CONSTRAINT "FLOOR_FK" FOREIGN KEY ("FLR_HAL_ID") REFERENCES "PBAB"."HALL" ("HAL_ID") ON DELETE CASCADE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  
--------------------------------------------------------
--  DDL for Table SEAT
--------------------------------------------------------

 CREATE TABLE "PBAB"."SEAT" 
   (	"SEAT_ID" NUMBER NOT NULL,
	"SEAT_FLR_ID" NUMBER NOT NULL,
	"SEAT_COLUMN" NUMBER NOT NULL,
	"SEAT_NUM" NUMBER NOT NULL,
	"SEAT_ROW" NUMBER NOT NULL,
	"SEAT_TYPE" NUMBER DEFAULT 0 NOT NULL,
	"SEAT_ISACTIVE" NUMBER(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "SEAT_PK" PRIMARY KEY ("SEAT_ID"),
	CONSTRAINT "SEAT_FK" FOREIGN KEY ("SEAT_FLR_ID") REFERENCES "PBAB"."FLOOR" ("FLR_ID") ON DELETE CASCADE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  
--------------------------------------------------------
--  DDL for Table SHOW
-------------------------------------------------------- 
  CREATE TABLE "PBAB"."SHOW" 
   (	"SHW_ID" NUMBER NOT NULL,
	"SHW_NAME" VARCHAR2(100 BYTE) NOT NULL, 
	"SHW_DESCR" VARCHAR2(255 BYTE),
  "SHW_ICON" BLOB,
	CONSTRAINT "SHOW_PK" PRIMARY KEY ("SHW_ID")
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
  LOB ("SHW_ICON") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
  
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------
 
  CREATE TABLE "PBAB"."ORDERS" 
   (	"ORD_ID" NUMBER NOT NULL,
	"ORD_DATE" DATE DEFAULT SYSDATE NOT NULL, 
	"ORD_COMM" VARCHAR2(255 BYTE),
  "ORD_COST" NUMBER NOT NULL,
	CONSTRAINT "ORD_PK" PRIMARY KEY ("ORD_ID")
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
--------------------------------------------------------
--  DDL for Table SCHEDULER
-------------------------------------------------------- 
  
 CREATE TABLE "PBAB"."SCHEDULER" 
   (	"SCH_ID" NUMBER NOT NULL,
  "SCH_HAL_ID" NUMBER NOT NULL,
  "SCH_SHW_ID" NUMBER NOT NULL,
  "SCH_DATE" DATE NOT NULL, 
  "SCH_TIME_FROM" DATE,
  "SCH_TIME_TO" DATE,
  CONSTRAINT "SCH_PK" PRIMARY KEY ("SCH_ID"),
  CONSTRAINT "SCH_FK_HAL" FOREIGN KEY ("SCH_HAL_ID") REFERENCES "PBAB"."HALL" ("HAL_ID"),
  CONSTRAINT "SCH_FK_SHW" FOREIGN KEY ("SCH_SHW_ID") REFERENCES "PBAB"."SHOW" ("SHW_ID")
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

--------------------------------------------------------
--  DDL for Table TICKETS
--------------------------------------------------------  

  CREATE TABLE "PBAB"."TICKETS" 
   (	"TCT_ID" NUMBER NOT NULL,
  "TCT_SEAT_ID" NUMBER NOT NULL,
  "TCT_ORD_ID" NUMBER NOT NULL,
  "TCT_SCH_ID" NUMBER NOT NULL,
  "TCT_PRICE" NUMBER NOT NULL, 
  "TCT_ISSOLD" NUMBER(1,0) DEFAULT 0 NOT NULL,
  CONSTRAINT "TCT_PK" PRIMARY KEY ("TCT_ID"),
  CONSTRAINT "TCT_FK_SEAT" FOREIGN KEY ("TCT_SEAT_ID") REFERENCES "PBAB"."SEAT" ("SEAT_ID"),
  CONSTRAINT "TCT_FK_ORD" FOREIGN KEY ("TCT_ORD_ID") REFERENCES "PBAB"."ORDERS" ("ORD_ID"),
  CONSTRAINT "TCT_FK_SCH" FOREIGN KEY ("TCT_SCH_ID") REFERENCES "PBAB"."SCHEDULER" ("SCH_ID")
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
--------------------------------------------------------
--  DDL for Trigger CINEMA_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PBAB"."CINEMA_TRG" 
BEFORE INSERT ON CINEMA 
FOR EACH ROW

BEGIN
  SELECT CINEMA_SEQ.NEXTVAL
  INTO   :new.CIN_ID
  FROM   dual;
END;
/
ALTER TRIGGER "PBAB"."CINEMA_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger CITY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PBAB"."CITY_TRG" 
BEFORE INSERT ON CITY 
FOR EACH ROW

BEGIN
  SELECT CITY_SEQ.NEXTVAL
  INTO   :new.CIT_ID
  FROM   dual;
END;
/
ALTER TRIGGER "PBAB"."CITY_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger HALL_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PBAB"."HALL_TRG" 
BEFORE INSERT ON HALL 
FOR EACH ROW

BEGIN
  SELECT HALL_SEQ.NEXTVAL
  INTO   :new.HAL_ID
  FROM   dual;
END;
/
ALTER TRIGGER "PBAB"."HALL_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger SEAT_TRG
--------------------------------------------------------

   CREATE OR REPLACE TRIGGER "PBAB"."SEAT_TRG" 
BEFORE INSERT ON SEAT 
FOR EACH ROW

BEGIN
  SELECT SEAT_SEQ.NEXTVAL
  INTO   :new.SEAT_ID
  FROM   dual;
END;
/
ALTER TRIGGER "PBAB"."SEAT_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger FLR_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PBAB"."FLR_TRG" 
BEFORE INSERT ON FLOOR 
FOR EACH ROW

BEGIN
  SELECT FLR_SEQ.NEXTVAL
  INTO   :new.FLR_ID
  FROM   dual;
END;
/
ALTER TRIGGER "PBAB"."FLR_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger SHW_TRG
--------------------------------------------------------

 CREATE OR REPLACE TRIGGER "PBAB"."SHW_TRG" 
BEFORE INSERT ON SHOW 
FOR EACH ROW

BEGIN
  SELECT SHW_SEQ.NEXTVAL
  INTO   :new.SHW_ID
  FROM   dual;
END;
/
ALTER TRIGGER "PBAB"."SHW_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger ORD_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "PBAB"."ORD_TRG" 
BEFORE INSERT ON ORDERS 
FOR EACH ROW

BEGIN
  SELECT ORD_SEQ.NEXTVAL
  INTO   :new.ORD_ID
  FROM   dual;
END;
/
ALTER TRIGGER "PBAB"."ORD_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger SCH_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "PBAB"."SCH_TRG" 
BEFORE INSERT ON SCHEDULER 
FOR EACH ROW

BEGIN
  SELECT SCH_SEQ.NEXTVAL
  INTO   :new.SCH_ID
  FROM   dual;
END;
/
ALTER TRIGGER "PBAB"."SCH_TRG" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TCT_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "PBAB"."TCT_TRG" 
BEFORE INSERT ON TICKETS 
FOR EACH ROW

BEGIN
  SELECT TCT_SEQ.NEXTVAL
  INTO   :new.TCT_ID
  FROM   dual;
END;
/
ALTER TRIGGER "PBAB"."TCT_TRG" ENABLE;

