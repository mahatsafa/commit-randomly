-- Belajar SQL: subquery, view, update/delete yang aman

-- subquery: mahasiswa dengan IPK di atas rata-rata
SELECT nama, ipk
FROM mahasiswa
WHERE ipk > (SELECT AVG(ipk) FROM mahasiswa);

-- subquery dengan IN
SELECT nama
FROM mahasiswa
WHERE id IN (SELECT mahasiswa_id FROM krs WHERE nilai = 'A');

-- EXISTS
SELECT mk.nama
FROM mata_kuliah mk
WHERE EXISTS (SELECT 1 FROM krs k WHERE k.kode_mk = mk.kode);

-- VIEW: simpan query sebagai "tabel virtual"
CREATE VIEW v_transkrip AS
SELECT m.nama, mk.nama AS matkul, mk.sks, k.nilai
FROM krs k
JOIN mahasiswa m    ON m.id = k.mahasiswa_id
JOIN mata_kuliah mk ON mk.kode = k.kode_mk;

SELECT * FROM v_transkrip WHERE nama = 'Gusto';

-- UPDATE & DELETE: selalu pakai WHERE!
-- (biasakan cek dulu pakai SELECT dengan WHERE yang sama)
SELECT * FROM mahasiswa WHERE nama = 'Cici';
UPDATE mahasiswa SET ipk = 3.05 WHERE nama = 'Cici';

-- transaksi: bisa dibatalkan kalau ada yang salah
START TRANSACTION;
DELETE FROM krs WHERE nilai = 'C';
SELECT COUNT(*) AS sisa_krs FROM krs;
ROLLBACK;  -- batal, data kembali seperti semula

SELECT COUNT(*) AS krs_setelah_rollback FROM krs;
