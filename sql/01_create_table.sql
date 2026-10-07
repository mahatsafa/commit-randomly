-- Belajar SQL: membuat tabel & mengisi data (dialek MySQL/MariaDB)

CREATE TABLE mahasiswa (
    id        INT AUTO_INCREMENT PRIMARY KEY,
    nama      VARCHAR(100) NOT NULL,
    jurusan   VARCHAR(50)  NOT NULL,
    angkatan  YEAR         NOT NULL,
    ipk       DECIMAL(3,2) CHECK (ipk BETWEEN 0 AND 4),
    dibuat    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE mata_kuliah (
    kode  CHAR(6) PRIMARY KEY,
    nama  VARCHAR(100) NOT NULL,
    sks   TINYINT NOT NULL DEFAULT 3
);

INSERT INTO mahasiswa (nama, jurusan, angkatan, ipk) VALUES
    ('Gusto',  'Informatika',     2023, 3.60),
    ('Ani',    'Informatika',     2022, 3.85),
    ('Budi',   'Sistem Informasi', 2023, 3.10),
    ('Cici',   'Sistem Informasi', 2021, 2.95),
    ('Dodi',   'Teknik Komputer', 2022, 3.40);

INSERT INTO mata_kuliah VALUES
    ('IF101', 'Algoritma',       4),
    ('IF202', 'Basis Data',      3),
    ('IF303', 'Jaringan Komputer', 3);
