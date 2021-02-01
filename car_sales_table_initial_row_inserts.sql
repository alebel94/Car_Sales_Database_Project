INSERT INTO salesperson (
	salesperson_id,
	first_name,
	last_name,
	sales_hire_date
) VALUES (
		1,
		'Josh',
		'Towbin',
		'7/5/1998'
),
(
		2,
		'Anne',
		'Cyril',
		'6/28/2007'

);


INSERT INTO mechanic (
	mechanic_id,
	first_name,
	last_name,
	mech_hire_date
) VALUES (
		1,
		'Arthur',
		'Fonzarelli',
		'10/3/2001'
),
(
		2,
		'Daniel',
		'Chapman',
		'8/15/2014'

);
	
	
INSERT INTO customer (
	customer_id,
	first_name,
	last_name,
	birth_date,
	email 
) VALUES (
		1,
		'Jack',
		'Gunn',
		'11/17/1986',
		'gunners374@outlook.com'
),
(
		2,
		'Danielle',
		'Bennett',
		'10/10/1993',
		'danielleben7@gmail.com'

);
	

INSERT INTO services (
	services_id,
	services_name 
) VALUES (
		1,
		'oil_change'
);


INSERT INTO car (
	vin_id,
	color,
	make,
	model,
	_year 
) VALUES (
		1,
		'black',
		'toyota',
		'corolla',
		2014
),
(
		2,
		'white',
		'toyota',
		'camry',
		2020
);


INSERT INTO parts (
	part_id,
	part_name,
	part_cost,
	part_quantity
) VALUES (
		1,
		'cylinder',
		239.99,
		1
);


INSERT INTO  sale_invoice (
	sale_invoice_id,
	date_sold,
	amount,
	msrp,
	customer_id, 
	vin_id
) VALUES (
		1,
		'12/26/2019',
		21999.95,
		24970.00,
		1,
		2
);


INSERT INTO  service_invoice  (
	service_invoice_id,
	date_serviced,
	customer_id, 
	part_id,
	vin_id
) VALUES (
		1,
		'12/30/2019',
		2,
		1,
		1
);

	
INSERT INTO  salesperson_invoice (
	salesperson_id,
	sale_invoice_id
) VALUES (
		2,
		1
);

	
INSERT INTO  labor (
	service_invoice_id,
	mechanic_id,
	services_id,
	labor_cost 
) VALUES (	
		1,
		2,
		1,
		867.95
);

