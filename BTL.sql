--  Tạo bảng lưu thông tin học sinh
CREATE TABLE HocSinh (
    MaHocSinh VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    Lop VARCHAR(10) NOT NULL,
    NgaySinh DATE,
    Email VARCHAR(100),
    SDT VARCHAR(15)
);

-- Tạo bảng Giám khảo
CREATE TABLE GiamKhao (
    MaGiamKhao INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(255) NOT NULL,
    ChuyenMon NVARCHAR(255),
    SDT VARCHAR(15),
    Email NVARCHAR(255) UNIQUE
);
-- Tạo bảng Cuộc thi
CREATE TABLE CuocThi (
    MaCuocThi VARCHAR(10) PRIMARY KEY,
    TenCuocThi NVARCHAR(255) NOT NULL,
    MonThi NVARCHAR(100),
    NgayToChuc DATE,
    MoTa NVARCHAR(500),
    MaGiamKhao INT,
    FOREIGN KEY (MaGiamKhao) REFERENCES GiamKhao(MaGiamKhao)
);
-- Tạo bảng đăng ký thi
CREATE TABLE DangKyThi (
    MaDangKy VARCHAR(10) PRIMARY KEY,
    MaHocSinh VARCHAR(10),
    MaCuocThi VARCHAR(10),
    NgayDangKy DATE,
    FOREIGN KEY (MaHocSinh) REFERENCES HocSinh(MaHocSinh),
    FOREIGN KEY (MaCuocThi) REFERENCES CuocThi(MaCuocThi)
);

--  Tạo bảng lưu kết quả thi
CREATE TABLE KetQuaThi (
    MaKetQua VARCHAR(10) PRIMARY KEY,
    MaHocSinh VARCHAR(10),
    MaCuocThi VARCHAR(10),
    DiemSo INT,
    XepHang INT,
    FOREIGN KEY (MaHocSinh) REFERENCES HocSinh(MaHocSinh),
    FOREIGN KEY (MaCuocThi) REFERENCES CuocThi(MaCuocThi)
);
-- Bảng Giải thưởng
CREATE TABLE GiaiThuong (
    MaGiaiThuong INT PRIMARY KEY IDENTITY(1,1),
    MaCuocThi VARCHAR(10),
    MaHocSinh VARCHAR(10),
    TenGiai NVARCHAR(255) NOT NULL,
    GiaTri MONEY,
    FOREIGN KEY (MaCuocThi) REFERENCES CuocThi(MaCuocThi),
    FOREIGN KEY (MaHocSinh) REFERENCES HocSinh(MaHocSinh)
);
SELECT * FROM GiamKhao;
SELECT * FROM HocSinh;
SELECT * FROM CuocThi;
SELECT * FROM DangKyThi;
SELECT * FROM KetQuaThi;
SELECT * FROM GiaiThuong;
--  Thêm dữ liệu mẫu
INSERT INTO HocSinh VALUES 
('HS001', N'Nguyễn Văn A', '10A1', '2008-05-20', 'a@gmail.com', '0912345678'),
('HS002', N'Trần Thị B', '11B2', '2007-11-15', 'b@gmail.com', '0987654321'),
('HS003', N'Phạm Văn C', '10A2', '2008-06-12', 'c@gmail.com', '0911123456'),
('HS004', N'Lê Thị D', '11A3', '2007-09-18', 'd@gmail.com', '0922233445'),
('HS005', N'Ngô Văn E', '12B1', '2006-02-25', 'e@gmail.com', '0933344556'),
('HS006', N'Đỗ Thị F', '10A3', '2008-07-10', 'f@gmail.com', '0945566778'),
('HS007', N'Hoàng Văn G', '11B1', '2007-03-22', 'g@gmail.com', '0956677889'),
('HS008', N'Bùi Thị H', '12A2', '2006-08-14', 'h@gmail.com', '0967788990'),
('HS009', N'Vũ Văn I', '10B3', '2008-10-05', 'i@gmail.com', '0978899001'),
('HS010', N'Phan Thị J', '11A1', '2007-12-30', 'j@gmail.com', '0989900112'),
('HS011', N'Nguyễn Văn K', '10A1', '2008-04-25', 'k@gmail.com', '0990011223'),
('HS012', N'Trần Thị L', '11B2', '2007-06-18', 'l@gmail.com', '0911122334'),
('HS013', N'Phạm Văn M', '12A3', '2006-09-12', 'm@gmail.com', '0922233445'),
('HS014', N'Lê Thị N', '10B2', '2008-11-08', 'n@gmail.com', '0933344556'),
('HS015', N'Ngô Văn O', '11A3', '2007-05-21', 'o@gmail.com', '0944455667'),
('HS016', N'Đỗ Thị P', '12B2', '2006-07-15', 'p@gmail.com', '0955566778'),
('HS017', N'Hoàng Văn Q', '10A3', '2008-03-05', 'q@gmail.com', '0966677889'),
('HS018', N'Bùi Thị R', '11B1', '2007-10-29', 'r@gmail.com', '0977788990'),
('HS019', N'Vũ Văn S', '12A1', '2006-12-18', 's@gmail.com', '0988899001'),
('HS020', N'Phan Thị T', '10B3', '2008-06-25', 't@gmail.com', '0999900112'),
('HS021', N'Nguyễn Văn U', '11A2', '2007-08-30', 'u@gmail.com', '0910011223'),
('HS022', N'Trần Thị V', '12B3', '2006-04-10', 'v@gmail.com', '0921122334'),
('HS023', N'Phạm Văn W', '10A1', '2008-09-19', 'w@gmail.com', '0932233445'),
('HS024', N'Lê Thị X', '11B2', '2007-02-14', 'x@gmail.com', '0943344556'),
('HS025', N'Ngô Văn Y', '12A3', '2006-05-11', 'y@gmail.com', '0954455667');

INSERT INTO CuocThi VALUES 
('CT001', N'Toán cấp trường', N'Toán', '2025-03-15', N'Thi học sinh giỏi Toán'),
('CT002', N'Văn hay chữ tốt', N'Ngữ Văn', '2025-04-10', N'Thi viết văn sáng tạo'),
('CT003', N'Tin học ứng dụng', N'Tin học', '2025-05-20', N'Thi lập trình cơ bản'),
('CT004', N'Thử thách Toán học', N'Toán', '2025-06-10', N'Cuộc thi giải toán nhanh'),
('CT005', N'Hùng biện tiếng Anh', N'Anh Văn', '2025-07-05', N'Thi hùng biện bằng tiếng Anh');

INSERT INTO DangKyThi VALUES 
('DK001', 'HS001', 'CT001', '2025-03-01'),
('DK002', 'HS002', 'CT002', '2025-03-02'),
('DK003', 'HS003', 'CT003', '2025-04-01'),
('DK004', 'HS004', 'CT004', '2025-04-02'),
('DK005', 'HS005', 'CT005', '2025-04-03');

INSERT INTO KetQuaThi VALUES 
('KQ001', 'HS001', 'CT001', 85, 1),
('KQ002', 'HS002', 'CT002', 78, 2),
('KQ003', 'HS003', 'CT003', 88, 1),
('KQ004', 'HS004', 'CT004', 75, 3),
('KQ005', 'HS005', 'CT005', 82, 2);


INSERT INTO GiamKhao 
(HoTen, ChuyenMon, SDT, Email) VALUES
(N'Nguyễn Văn A', N'Toán học', '0912345678', 'nguyenvana@gmail.com'),
(N'Trần Thị B', N'Văn học', '0923456789', 'tranthib@gmail.com'),
(N'Lê Hoàng C', N'Tin học', '0934567890', 'lehoangc@gmail.com'),
(N'Phạm Minh D', N'Vật lý', '0945678901', 'phamminhd@gmail.com'),
(N'Đỗ Thị E', N'Hóa học', '0956789012', 'dothie@gmail.com');


-- Xây dựng các view S
--Xem thông tin học sinh đăng kí 
CREATE VIEW V_DanhSachDangKy AS  
SELECT HS.HoTen AS TenHocSinh, HS.Lop, CT.TenCuocThi, CT.MonThi, DK.NgayDangKy  
FROM DangKyThi DK  
JOIN HocSinh HS ON DK.MaHocSinh = HS.MaHocSinh  
JOIN CuocThi CT ON DK.MaCuocThi = CT.MaCuocThi;  

SELECT * FROM V_DanhSachDangKy;

-- Xem thông tin giám khảo
CREATE VIEW V_DanhSachGiamKhao AS  
SELECT MaGiamKhao, HoTen, ChuyenMon, SDT, Email  
FROM GiamKhao;

SELECT * FROM V_DanhSachGiamKhao;


--Xem kết quả thi của học sinh
CREATE VIEW V_KetQuaThi AS
SELECT HS.HoTen, CT.TenCuocThi, KQ.DiemSo, KQ.XepHang
FROM KetQuaThi KQ
JOIN HocSinh HS ON KQ.MaHocSinh = HS.MaHocSinh
JOIN CuocThi CT ON KQ.MaCuocThi = CT.MaCuocThi;

SELECT * FROM V_KetQuaThi;

-- xem danh sách cuộc thi
CREATE VIEW V_DanhSachCuocThi AS  
SELECT CT.MaCuocThi, CT.TenCuocThi, CT.MonThi, CT.NgayThi, GK.HoTen AS GiamKhaoPhuTrach  
FROM CuocThi CT  
LEFT JOIN GiamKhao GK ON CT.MaGiamKhao = GK.MaGiamKhao;

SELECT * FROM V_DanhSachCuocThi;

--xem giải thưởng hocj sinh
CREATE VIEW V_GiaiThuong AS
SELECT HS.HoTen, CT.TenCuocThi, GT.TenGiai, GiaTri
FROM GiaiThuong GT
JOIN HocSinh HS ON GT.MaHocSinh = HS.MaHocSinh
JOIN CuocThi CT ON GT.MaCuocThi = CT.MaCuocThi;

SELECT * FROM V_GiaiThuong;

--Xem học sinh có điểm cao nhất sau mỗi cuộc thi
CREATE VIEW V_HocSinhDiemCaoNhat AS  
SELECT KQ.MaCuocThi, CT.TenCuocThi, HS.HoTen, KQ.DiemSo  
FROM KetQuaThi KQ  
JOIN HocSinh HS ON KQ.MaHocSinh = HS.MaHocSinh  
JOIN CuocThi CT ON KQ.MaCuocThi = CT.MaCuocThi  
WHERE KQ.DiemSo = (SELECT MAX(DiemSo) FROM KetQuaThi WHERE MaCuocThi = KQ.MaCuocThi);

SELECT * FROM V_HocSinhDiemCaoNhat;

--Xem danh sach hoc sinh chưa có điểm
CREATE VIEW V_HocSinhChuaCoDiem AS  
SELECT HS.HoTen, CT.TenCuocThi, DK.NgayDangKy  
FROM DangKyThi DK  
JOIN HocSinh HS ON DK.MaHocSinh = HS.MaHocSinh  
JOIN CuocThi CT ON DK.MaCuocThi = CT.MaCuocThi  
LEFT JOIN KetQuaThi KQ ON DK.MaHocSinh = KQ.MaHocSinh AND DK.MaCuocThi = KQ.MaCuocThi  
WHERE KQ.DiemSo IS NULL;

SELECT * FROM V_HocSinhChuaCoDiem;

--cuộc thi có nhiều học sinh tham gia
CREATE VIEW V_CuocThiDongNhat AS  
SELECT TOP 1 CT.TenCuocThi, COUNT(DK.MaHocSinh) AS SoLuongHocSinh  
FROM CuocThi CT  
LEFT JOIN DangKyThi DK ON CT.MaCuocThi = DK.MaCuocThi  
GROUP BY CT.TenCuocThi  
ORDER BY SoLuongHocSinh DESC;

SELECT * FROM V_CuocThiDongNhat;

--Danh sách học sinh và số cuộc thi đã tham gia
CREATE VIEW V_SoLuongCuocThiDaThamGia AS  
SELECT HS.MaHocSinh, HS.HoTen, HS.Lop, COUNT(DK.MaCuocThi) AS SoCuocThiThamGia  
FROM HocSinh HS  
LEFT JOIN DangKyThi DK ON HS.MaHocSinh = DK.MaHocSinh  
GROUP BY HS.MaHocSinh, HS.HoTen, HS.Lop;

SELECT * FROM V_SoLuongCuocThiDaThamGia;

--Xây dựng các procedure 
--Thêm học sinh mới
CREATE PROCEDURE ThemHocSinh
    @MaHocSinh VARCHAR(10),
    @HoTen NVARCHAR(255),
    @Lop NVARCHAR(50),
    @NgaySinh DATE,
    @Email NVARCHAR(255),
    @SDT VARCHAR(15)
AS
BEGIN
    INSERT INTO HocSinh (MaHocSinh, HoTen, Lop, NgaySinh, Email, SDT) 
    VALUES (@MaHocSinh, @HoTen, @Lop, @NgaySinh, @Email, @SDT);
END;

EXEC ThemHocSinh 'HS006', N'Nguyễn Văn F', '11A1', '2007-10-12', 'f@gmail.com', '0967890123';

--Cập nhật điểm của học sinh
CREATE PROCEDURE CapNhatDiemThi
    @MaHocSinh VARCHAR(10),
    @MaCuocThi VARCHAR(10),
    @DiemSo INT
AS
BEGIN
    -- Bắt đầu giao dịch
    BEGIN TRANSACTION;

    -- Kiểm tra xem mã học sinh có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM HocSinh WHERE MaHocSinh = @MaHocSinh)
    BEGIN
        PRINT N'Lỗi: Mã học sinh không tồn tại!';
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Kiểm tra xem mã cuộc thi có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM CuocThi WHERE MaCuocThi = @MaCuocThi)
    BEGIN
        PRINT N'Lỗi: Mã cuộc thi không tồn tại!';
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Kiểm tra xem học sinh đã đăng ký cuộc thi chưa
    IF NOT EXISTS (SELECT 1 FROM DangKyThi WHERE MaHocSinh = @MaHocSinh AND MaCuocThi = @MaCuocThi)
    BEGIN
        PRINT N'Lỗi: Học sinh chưa đăng ký cuộc thi này!';
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Kiểm tra xem đã có điểm chưa
    IF EXISTS (SELECT 1 FROM KetQuaThi WHERE MaHocSinh = @MaHocSinh AND MaCuocThi = @MaCuocThi)
    BEGIN
        -- Nếu đã có, thì cập nhật điểm
        UPDATE KetQuaThi
        SET DiemSo = @DiemSo
        WHERE MaHocSinh = @MaHocSinh AND MaCuocThi = @MaCuocThi;
        PRINT N'Cập nhật điểm thi thành công!';
    END
    ELSE
    BEGIN
        -- Nếu chưa có, thì thêm mới
        DECLARE @MaKetQua VARCHAR(10);
        SET @MaKetQua = 'KQ' + RIGHT('000' + CAST((SELECT COUNT(*) + 1 FROM KetQuaThi) AS VARCHAR), 3);

        INSERT INTO KetQuaThi (MaKetQua, MaHocSinh, MaCuocThi, DiemSo, XepHang)
        VALUES (@MaKetQua, @MaHocSinh, @MaCuocThi, @DiemSo, NULL);
        PRINT N'Đã thêm mới điểm thi!';
    END

    -- Hoàn thành 
    COMMIT TRANSACTION;
END;


EXEC CapNhatDiemThi 'HS006', 'CT001', 90;

--xóa học sinh khỏi hệ thống
CREATE PROCEDURE XoaHocSinh
    @MaHocSinh VARCHAR(10)
AS
BEGIN
    DELETE FROM HocSinh WHERE MaHocSinh = @MaHocSinh;
END;

EXEC XoaHocSinh 'HS006';

--Xóa đăng kí học sinh
CREATE PROCEDURE XoaDangKyThi
    @MaHocSinh VARCHAR(10),
    @MaCuocThi VARCHAR(10)
AS
BEGIN
    DELETE FROM DangKyThi
    WHERE MaHocSinh = @MaHocSinh AND MaCuocThi = @MaCuocThi;
END;

EXEC XoaDangKyThi 'HS003', 'CT002';

--cập nhật thông tin giám khảo
CREATE PROCEDURE CapNhatGiamKhao
    @MaGiamKhao INT,
    @HoTen NVARCHAR(255),
    @ChuyenMon NVARCHAR(255),
    @SDT VARCHAR(15),
    @Email NVARCHAR(255)
AS
BEGIN
    UPDATE GiamKhao
    SET HoTen = @HoTen, ChuyenMon = @ChuyenMon, SDT = @SDT, Email = @Email
    WHERE MaGiamKhao = @MaGiamKhao;
END;

EXEC CapNhatGiamKhao 1, N'Nguyễn Văn B', N'Toán học nâng cao', '0999999999', 'newemail@gmail.com';

--Thêm cuộc thi mới
CREATE PROCEDURE ThemCuocThi
    @MaCuocThi VARCHAR(10),
    @TenCuocThi NVARCHAR(255),
    @MonThi NVARCHAR(100),
    @NgayToChuc DATE,
    @MoTa NVARCHAR(500),
    @MaGiamKhao INT
AS
BEGIN
    INSERT INTO CuocThi (MaCuocThi, TenCuocThi, MonThi, NgayThi, MoTa, MaGiamKhao)
    VALUES (@MaCuocThi, @TenCuocThi, @MonThi, @NgayToChuc, @MoTa, @MaGiamKhao);
END;

EXEC ThemCuocThi 'CT006', N'Lập trình Python', N'Tin học', '2025-08-10', N'Cuộc thi lập trình Python cơ bản', 3;

--Xóa cuộc thi
CREATE PROCEDURE XoaCuocThi
    @MaCuocThi VARCHAR(10)
AS
BEGIN
    DELETE FROM CuocThi WHERE MaCuocThi = @MaCuocThi;
END;

EXEC XoaCuocThi 'CT006';

--tổng số học sinh tham gia mỗi cuộc thi
CREATE PROCEDURE SoLuongHocSinhMoiCuocThi
AS
BEGIN
    SELECT CT.TenCuocThi, COUNT(DK.MaHocSinh) AS SoLuongHocSinh
    FROM CuocThi CT
    LEFT JOIN DangKyThi DK ON CT.MaCuocThi = DK.MaCuocThi
    GROUP BY CT.TenCuocThi;
END;

EXEC SoLuongHocSinhMoiCuocThi;

--Lấy danh danh học sinh chưa có điểm
CREATE PROCEDURE DanhSachHocSinhChuaCoDiem
AS
BEGIN
    SELECT HS.HoTen, CT.TenCuocThi, DK.NgayDangKy
    FROM DangKyThi DK
    JOIN HocSinh HS ON DK.MaHocSinh = HS.MaHocSinh
    JOIN CuocThi CT ON DK.MaCuocThi = CT.MaCuocThi
    LEFT JOIN KetQuaThi KQ ON DK.MaHocSinh = KQ.MaHocSinh AND DK.MaCuocThi = KQ.MaCuocThi
    WHERE KQ.DiemSo IS NULL;
END;

EXEC DanhSachHocSinhChuaCoDiem;

--Cập nhât tiền thưởng
CREATE PROCEDURE CapNhatTienThuongHocSinh
AS
BEGIN
    UPDATE GiaiThuong
    SET GiaTri = 
        CASE 
            WHEN TenGiai = N'Nhất' THEN 5000000
            WHEN TenGiai = N'Nhì' THEN 3000000
            WHEN TenGiai = N'Ba' THEN 2000000
            ELSE 1000000 -- Khuyến khích
        END;
END;

EXEC CapNhatTienThuongHocSinh;

--Đăng kí thi
CREATE PROCEDURE sp_DangKyThi
    @MaHocSinh VARCHAR(10),
    @MaCuocThi VARCHAR(10)
AS
BEGIN
    -- Bắt đầu giao dịch
    BEGIN TRANSACTION;

    -- Kiểm tra xem mã học sinh có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM HocSinh WHERE MaHocSinh = @MaHocSinh)
    BEGIN
        PRINT N'Lỗi: Mã học sinh không tồn tại!';
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Kiểm tra xem mã cuộc thi có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM CuocThi WHERE MaCuocThi = @MaCuocThi)
    BEGIN
        PRINT N'Lỗi: Mã cuộc thi không tồn tại!';
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Kiểm tra xem học sinh đã đăng ký thi hay chưa
    IF EXISTS (SELECT 1 FROM DangKyThi WHERE MaHocSinh = @MaHocSinh AND MaCuocThi = @MaCuocThi)
    BEGIN
        PRINT N'Học sinh đã đăng ký cuộc thi này!';
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Tạo mã đăng ký tự động (DK001, DK002,...)
    DECLARE @MaDangKy VARCHAR(10);
    SET @MaDangKy = 'DK' + RIGHT('000' + CAST((SELECT COUNT(*) + 1 FROM DangKyThi) AS VARCHAR), 3);

    -- Thêm vào bảng đăng ký thi
    INSERT INTO DangKyThi (MaDangKy, MaHocSinh, MaCuocThi, NgayDangKy)
    VALUES (@MaDangKy, @MaHocSinh, @MaCuocThi, GETDATE());

    -- Hoàn thành 
    COMMIT TRANSACTION;
    PRINT N'Đăng ký thi thành công!';
END;

EXEC sp_DangKyThi 'HS006', 'CT001';

--Xếp hạng học sinh
CREATE PROCEDURE sp_XepHangKetQua
AS
BEGIN
    -- Cập nhật xếp hạng cho từng cuộc thi
    WITH XepHang AS (
        SELECT 
            MaHocSinh, 
            MaCuocThi, 
            DiemSo,
            RANK() OVER (PARTITION BY MaCuocThi ORDER BY DiemSo DESC) AS XepHangMoi
        FROM KetQuaThi
    )
    UPDATE kq
    SET XepHang = xh.XepHangMoi
    FROM KetQuaThi kq
    INNER JOIN XepHang xh
    ON kq.MaHocSinh = xh.MaHocSinh AND kq.MaCuocThi = xh.MaCuocThi;
END;

EXEC sp_XepHangKetQua;  -- Xếp hạng học sinh theo điểm số

--xếp giải thưởng
CREATE PROCEDURE sp_XepGiaiThuong
AS
BEGIN
    -- Xóa các giải cũ trước khi xếp giải mới
    DELETE FROM GiaiThuong;

    -- Thêm giải thưởng cho mỗi cuộc thi
    INSERT INTO GiaiThuong (MaCuocThi, MaHocSinh, TenGiai, GiaTri)
    SELECT 
        kq.MaCuocThi, 
        kq.MaHocSinh,
        CASE 
            WHEN kq.XepHang = 1 THEN N'Giải Nhất'
            WHEN kq.XepHang = 2 THEN N'Giải Nhì'
            WHEN kq.XepHang = 3 THEN N'Giải Ba'
            ELSE N'Khuyến Khích'
        END AS TenGiai,
        CASE 
            WHEN kq.XepHang = 1 THEN 5000000  -- Giải Nhất: 5 triệu
            WHEN kq.XepHang = 2 THEN 3000000  -- Giải Nhì: 3 triệu
            WHEN kq.XepHang = 3 THEN 1000000  -- Giải Ba: 1 triệu
            ELSE 500000  -- Khuyến Khích: 500K
        END AS GiaTri
    FROM KetQuaThi kq;
END;

EXEC sp_XepGiaiThuong;  -- Xếp giải thưởng theo thứ hạng

-- Phân quyền truy cập

--Tạo người dùng và phân quyền
CREATE LOGIN GiamKhaoLogin WITH PASSWORD = 'GiamKhao@123';
CREATE LOGIN GiaoVienLogin WITH PASSWORD = 'GiaoVien@123';
CREATE LOGIN HocSinhLogin WITH PASSWORD = 'HocSinh@123';

USE QLcuocthiTHPT; 

CREATE USER GiamKhaoUser FOR LOGIN GiamKhaoLogin;
CREATE USER GiaoVienUser FOR LOGIN GiaoVienLogin;
CREATE USER HocSinhUser FOR LOGIN HocSinhLogin;

--Phân quyền cụ thể

--Phân quyền cho giám khảo
GRANT SELECT, INSERT, UPDATE ON CuocThi TO GiamKhaoUser;
GRANT SELECT, INSERT, UPDATE ON KetQuaThi TO GiamKhaoUser;
GRANT SELECT ON HocSinh TO GiamKhaoUser;
--Giám khảo có thể xem danh sách học sinh, bổ sung và cập nhật cuộc thi cũng như kết quả thi.

--Quyền cho giáo viên
GRANT SELECT, INSERT, UPDATE, DELETE ON CuocThi TO GiaoVienUser;
GRANT SELECT, INSERT, UPDATE ON KetQuaThi TO GiaoVienUser;
GRANT SELECT ON HocSinh TO GiaoVienUser;
GRANT SELECT ON GiaiThuong TO GiaoVienUser;
--Giáo viên có quyền xem danh sách học sinh, thêm/xóa cuộc thi, cập nhật kết quả thi và xem giải thưởng.

--Quyền cho học sinh
GRANT SELECT ON CuocThi TO HocSinhUser;
GRANT SELECT, INSERT ON DangKyThi TO HocSinhUser;
GRANT SELECT ON KetQuaThi TO HocSinhUser;
GRANT SELECT ON GiaiThuong TO HocSinhUser;
--Học sinh có thể xem cuộc thi, đăng ký thi, xem kết quả thi và giải thưởng của mình.

--Tạo nhóm người dùng
CREATE ROLE GiamKhaoRole;
GRANT SELECT, INSERT, UPDATE ON CuocThi TO GiamKhaoRole;
GRANT SELECT, INSERT, UPDATE ON KetQuaThi TO GiamKhaoRole;
GRANT SELECT ON HocSinh TO GiamKhaoRole;

CREATE ROLE GiaoVienRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON CuocThi TO GiaoVienRole;
GRANT SELECT, INSERT, UPDATE ON KetQuaThi TO GiaoVienRole;
GRANT SELECT ON HocSinh TO GiaoVienRole;
GRANT SELECT ON GiaiThuong TO GiaoVienRole;

CREATE ROLE HocSinhRole;
GRANT SELECT ON CuocThi TO HocSinhRole;
GRANT SELECT, INSERT ON DangKyThi TO HocSinhRole;
GRANT SELECT ON KetQuaThi TO HocSinhRole;
GRANT SELECT ON GiaiThuong TO HocSinhRole;

ALTER ROLE GiamKhaoRole ADD MEMBER GiamKhaoUser;
ALTER ROLE GiaoVienRole ADD MEMBER GiaoVienUser;
ALTER ROLE HocSinhRole ADD MEMBER HocSinhUser;

--Thu hồi quyền
REVOKE SELECT, INSERT, UPDATE ON CuocThi FROM GiamKhaoUser;
REVOKE SELECT ON GiaiThuong FROM HocSinhUser;
