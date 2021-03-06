-- Create a new TABLE called 'patients'
CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

-- Create a new TABLE called 'medical_histories'
CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status varchar(100),
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    PRIMARY KEY(id)
);
CREATE INDEX medical_histories_patient_id ON medical_histories(patient_id);

-- Create a new TABLE called 'treatments'
CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type varchar(100),
    name varchar(100),
    PRIMARY KEY(id)
);

-- Create a new TABLE called 'invoices'
CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    PRIMARY KEY(id)
);
CREATE INDEX invoices_medical_history_id ON invoices(medical_history_id);

-- Create a new TABLE called 'invoice_items'
CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id),
    PRIMARY KEY(id)
);
CREATE INDEX invoice_items_invoice_id ON invoice_items(invoice_id);
CREATE INDEX invoice_items_treatment_id ON invoice_items(treatment_id);

-- Create a new TABLE called 'mid'
CREATE TABLE mid (
    medical_history_id INT,
    treatment_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
CREATE INDEX mid_medical_history_id ON mid(medical_history_id);
CREATE INDEX mid_treatment_id ON mid(treatment_id);
