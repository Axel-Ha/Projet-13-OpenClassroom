CREATE DATABASE yourcaryourway;

CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number BIGINT NOT NULL,
    city VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role VARCHAR(20) DEFAULT 'CLIENT'
);

CREATE TABLE Agencies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    phone_number BIGINT NOT NULL
);

CREATE TABLE Vehicles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    agency_id INT NOT NULL,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    transmission VARCHAR(5) NOT NULL,
    fuel VARCHAR(5) NOT NULL,
    type VARCHAR(5) NOT NULL,
    category VARCHAR(5) NOT NULL,
    acriss VARCHAR(10) NOT NULL,
    FOREIGN KEY (agency_id) REFERENCES Agencies(id)
);

CREATE TABLE Reservations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    departure_agency_id INT NOT NULL,
    arrival_agency_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_at TIMESTAMP NOT NULL,
    end_at TIMESTAMP NOT NULL,
    status VARCHAR(40) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    payment_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (departure_agency_id) REFERENCES Agencies(id),
    FOREIGN KEY (arrival_agency_id) REFERENCES Agencies(id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(id)
);

CREATE TABLE Payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reservation_id INT NOT NULL,
    stripe_invoice_number VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(id)
);

CREATE TABLE Refund (
    id INT PRIMARY KEY AUTO_INCREMENT,
    payment_id INT NOT NULL,
    refund_amount DECIMAL(10, 2) NOT NULL,
    refund_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    refund_status VARCHAR(50) NOT NULL,
    reason TEXT,
    end_at TIMESTAMP,
    FOREIGN KEY (payment_id) REFERENCES Payments(id)
);
