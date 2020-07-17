DELETE FROM customer_t;
DELETE FROM deliveries_t;
DELETE FROM staff_t;
DELETE FROM rate_t;
DELETE FROM area_t;
DELETE FROM service_t;

INSERT INTO staff_t
VALUES (1, 'Gamboa', 'Kim');

INSERT INTO area_t
VALUES (1, 'Luzon',1);

INSERT INTO area_t
VALUES (2, 'Visayas',2);

INSERT INTO area_t
VALUES (3, 'Mindanao',3);
