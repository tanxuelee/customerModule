CREATE DATABASE customerDatabase;
USE customerDatabase;

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    ic_number VARCHAR(14) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(100) NOT NULL,
    address_country ENUM('Malaysia', 'Singapore') NOT NULL,
    address_postcode VARCHAR(20) NOT NULL
);

INSERT INTO customers (name, ic_number, date_of_birth, address, address_country, address_postcode)
VALUES
    ('Henry Goh', '950712123456', '1995-07-12', 'No 67, Jalan Lurus', 'Malaysia', '65000'),
    ('Grace Chan', '941010123456', '1994-10-10', 'No 45, Jalan Utama', 'Malaysia', '55000'),
    ('Victor Chua', 'S1234567A', '1990-01-01', 'No 12, Orchard Road', 'Singapore', '238832'),
    ('Linda Seah', '901112123456', '1990-11-12', 'No 34, Jalan Sultan', 'Malaysia', '70000'),
    ('Uma Wong', '950519123456', '1995-05-19', 'No 89, Jalan Permai', 'Malaysia', '60000'),
    ('David Lim', 'S9012345I', '1998-09-09', 'No 78, Serangoon', 'Singapore', '556083'),
    ('Wendy Koh', 'S2345678B', '1991-02-02', 'No 34, Bukit Timah Road', 'Singapore', '259711'),
    ('Alice Tan', '880321123456', '1988-03-21', 'No 78, Jalan Bintang', 'Malaysia', '50000'),
    ('Yvonne Tan', 'S4567890D', '1993-04-04', 'No 78, Jurong East', 'Singapore', '609607'),
    ('John Lee', '901234123456', '1990-12-12', 'No 45, Jalan Melaka', 'Malaysia', '75000'),
    ('Abby Lee', 'S6789012F', '1995-06-06', 'No 12, Woodlands', 'Singapore', '738073'),
    ('Peter Low', '890216123456', '1989-02-16', 'No 90, Jalan Setia', 'Malaysia', '85000'),
    ('Oscar Chua', '950915123456', '1995-09-15', 'No 89, Jalan Pelangi', 'Malaysia', '75000'),
    ('Rachel Teo', '930707123456', '1993-07-07', 'No 34, Jalan Indah', 'Malaysia', '65000'),
    ('Chloe Tan', 'S8901234H', '1997-08-08', 'No 56, Hougang', 'Singapore', '530102'),
    ('Eve Wong', '921230123456', '1992-12-30', 'No 123, Jalan Merdeka', 'Malaysia', '80000'),
    ('Queen Lee', '901205123456', '1990-12-05', 'No 12, Jalan Utama', 'Malaysia', '95000'),
    ('Bob Lim', '930814123456', '1993-08-14', 'No 32, Jalan Mawar', 'Malaysia', '60000'),
    ('Tommy Goh', '941128123456', '1994-11-28', 'No 78, Jalan Sejahtera', 'Malaysia', '50000'),
    ('Kim Lim', '891230123456', '1989-12-30', 'No 23, Jalan Taming', 'Malaysia', '95000'),
    ('Xavier Lim', 'S3456789C', '1992-03-03', 'No 56, Clementi Road', 'Singapore', '129789'),
    ('Mike Tan', '931111123456', '1993-11-11', 'No 56, Jalan Duta', 'Malaysia', '60000'),
    ('Brian Goh', 'S7890123G', '1996-07-07', 'No 34, Ang Mo Kio', 'Singapore', '569933'),
    ('Nancy Foo', '941001123456', '1994-10-01', 'No 78, Jalan Kenanga', 'Malaysia', '50000'),
    ('Zack Foo', 'S5678901E', '1994-05-05', 'No 90, Tampines', 'Singapore', '529286'),
    ('Chris Ong', '870511123456', '1987-05-11', 'No 90, Jalan Semarak', 'Malaysia', '70000'),
    ('Sam Lim', '891019123456', '1989-10-19', 'No 56, Jalan Sentosa', 'Malaysia', '70000'),
    ('Jack Yeo', '920909123456', '1992-09-09', 'No 12, Jalan Tropicana', 'Malaysia', '85000'),
    ('Ivy Teo', '880210123456', '1988-02-10', 'No 89, Jalan Damai', 'Malaysia', '75000'),
    ('Emily Wong', 'S0123456J', '1999-10-10', 'No 90, Pasir Ris', 'Singapore', '519111');

CREATE INDEX idx_ic_number ON customers (ic_number);

DELIMITER //

CREATE PROCEDURE GetAllCustomers()
BEGIN
    SELECT * FROM customers;
END //

DELIMITER ;
