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
    NgayGioBay DATETIME NOT NULL,
    ThoiGianBay INT, -- phut
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

INSERT INTO THAMSO VALUES (2, 30, 10, 20);

SELECT * FROM SANBAY;
SELECT * FROM HANGGHE;
SELECT * FROM HANGVECB;

-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------
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
    FOREIGN KEY (MaHangGhe, MaChuyenBay) REFERENCES HANGVECB(MaHangGhe, MaChuyenBay)
);

INSERT INTO HANHKHACH (MaHanhKhach, TenHanhKhach, CMND, DienThoai) VALUES
('HK00001', 'Nguyen Van A', '0123456789', '0987654321'),
('HK00002', 'Tran Thi B', '9876543210', '0912345678'),
('HK00003', 'Le Van C', '1122334455', '0909090909'),
('HK00004', 'Pham Thi D', '2233445566', '0933333333'),
('HK00005', 'Hoang Van E', '3344556677', '0944444444'),
('HK00006', 'Nguyen Thi F', '4455667788', '0955555555'),
('HK00007', 'Tran Van G', '5566778899', '0966666666'),
('HK00008', 'Do Thi H', '6677889900', '0977777777'),
('HK00009', 'Bui Van I', '7788990011', '0988888888'),
('HK00010', 'Vu Thi J', '8899001122', '0999999999');


select * from hangvecb;
select * from sanbay;
select * from vechuyenbay;
select * from chuyenbay;

SHOW TABLES;
