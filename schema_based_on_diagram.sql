-- Create a new database called 'patients'
CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

-- Create a new database called 'medical_histories'
CREATE DATABASE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status varchar(100),
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    PRIMARY KEY(id)
);

-- Create a new database called 'treatments'
CREATE DATABASE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type varchar(100),
    name varchar(100),
    PRIMARY KEY(id)
);
