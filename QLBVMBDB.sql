DROP DATABASE IF EXISTS QLBVMBDB;

CREATE DATABASE IF NOT EXISTS QLBVMBDB;
USE QLBVMBDB;

CREATE TABLE IF NOT EXISTS THAMSO
(
	SoSanBayTGToiDa INT NOT NULL,
    TGBayToiThieu INT NOT NULL, -- phut
    TGDungToiThieu INT NOT NULL, -- phut
    TGDungToiDa INT NOT NULL -- phut
);    

CREATE TABLE IF NOT EXISTS SANBAY
(
	MaSanBay VARCHAR(7) PRIMARY KEY,
    TenSanBay VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS HANGGHE
(
	MaHangGhe VARCHAR(7) PRIMARY KEY,
    TenHangGhe VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS CHUYENBAY
(
	MaChuyenBay VARCHAR(7) PRIMARY KEY,
    MaSanBayDi VARCHAR(7) NOT NULL,
    MaSanBayDen VARCHAR(7) NOT NULL,
    NgayBay DATE NOT NULL,
    GioBay TIME NOT NULL,
    ThoiGianBay INT NOT NULL, -- phut
    FOREIGN KEY (MaSanBayDi) REFERENCES SANBAY(MaSanBay),
    FOREIGN KEY (MaSanBayDen) REFERENCES SANBAY(MaSanBay)
);

CREATE TABLE IF NOT EXISTS CTCHUYENBAY
(
	MaChuyenBay VARCHAR(7) NOT NULL,
    MaSanBayTG VARCHAR(7) NOT NULL,
	ThoiGianDung INT, -- phut
    GhiChu VARCHAR(300),
    PRIMARY KEY (MaChuyenBay, MaSanBayTG),
    FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay),
    FOREIGN KEY (MaSanBayTG) REFERENCES SANBAY(MaSanBay)
);

CREATE TABLE IF NOT EXISTS HANGVECB
(
	MaHangGhe VARCHAR(7) NOT NULL,
    MaChuyenBay VARCHAR(7) NOT NULL,
    SoLuongGhe INT NOT NULL,
    SoLuongGheDaBan INT DEFAULT 0,
    DonGia INT NOT NULL,
    PRIMARY KEY (MaHangGhe, MaChuyenBay),
    FOREIGN KEY (MaHangGhe) REFERENCES HANGGHE(MaHangGhe),
    FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
);

INSERT INTO SANBAY VALUES ('SB00001', 'Sân bay California');
INSERT INTO SANBAY VALUES ('SB00002', 'Sân bay New York');
INSERT INTO SANBAY VALUES ('SB00003', 'Sân bay Texas');
INSERT INTO SANBAY VALUES ('SB00004', 'Sân bay Los Angeles');
INSERT INTO SANBAY VALUES ('SB00005', 'Sân bay Chicago O\'Hare');
INSERT INTO SANBAY VALUES ('SB00006', 'Sân bay Atlanta Hartsfield-Jackson');
INSERT INTO SANBAY VALUES ('SB00007', 'Sân bay Denver');
INSERT INTO SANBAY VALUES ('SB00008', 'Sân bay Miami');
INSERT INTO SANBAY VALUES ('SB00009', 'Sân bay Seattle-Tacoma');
INSERT INTO SANBAY VALUES ('SB00010', 'Sân bay Washington Dulles');

INSERT INTO HANGGHE VALUES ('HG00001', 'Hạng 1');
INSERT INTO HANGGHE VALUES ('HG00002', 'Hạng 2');
INSERT INTO HANGGHE VALUES ('HG00003', 'Hạng xoàng');
INSERT INTO HANGGHE VALUES ('HG00003', 'Hạng sang');

INSERT INTO THAMSO VALUES (2, 30, 10, 20);

SELECT * FROM SANBAY;
SELECT * FROM HANGGHE;
SELECT * FROM HANGVECB;
<<<<<<< HEAD

-- Script for Sprint 02
alter table hangvecb 
add column SLGheDaBan int;

alter table hangvecb
add column DonGia bigint;

create table if not exists HANHKHACH
(
	MaHanhKhach varchar(7) primary key,
    TenHanhKhach varchar(50) not null,
    CMND varchar(20) not null,
    DienThoai varchar(20) not null
);

create table if not exists VECHUYENBAY
(
	MaVe varchar(7) primary key,
    MaChuyenBay varchar(7) not null,
    MaHanhKhach varchar(7) not null,
    MaHangGhe varchar(7) not null,
    FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay),
    FOREIGN KEY (MaHangGhe) REFERENCES HANGGHE(MaHangGhe),
    FOREIGN KEY (MaHanhKhach) REFERENCES HANHKHACH(MaHanhKhach)
);


=======
SELECT * FROM CHUYENBAY;
>>>>>>> 5269dbddfc285244a0dcba19ecbc00c8f5d6c5f0
SHOW TABLES;
