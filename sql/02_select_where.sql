-- Belajar SQL: SELECT, WHERE, ORDER BY, LIMIT

-- semua kolom
SELECT * FROM mahasiswa;

-- kolom tertentu + alias
SELECT nama AS mahasiswa, ipk AS nilai FROM mahasiswa;

-- filter
SELECT nama, ipk FROM mahasiswa WHERE ipk >= 3.5;

-- beberapa kondisi
SELECT nama, jurusan
FROM mahasiswa
WHERE jurusan = 'Informatika' AND angkatan >= 2022;

-- IN, BETWEEN, LIKE
SELECT nama FROM mahasiswa WHERE jurusan IN ('Informatika', 'Teknik Komputer');
SELECT nama, ipk FROM mahasiswa WHERE ipk BETWEEN 3.0 AND 3.5;
SELECT nama FROM mahasiswa WHERE nama LIKE '%i';   -- diakhiri huruf i

-- urutkan & batasi
SELECT nama, ipk
FROM mahasiswa
ORDER BY ipk DESC
LIMIT 3;

-- kolom hasil hitungan
SELECT nama,
       ipk,
       CASE
           WHEN ipk >= 3.5 THEN 'cumlaude'
           WHEN ipk >= 3.0 THEN 'sangat memuaskan'
           ELSE 'memuaskan'
       END AS predikat
FROM mahasiswa;
