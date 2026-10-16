-- Belajar SQL: fungsi agregat, GROUP BY, HAVING

SELECT COUNT(*) AS total, AVG(ipk) AS rata2, MAX(ipk) AS tertinggi, MIN(ipk) AS terendah
FROM mahasiswa;

-- per jurusan
SELECT jurusan,
       COUNT(*)           AS jumlah,
       ROUND(AVG(ipk), 2) AS rata2_ipk
FROM mahasiswa
GROUP BY jurusan
ORDER BY rata2_ipk DESC;

-- HAVING = filter setelah dikelompokkan (WHERE = sebelum)
SELECT angkatan, COUNT(*) AS jumlah
FROM mahasiswa
GROUP BY angkatan
HAVING COUNT(*) >= 2;

-- total SKS yang diambil tiap mahasiswa
SELECT m.nama, SUM(mk.sks) AS total_sks
FROM krs k
JOIN mahasiswa m    ON m.id = k.mahasiswa_id
JOIN mata_kuliah mk ON mk.kode = k.kode_mk
GROUP BY m.id, m.nama;
