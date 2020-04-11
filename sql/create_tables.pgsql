-- start by creating the database and schema
-- CREATE DATABASE event_shopp

-- add extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION pgcrypto;

-- SCHEMA: details
-- DROP SCHEMA details ;
CREATE SCHEMA details;

-- SCHEMA: dimensions
-- DROP SCHEMA dimensions ;
CREATE SCHEMA dimensions;

-- SCHEMA: dimensions
-- DROP SCHEMA dimensions ;
CREATE SCHEMA proc_func;

-- Table: dimensions.country
-- DROP TABLE dimensions.country;

CREATE TABLE dimensions.country
(
    countryid smallserial PRIMARY KEY,
    countryname text NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by text not null,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    modified_by text not null,
    is_deleted BOOLEAN not null
);

-- Table: dimensions.states
-- DROP TABLE dimensions.states;

CREATE TABLE dimensions.states
(
    statesid serial PRIMARY KEY,
    countryid integer REFERENCES dimensions.country (countryid),
    states_name text NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by text not null,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    modified_by text not null,
    is_deleted BOOLEAN not null
);

-- Table: dimensions.districts

-- DROP TABLE dimensions.districts;

CREATE TABLE dimensions.districts
(
    districtid serial PRIMARY KEY,
    statesid integer REFERENCES dimensions.states (statesid),
    district_name text NOT NULL  UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by text not null,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    modified_by text not null,
    is_deleted BOOLEAN not null
);

-- Table: dimensions.city
-- DROP TABLE dimensions.city;

CREATE TABLE dimensions.city
(
    cityid serial PRIMARY KEY,
    districtid integer REFERENCES dimensions.districts (districtid),
    city_name text NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by text not null,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    modified_by text not null,
    is_deleted BOOLEAN not null,
    CONSTRAINT unq_city_name UNIQUE (districtid, city_name)
);

-- Table: dimensions.services
-- DROP TABLE dimensions.services;

CREATE TABLE dimensions.services(
    serviceid serial,
    service_name text not null,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by text not null,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    modified_by text not null,
    is_deleted BOOLEAN not null,
    PRIMARY KEY (service_name)
);

-- Table: detail.userdetails
-- DROP TABLE detail.userdetails;

CREATE TABLE details.main_user
(
  super_id UUID NOT NULL DEFAULT uuid_generate_v4() ,
    org_name text not null,
    user_name  text not null PRIMARY KEY,
	passwords  text not null,
    mainPhone text not null,
    email text null,
    category text[] null,
    add_info JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by text not null,
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    modified_by text not null,
    is_deleted BOOLEAN not null
);