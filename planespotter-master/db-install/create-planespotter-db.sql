CREATE DATABASE planespotter;

USE planespotter;

CREATE TABLE MASTER (
	'N-NUMBER' VARCHAR(255) NOT NULL,
	SERIAL_NUMBER VARCHAR(255) NULL,
	MFR_MDL_CODE VARCHAR(255) NULL,
	ENG_MFR_MDL VARCHAR(255) NULL,
	YEAR_MFR VARCHAR(255) NULL,
	TYPE_REGISTRANT VARCHAR(255) NULL,
	NAME VARCHAR(255) NULL,
	STREET VARCHAR(255) NULL,
	STREET2 VARCHAR(255) NULL,
	CITY VARCHAR(255) NULL,
	STATE VARCHAR(255) NULL,
	ZIP_CODE VARCHAR(255) NULL,
	REGION VARCHAR(255) NULL,
	COUNTY VARCHAR(255) NULL,
	COUNTRY VARCHAR(255)NULL,
	LAST_ACTION_DATE VARCHAR(255) NULL,
	CERT_ISSUE_DATE VARCHAR(255) NULL,
	CERTIFICATION VARCHAR(255) NULL,
	TYPE_AIRCRAFT VARCHAR(255) NULL,
	TYPE_ENGINE VARCHAR(255) NULL,
	STATUS_CODE VARCHAR(255) NULL,
	MODE_S_CODE VARCHAR(255) NULL,
	FRACT_OWNER VARCHAR(255) NULL,
	AIR_WORTH_DATE VARCHAR(255) NULL,
	'OTHER_NAMES(1)' VARCHAR(255) NULL,
	'OTHER_NAMES(2)' VARCHAR(255) NULL,
	'OTHER_NAMES(3)' VARCHAR(255) NULL,
	'OTHER_NAMES(4)' VARCHAR(255) NULL,
	'OTHER_NAMES(5)' VARCHAR(255) NULL,
	EXPIRATION_DATE VARCHAR(255) NULL,
	UNIQUE_ID VARCHAR(255) NULL,
	KIT_MFR VARCHAR(255) NULL,
	KIT_MODEL VARCHAR(255) NULL,
	MODE_S_CODE_HEX VARCHAR(255) NULL,
	PRIMARY KEY ('N-NUMBER')
);

LOAD DATA LOCAL INFILE 'MASTER.txt'
INTO TABLE MASTER
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE ACFTREF (
	CODE VARCHAR(255) NOT NULL,
	MFR VARCHAR(255) NULL,
	MODEL VARCHAR(255) NULL,
	'TYPE-ACFT' VARCHAR(255) NULL,
	'TYPE-ENG' VARCHAR(255) NULL,
	'AC-CAT' VARCHAR(255) NULL,
	'BUILD-CERT-IND' VARCHAR(255) NULL,
	'NO-ENG' VARCHAR(255) NULL,
	'NO-SEATS' VARCHAR(255) NULL,
	'AC-WEIGHT' VARCHAR(255) NULL,
	SPEED VARCHAR(255) NULL,
	PRIMARY KEY (CODE)
);

LOAD DATA LOCAL INFILE 'ACFTREF.txt'
INTO TABLE ACFTREF
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE USER 'planespotter'@'%' IDENTIFIED BY 'VMware1!';
GRANT ALL PRIVILEGES ON planespotter.* TO 'planespotter'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

SET GLOBAL max_connect_errors=100000;
SET GLOBAL max_connections = 400;
