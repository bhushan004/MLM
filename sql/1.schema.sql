--
-- MLM System
--
-- @author    Adrian Wądrzyk <adrian.wadrzyk@gmail.com>
-- @copyright 2012 Adrian Wądrzyk. All rights reserved.
--

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS states;
CREATE TABLE states (
	state_id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL UNIQUE
)ENGINE=InnoDB DEFAULT CHARSET="utf8";

DROP TABLE IF EXISTS currency;
CREATE TABLE currency (
	currency_id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL UNIQUE,
	rate NUMERIC(11,2) NOT NULL DEFAULT 1,
	active CHAR(1) NOT NULL DEFAULT 1,
	deleted CHAR(1) NOT NULL DEFAULT 0
)ENGINE=InnoDB DEFAULT CHARSET="utf8";

DROP TABLE IF EXISTS documents;
CREATE TABLE documents (
	document_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	employee_id INT UNSIGNED NOT NULL,
	create_date DATETIME NOT NULL,
	name VARCHAR(255) NOT NULL,
	type VARCHAR(255),
	`path` TEXT NOT NULL,
	CONSTRAINT FOREIGN KEY `fk_documents_employee_id` (employee_id)
		REFERENCES employees(employee_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET="utf8";

DROP TABLE IF EXISTS shipment_types;
CREATE TABLE shipment_types (
	shipment_type_id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL UNIQUE,
	active CHAR(1) NOT NULL DEFAULT 1
)ENGINE=InnoDB DEFAULT CHARSET="utf8";

DROP TABLE IF EXISTS shipments;
CREATE TABLE shipments (
	shipment_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	shipment_type_id SMALLINT UNSIGNED NOT NULL,
	create_date DATE NOT NULL,
	street VARCHAR(255),
	city VARCHAR(255),
	postcode CHAR(6),
	state_id TINYINT UNSIGNED NOT NULL,	
	phone_number VARCHAR(15),
	email VARCHAR(255),
	CONSTRAINT FOREIGN KEY `fk_shipments_shipment_type_id` (shipment_type_id)
		REFERENCES shipment_types(shipment_type_id)
		ON UPDATE RESTRICT
		ON DELETE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET="utf8";

DROP TABLE IF EXISTS premium_types;
CREATE TABLE premium_types (
	premium_type_id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL UNIQUE,
	period_in_months TINYINT UNSIGNED NOT NULL,
	active CHAR(1) NOT NULL DEFAULT 1
)ENGINE=InnoDB DEFAULT CHARSET="utf8";

SET FOREIGN_KEY_CHECKS = 1;
