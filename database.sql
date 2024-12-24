-- untuk membuat database akademik
CREATE DATABASE akademik;
USE akademik;

-- untuk membuat tabel mahasiswa
CREATE TABLE mahasiswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    NIM VARCHAR(10) UNIQUE NOT NULL,
    nama VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    jurusan VARCHAR(50),
    umur INT,
    dosen_id INT
);

-- untuk membuat tabel dosen
CREATE TABLE dosen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL
);

-- untuk membuat tabel matkul
CREATE TABLE matkul (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL
);

-- untuk membuat tabel nilai
CREATE TABLE nilai (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mahasiswa_id INT,
    matkul_id INT,
    nilai INT,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id),
    FOREIGN KEY (matkul_id) REFERENCES matkul(id)
);


-- masukkan data dosen
INSERT INTO dosen (nama) VALUES
('Dr. Budi Setiawan'),
('Prof. Ani Purnama');

-- masukkan data mahasiswa
INSERT INTO mahasiswa (NIM, nama, alamat, jurusan, umur, dosen_id) VALUES
('123456', 'Andi Wijaya', 'Jl. Merdeka No.1', 'Teknik Informatika', 21, 1),
('123457', 'Siti Aminah', 'Jl. Mawar No.2', 'Teknik Informatika', 22, 1),
('123458', 'Rudi Hartono', 'Jl. Melati No.3', 'Sistem Informasi', 23, 2),
('123459', 'Dewi Sartika', 'Jl. Anggrek No.4', 'Teknik Informatika', 24, 1),
('123460', 'Ahmad Fauzi', 'Jl. Kenanga No.5', 'Sistem Informasi', 25, 2);

-- masukkan data matkul
INSERT INTO matkul (nama) VALUES
('Pemrograman Web'),
('Basis Data'),
('Sistem Operasi');

-- masukkan data nilai
INSERT INTO nilai (mahasiswa_id, matkul_id, nilai) VALUES
(1, 1, 80),
(1, 2, 90),
(2, 1, 85),
(2, 3, 75),
(3, 1, 65),
(4, 2, 95),
(5, 3, 70);

-- menampilkan data mahasiswa
SELECT * FROM mahasiswa;

-- menampilkan data dosen
SELECT * FROM dosen;

-- Update alamat mahasiswa dengan NIM ‘123456’
UPDATE mahasiswa SET alamat = 'Jl. Raya No.5' WHERE NIM = '123456';

-- Tampilkan data mahasiswa Teknik Informatika dan dosen pembimbing
SELECT mahasiswa.NIM, mahasiswa.nama, mahasiswa.jurusan, dosen.nama AS dosen_pembimbing
FROM mahasiswa
JOIN dosen ON mahasiswa.dosen_id = dosen.id
WHERE mahasiswa.jurusan = 'Teknik Informatika';

-- Tampilkan 5 mahasiswa tertua
SELECT nama, umur FROM mahasiswa ORDER BY umur DESC LIMIT 5;

-- Tampilkan mahasiswa dengan nilai lebih dari 70
SELECT mahasiswa.nama, matkul.nama AS mata_kuliah, nilai
FROM nilai
JOIN mahasiswa ON nilai.mahasiswa_id = mahasiswa.id
JOIN matkul ON nilai.matkul_id = matkul.id
WHERE nilai > 70;



