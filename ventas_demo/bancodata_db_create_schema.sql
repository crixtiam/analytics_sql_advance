-- Tabla de trabajos
CREATE TABLE IF NOT EXISTS TABLE_JOB (
    job_id INT PRIMARY KEY,
    job_name VARCHAR(100) NOT NULL
);

-- Tabla de estado civil
CREATE TABLE IF NOT EXISTS TABLE_MARITAL (
    marital_id INT PRIMARY KEY,
    marital_status VARCHAR(50) NOT NULL
);

-- Tabla principal con llaves foráneas
CREATE TABLE IF NOT EXISTS TABLE_DATA_BANK (
    data_id INT AUTO_INCREMENT PRIMARY KEY,
    age INT,
    education VARCHAR(100),
    `default` VARCHAR(10),
    housing VARCHAR(10),
    loan VARCHAR(10),
    contact VARCHAR(50),
    month VARCHAR(20),
    day_of_week VARCHAR(20),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(50),
    euribor3m DECIMAL(6,3),
    nr_employed INT,
    y VARCHAR(10),
    job_id INT,
    marital_id INT,
    CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES TABLE_JOB(job_id),
    CONSTRAINT fk_marital FOREIGN KEY (marital_id) REFERENCES TABLE_MARITAL(marital_id)
);

-- Insertar sin especificar ID (se generan solos: 1,2,3...)
INSERT INTO TABLE_JOB (job_id, job_name) VALUES
(0, 'housemaid'),
(1, 'services'),
(2, 'admin.'),
(3, 'blue-collar'),
(4, 'technician'),
(5, 'retired'),
(6, 'management'),
(7, 'unemployed'),
(8, 'self-employed'),
(9, 'unknown'),
(10, 'entrepreneur'),
(11, 'student');
-- etc... completa con todos los jobs


INSERT INTO TABLE_MARITAL (marital_id, marital_status)
VALUES
(0, 'married'),
(1, 'single'),
(2, 'divorced'),
(3, 'unknown');

-- drop table table_data_bank, table_job, table_marital

SELECT * FROM table_data_bank