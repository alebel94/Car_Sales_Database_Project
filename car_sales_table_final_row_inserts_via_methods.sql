--ADDING VALUES AFTER THE TABLE IS MADE VIA FUNCTIONS

--add two new customers via function
CREATE OR REPLACE FUNCTION add_customer (_first_name VARCHAR, _last_name VARCHAR, _birth_date DATE, _email VARCHAR)
RETURNS void
AS $$

BEGIN
	INSERT INTO customer (first_name, last_name, birth_date, email)
	VALUES (_first_name, _last_name, _birth_date, _email);
END;
$$
LANGUAGE plpgsql;

SELECT add_customer('Jason',  'Sharpless',  '9/19/1966', 'sharplessglassess@aol.com');
SELECT add_customer('Leslie',  'Bernard',  '2/7/1978', 'leslie4093@gmail.com');


--Inserting services via functions
CREATE OR REPLACE FUNCTION add_services (_services_name VARCHAR)
RETURNS void
AS $$
BEGIN
	INSERT INTO services (services_name)
	VALUES (_services_name);
END;
$$
LANGUAGE plpgsql;

SELECT add_services('cabin_air_filter_replacement');
--add two new cars for two new customers via function
CREATE OR REPLACE FUNCTION add_car (_color VARCHAR, _make VARCHAR, _model VARCHAR, _year2 NUMERIC(4))
RETURNS void
AS $$
BEGIN
	INSERT INTO car (color, make, model, _year)
	VALUES (_color, _make, _model, _year2);
END;
$$
LANGUAGE plpgsql;

SELECT add_car('blue',  'toyota',  'C-HR', 2020);
SELECT add_car('black',  'toyota',  'yaris', 2016);

--Inserting parts via functions
CREATE OR REPLACE FUNCTION add_parts (_part_name VARCHAR, _part_cost NUMERIC(10,2), _part_quantity INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO parts (part_name, part_cost, part_quantity)
	VALUES (_part_name, _part_cost, _part_quantity);
END;
$$
LANGUAGE plpgsql;

SELECT add_parts('filter',  47.00,  1);

--add sale invoice
CREATE OR REPLACE FUNCTION add_sale_invoice (_date_sold DATE, _amount NUMERIC(10,2), _msrp NUMERIC(10,2), _customer_id INTEGER, _vin_id INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO sale_invoice (date_sold, amount, msrp, customer_id, vin_id)
	VALUES (_date_sold, _amount, _msrp, _customer_id, _vin_id);
END;
$$
LANGUAGE plpgsql;

SELECT add_sale_invoice ('2020-1-3',  16495.00,  17750.00, 3, 3);

--add service invoice
select * from sale_invoice;
CREATE OR REPLACE FUNCTION add_service_invoice (_date_serviced DATE, _customer_id INTEGER, _part_id INTEGER, _vin_id INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO service_invoice (date_serviced, customer_id, part_id, vin_id)
	VALUES (_date_serviced, _customer_id, _part_id, _vin_id);
END;
$$
LANGUAGE plpgsql;

SELECT add_service_invoice ('2020-1-4',  4, 2, 4);

--add salesperson invoice
CREATE OR REPLACE FUNCTION add_salesperson_invoice (_salesperson_id INTEGER, _sale_invoice_id INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO salesperson_invoice (salesperson_id, sale_invoice_id)
	VALUES (_salesperson_id, _sale_invoice_id);
END;
$$
LANGUAGE plpgsql;

SELECT add_salesperson_invoice(1, 2);


--add labor
CREATE OR REPLACE FUNCTION add_labor (_service_invoice_id INTEGER, _mechanic_id INTEGER, _services_id INTEGER, _labor_cost NUMERIC(10,2))
RETURNS void
AS $$
BEGIN
	INSERT INTO labor (service_invoice_id, mechanic_id, services_id, labor_cost)
	VALUES (_service_invoice_id, _mechanic_id, _services_id, _labor_cost);
END;
$$
LANGUAGE plpgsql;

SELECT add_labor(2, 1, 2, 180.50);


