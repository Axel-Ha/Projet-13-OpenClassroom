CREATE DATABASE yourcaryourway;

CREATE TABLE Users (
    id INT PRIMARY KEY,
    firstname VARCHAR(50)NOT NULL,
    lastname VARCHAR(50)NOT NULL,
    birthdate DATENOT NULL,
    email VARCHAR(100)NOT NULL,
    password VARCHAR(255)NOT NULL,
    phone_number BIGINT NOT NULL,
    city VARCHAR(50) NOT NULL,
    address VARCHAR(100)NOT NULL,
    postcode VARCHAR(10)NOT NULL,
    created_at TIMESTAMPNOT NULL,
    role VARCHAR(20) DEFAULT 'CLIENT'
);

CREATE TABLE Vehicles (
    id INT PRIMARY KEY,
    agency_id INT,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    transmission VARCHAR(5) NOT NULL,
    fuel VARCHAR(5) NOT NULL,
    type VARCHAR(5) NOT NULL,
    category VARCHAR(5) NOT NULL,
    acriss VARCHAR(10) NOT NULL,
    FOREIGN KEY (agency_id) REFERENCES Agencies(id)
);

CREATE TABLE Agencies (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    phone_number BIGINT NOT NULL
);

CREATE TABLE Reservations (
    id INT PRIMARY KEY,
    user_id INT,
    departure_agency_id INT NOT NULL,
    return_agency_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_at TIMESTAMP NOT NULL,
    end_at TIMESTAMP NOT NULL,
    status VARCHAR(40) NOT NULL,
    price INT NOT NULL,
    payment_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (departure_agency_id) REFERENCES Agencies(id),
    FOREIGN KEY (return_agency_id) REFERENCES Agencies(id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(id),
    FOREIGN KEY (payment_id) REFERENCES Payments(reservation_id)
);

CREATE TABLE Payments (
    reservation_id INT PRIMARY KEY,
    stripe_invoice_number INT NOT NULL,
    price INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(id)
);

CREATE TABLE Tickets (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    customer_service_id INT NOT NULL,
    topic VARCHAR(255),
    status VARCHAR(40) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL,
    solved_at TIMESTAMP ,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Messages (
    id INT PRIMARY KEY,
    ticket_id INT,
    sender_id INT,
    content TEXT,
    created_at TIMESTAMP,
    FOREIGN KEY (ticket_id) REFERENCES Tickets(id),
    FOREIGN KEY (sender_id) REFERENCES Users(id)
);
