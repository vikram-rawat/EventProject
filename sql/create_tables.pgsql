-- Database: event_shoop

-- DROP DATABASE event_shoop;

CREATE DATABASE event_shoop
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- SCHEMA: statics

-- DROP SCHEMA statics ;

CREATE SCHEMA statics
AUTHORIZATION postgres;

    -- Table: statics.country

-- DROP TABLE statics.country;

CREATE TABLE statics.country
(
    countryid smallserial,
    countryname text NOT NULL,
    CONSTRAINT pk_country PRIMARY KEY (countryid),
    CONSTRAINT unq_country_name UNIQUE (countryname)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE statics.country
    OWNER to postgres;

-- Table: statics.states

-- DROP TABLE statics.states;

CREATE TABLE statics.states
(
    statesid serial,
    countryid integer,
    states_name text NOT NULL,
    CONSTRAINT pk_states_id PRIMARY KEY (statesid),
    CONSTRAINT unq_states_name UNIQUE (countryid, states_name)
,
    CONSTRAINT fk_country_id FOREIGN KEY (countryid)
        REFERENCES statics.country (countryid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE statics.states
    OWNER to postgres;

-- Table: statics.districts

-- DROP TABLE statics.districts;

CREATE TABLE statics.districts
(
    districtid serial,
    statesid integer,
    district_name text NOT NULL,
    CONSTRAINT pk_district_id PRIMARY KEY (districtid),
    CONSTRAINT unq_district_name UNIQUE (statesid, district_name)
,
    CONSTRAINT fk_states_id FOREIGN KEY (statesid)
        REFERENCES statics.states (statesid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE statics.districts
    OWNER to postgres;

-- Table: statics.city

-- DROP TABLE statics.city;

CREATE TABLE statics.city
(
    cityid serial,
    districtid integer,
    city_name text NOT NULL,
    CONSTRAINT pk_city_id PRIMARY KEY (cityid),
    CONSTRAINT unq_city_name UNIQUE (districtid, city_name)
,
    CONSTRAINT fk_city_id FOREIGN KEY (districtid)
        REFERENCES statics.districts (districtid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE statics.city
    OWNER to postgres;

-- Table: statics.services
-- DROP TABLE statics.services;
CREATE TABLE statics.services(
    serviceid serial,
    service_name text not null,
    PRIMARY KEY (service_name)
)
 