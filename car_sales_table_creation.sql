--Table creations --Alejandro Beltran

--First level tables
CREATE TABLE salesperson (
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	sales_hire_date DATE
); 

CREATE TABLE mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	mech_hire_date DATE
);

CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	birth_date DATE,
	email VARCHAR(150)
);

CREATE TABLE services (
	services_id SERIAL PRIMARY KEY,
	services_name VARCHAR(150)
);

CREATE TABLE car (
	vin_id SERIAL PRIMARY KEY,
	color VARCHAR(100),
	make VARCHAR(100),
	model VARCHAR(100),
	_year NUMERIC(4)
);

CREATE TABLE parts (
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(150),
	part_cost NUMERIC(10,2),
	part_quantity INTEGER
);

--Second level tables
CREATE TABLE sale_invoice (
	sale_invoice_id SERIAL PRIMARY KEY,
	date_sold DATE,
	amount NUMERIC(10,2),
	msrp NUMERIC(10,2),
	customer_id INTEGER NOT NULL, 
	vin_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(vin_id) REFERENCES car(vin_id)
);

CREATE TABLE service_invoice (
	service_invoice_id SERIAL PRIMARY KEY,
	date_serviced DATE,
	customer_id INTEGER NOT NULL, 
	part_id INTEGER NOT NULL,
	vin_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(part_id) REFERENCES parts(part_id),
	FOREIGN KEY(vin_id) REFERENCES car(vin_id)
);


--Third level tables
CREATE TABLE salesperson_invoice (
	salesperson_id INTEGER NOT NULL,
	sale_invoice_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(sale_invoice_id) REFERENCES sale_invoice(sale_invoice_id)
);

CREATE TABLE labor (
	service_invoice_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	services_id INTEGER NOT NULL,
	labor_cost NUMERIC(10,2),
	FOREIGN KEY(service_invoice_id) REFERENCES service_invoice(service_invoice_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(services_id) REFERENCES services(services_id)
);




