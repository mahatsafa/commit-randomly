-- Belajar SQL: relasi antar tabel & JOIN

CREATE TABLE krs (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    mahasiswa_id INT NOT NULL,
    kode_mk     CHAR(6) NOT NULL,
    nilai       CHAR(1),
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id),
    FOREIGN KEY (kode_mk) REFERENCES mata_kuliah(kode)
);

INSERT INTO krs (mahasiswa_id, kode_mk, nilai) VALUES
    (1, 'IF101', 'A'), (1, 'IF202', 'B'),
    (2, 'IF101', 'A'), (2, 'IF303', 'A'),
    (3, 'IF202', 'C');

-- INNER JOIN: hanya yang punya pasangan
SELECT m.nama, mk.nama AS matkul, k.nilai
FROM krs k
JOIN mahasiswa m    ON m.id = k.mahasiswa_id
JOIN mata_kuliah mk ON mk.kode = k.kode_mk
ORDER BY m.nama;

-- LEFT JOIN: semua mahasiswa, walau belum ambil matkul
SELECT m.nama, COUNT(k.id) AS jumlah_matkul
FROM mahasiswa m
LEFT JOIN krs k ON k.mahasiswa_id = m.id
GROUP BY m.id, m.nama;

-- cari mahasiswa yang belum mengambil matkul apa pun
SELECT m.nama
FROM mahasiswa m
LEFT JOIN krs k ON k.mahasiswa_id = m.id
WHERE k.id IS NULL;
