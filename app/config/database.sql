CREATE DATABASE IF NOT EXISTS bank_7;
USE bank_7;

-- Address Table
CREATE TABLE address (
    id VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50),
    district VARCHAR(50),
    street VARCHAR(50),
    code_postal VARCHAR(10),
    email VARCHAR(50),
    telephone INT
);

-- Permission Table
CREATE TABLE permission (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(255)

);


-- Role Table
CREATE TABLE role (
    name VARCHAR(50) PRIMARY KEY
);




-- Bank Table
CREATE TABLE bank (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(20) UNIQUE,
    logo VARCHAR(100)
);

-- Agency Table
CREATE TABLE agency (
    id VARCHAR(50) PRIMARY KEY,
    longitude DECIMAL(9,6),
    latitude DECIMAL(9,6),
    bank_id VARCHAR(50),
    address_id VARCHAR(50),
    FOREIGN KEY (bank_id) REFERENCES bank(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (address_id) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE


);

-- Distributer Table
CREATE TABLE distributer (
    id VARCHAR(50) PRIMARY KEY,
    longitude DECIMAL(9,6),
    latitude DECIMAL(9,6),
    adresse VARCHAR(100),
    bank_id VARCHAR(50),
    FOREIGN KEY (bank_id) REFERENCES bank(id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE user (
    id VARCHAR(50) PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    address_id VARCHAR(50),
    agency_id VARCHAR(50),
    FOREIGN KEY (address_id) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (agency_id) REFERENCES agency(id) ON DELETE CASCADE ON UPDATE CASCADE

);

-- Account Table
CREATE TABLE account (
    id VARCHAR(50) PRIMARY KEY,
    rib VARCHAR(20),
    currency VARCHAR(10),
    balance DECIMAL(10,2),
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Transaction Table
CREATE TABLE transaction (
    id VARCHAR(50) PRIMARY KEY,
    type ENUM('credit', 'debit'),
    amount DECIMAL(10,2),
    account_id VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES account(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE roleOfUser (
    id VARCHAR(50) PRIMARY KEY,
    role_id VARCHAR(50),
    user_id VARCHAR(50),
    FOREIGN KEY (role_id) REFERENCES role(name) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE permissionOfRole (
    id VARCHAR(50) PRIMARY KEY,
    permission_id VARCHAR(50),
    role_id VARCHAR(50),
    FOREIGN KEY (permission_id) REFERENCES permission(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (role_id) REFERENCES role(name) ON DELETE CASCADE ON UPDATE CASCADE
);

