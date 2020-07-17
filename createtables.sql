Drop database IF EXIST Couriers;
create database Couriers;
use Couriers;

CREATE TABLE customer_t
(customer_id INTEGER(11) NOT NULL,
 customer_name VARCHAR(25) NOT NULL,
 customer_address VARCHAR(30),
 customer_No INTEGER(11),
 CONSTRAINT customer_pk PRIMARY KEY (customer_ID));

CREATE TABLE sender_t
(
  sender_id INTEGER(11) NOT NULL,
  customer_id INTEGER (11) NOT NULL,
  CONSTRAINT sender_pk PRIMARY KEY (sender_id),
  CONSTRAINT sender_fk FOREIGN KEY (customer_id)
);
CREATE TABLE recipient_t
(
  recipient_id INTEGER(11) NOT NULL,
  customer_id INTEGER (11) NOT NULL,
  CONSTRAINT recipient_pk PRIMARY KEY (recipient_id),
  CONSTRAINT recipient_fk FOREIGN KEY (customer_id)
);


CREATE TABLE deliveries_t
(order_id INTEGER(11) NOT NULL,
 order_date DATE,
 sender_id INTEGER(11),
 recipient_id INTEGER(11),
 weight_grams INTEGER(11),
 weight_id INTEGER(11),
 Rate_id INTEGER(11),
 date_delivered DATE,
 staff_id INTEGER(11),
 cost INTEGER(11),
 CONSTRAINT deliveries_pk PRIMARY KEY (order_ID),
 CONSTRAINT deliveries_fk1 FOREIGN KEY (sender_id) REFERENCES customer_t(customer_ID),
 CONSTRAINT deliveries_fk2 FOREIGN KEY (recipient_id) REFERENCES customer_t(customer_ID));

CREATE TABLE staff_t
(staff_id INTEGER(11) NOT NULL,
 staff_LN VARCHAR(11),
 staff_FN VARCHAR(11),
 CONSTRAINT staff_pk PRIMARY KEY (staff_id));

CREATE TABLE rate_t
(rate_id INTEGER(11) NOT NULL,
 service_id INTEGER(11) NOT NULL,
 package_type VARCHAR(11),
 base_cost INTEGER(11),
 threshold INTEGER(11),
 succeeding_weight_interval INTEGER(11),
 extra_cost INTEGER(11),
 distance INTEGER(11),
 CONSTRAINT rate_pk PRIMARY KEY (rate_id),
 CONSTRAINT rate_fk1 FOREIGN KEY (service_id) REFERENCES service_t(service_ID),
 CONSTRAINT rate_fk2 FOREIGN KEY (location_origin) REFERENCES area_t(location),
  CONSTRAINT rate_fk3 FOREIGN KEY (location_destination) REFERENCES area_t(location));



CREATE TABLE area_t
(Area_id INTEGER(11) NOT NULL,
 location VARCHAR(11),
 location_value INTEGER (3),
 CONSTRAINT area_pk PRIMARY KEY (area_id));

 CREATE TABLE destination_t
 (Destination_id INTEGER(11) NOT NULL,
  area_id INTEGER(11) NOT NULL,
  CONSTRAINT destination_pk PRIMARY KEY (Destination_id),
  CONSTRAINT destination_fk FOREIGN KEY (area_id)
);

CREATE TABLE origin_t
(origin_id INTEGER(11) NOT NULL,
 area_id INTEGER(11) NOT NULL,
 CONSTRAINT origin_pk PRIMARY KEY (origin_id),
 CONSTRAINT origin_fk FOREIGN KEY (area_id)
);

 CREATE TABLE service_t
 (service_id INTEGER(11) NOT NULL,
  service_type VARCHAR(11),
  delivery_time VARCHAR(11),

  CONSTRAINT service_pk PRIMARY KEY (service_id));
