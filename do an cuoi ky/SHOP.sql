create database QLBANMOHINH
GO


use QLBANMOHINH
Go

create table CHUDE(
MaCD int Identity(1,1),
TenChuDe nvarchar (50) not null,
BoSuuTap nvarchar(max),
constraint PK_CHUDE primary key (MaCD),
)
GO
create table NHASANXUAT
(
MaNSX int identity(1,1),
TenNSX nvarchar(max) not null,
constraint PK_NhaSanXuat primary key (MaNSX)
)GO

create table MOHINH
(
MaMH int identity (1,1),
TenMH nvarchar (max) not null,
Donvitinh nvarchar (50) default 'mô hình',
DonGia money check (DonGia >=0),
MoTa ntext,
HinhMinhHoa varchar(50),
MaCD int,
MaNSX int,
NgayCapNhat smalldatetime,
SoLuongBan int check (SoLuongBan > 0),
SoLuotXem int default 0,
constraint PK_MoHinh primary key (MaMH),
)GO
create table KHACHHANG
(
MaKH int identity (1,1),
HoTenKH nvarchar(max) not null,
DiaChiKH nvarchar (70),
DienThoaiKH varchar(10),
TenDangNhap varchar(20) unique,
MatKhau varchar(15) not null,
NgaySinh smalldatetime,
GioiTinh bit default 1,
Email varchar (50) unique,
DaDuyet bit default 0,
constraint PK_KhachHang primary key (MaKH)
)GO
create table DONDATHANG
(
MaDH int identity (1,1),
MaKH int,
NgayDatHang smalldatetime,
TriGia money check (TriGia > 0),
DaGiao bit default 0,
NgayGiaoHang smalldatetime,
TenNguoiNhan nvarchar (max),
DiaChiNhan nvarchar (max),
SDTNhan varchar (10),
HTThanhToan bit default 0,
HTGiaoHang bit default 0,
constraint PK_DonDatHang primary key (MaDH)
)GO
create table CTDATHANG
(
MaDH int,
MaMH int,
SoLuong int check (SoLuong>0),
DonGia decimal (9,2) check (DonGia > 0),
ThanhTien as SoLuong * DonGia,
constraint PK_CTDatHang primary key (MaDH,MaMH)
)GO
create table UserAdmin
(
MaAdmin int identity (1,1),
TenDangNhap varchar(20) unique,
MatKhau varchar(15) not null,
constraint PK_Admin primary key (MaAdmin)
)
alter table MOHINH add constraint FK_MoHinh_ChuDe foreign key (MaCD) references CHUDE(MaCD)
alter table MOHINH add constraint FK_MoHinh_NhaSanXuat foreign key (MaNSX) references NhaSanXuat (MaNSX)
alter table DONDATHANG add constraint FK_DonDatHang_KhachHang foreign key (MaKH) references KHACHHANG (MaKH)
alter table CTDATHANG add constraint FK_CTDatHang_DonDatHang foreign key (MaDH) references DONDATHANG (MaDH)
alter table CTDATHANG add constraint FK_CTDatHang_MoHinh foreign key (MaDH) references MOHINH (MaMH)

SET IDENTITY_INSERT [dbo].[CHUDE] ON
insert into [dbo].[CHUDE] (MaCD,TenChuDe,BoSuuTap) values (1,'ONEPIECE','ONE PIECE');
insert into [dbo].[CHUDE] (MaCD,TenChuDe,BoSuuTap) values (2,'NARUTO','NARUTO');
insert into [dbo].[CHUDE] (MaCD,TenChuDe,BoSuuTap) values (3,'BLEACH','BLEACH');
insert into [dbo].[CHUDE] (MaCD,TenChuDe,BoSuuTap) values (4,'KIMETSU','KIMETSU');
insert into [dbo].[CHUDE] (MaCD,TenChuDe,BoSuuTap) values (5,'JUJUTSU','JUJUTSU');

SET IDENTITY_INSERT [dbo].[CHUDE] ON
insert into [dbo].[CHUDE] (MaCD,TenChuDe,BoSuuTap) values (6,'ATTACK on TITAN','ATTACK on TITAN');
insert into [dbo].[CHUDE] (MaCD,TenChuDe,BoSuuTap) values (7,'FAIRY TAIL','FAIRY TAIL');
insert into [dbo].[CHUDE] (MaCD,TenChuDe,BoSuuTap) values (8,'DC COMIC','DC COMIC');
insert into [dbo].[CHUDE] (MaCD,TenChuDe,BoSuuTap) values (9,'MARVEL','MARVEL');
SET IDENTITY_INSERT [dbo].[CHUDE] OFF

SET IDENTITY_INSERT [dbo].[NHASANXUAT] ON 

insert into NHASANXUAT (MaNSX,TenNSX) values (1,'ODA EIICHIRO');
insert into NHASANXUAT (MaNSX,TenNSX) values (2,'KISHIMOTO MASASHI');
insert into NHASANXUAT (MaNSX,TenNSX) values (3,'KUBO TAITO');
insert into NHASANXUAT (MaNSX,TenNSX) values (4,'GOTOUGE KOYOHARU');
insert into NHASANXUAT (MaNSX,TenNSX) values (5,'GEGE AKUTAMI');

SET IDENTITY_INSERT [dbo].[NHASANXUAT] ON 
insert into NHASANXUAT (MaNSX,TenNSX) values (6,'HAJIME ISAYAMA');
insert into NHASANXUAT (MaNSX,TenNSX) values (7,'HIRO MASHIMA');
insert into NHASANXUAT (MaNSX,TenNSX) values (8,'DC COMIC');
insert into NHASANXUAT (MaNSX,TenNSX) values (9,'STANLEY');
SET IDENTITY_INSERT [dbo].[NHASANXUAT] OFF  

SET IDENTITY_INSERT [dbo].[KHACHHANG] ON
insert into KHACHHANG (MaKH, HoTenKH, DiaChiKH, DienThoaiKH, TenDangNhap, MatKhau, NgaySinh, GioiTinh, Email, DaDuyet) values (1,N'Nguyễn Minh Khang',N'495/8/31 Tô Hiến Thành P14 Q10','0912713802',N'mkhang',N'minhkhang0710','2003/10/07','0','minhkhang.nguyen703@gmail.com','1');
insert into KHACHHANG (MaKH, HoTenKH, DiaChiKH, DienThoaiKH, TenDangNhap, MatKhau, NgaySinh, GioiTinh, Email, DaDuyet) values (2,N'Đỗ Thành Công',N'58 Nghĩa Phát P15 Q.Tân Bình','0344533736',N'kong',N'vaydoha<3','2003/10/17','0','dothanhcong1710@gmail.com','1');
insert into KHACHHANG (MaKH, HoTenKH, DiaChiKH, DienThoaiKH, TenDangNhap, MatKhau, NgaySinh, GioiTinh, Email, DaDuyet) values (3,N'Nguyễn Phước Nguyên',N'Hẻm C3 Phạm Hùng P5 Q8','0707071811',N'nguyencl',N'concubeti1','2003/05/28','0','phuocnguyen2805@gmail.com','1');
insert into KHACHHANG (MaKH, HoTenKH, DiaChiKH, DienThoaiKH, TenDangNhap, MatKhau, NgaySinh, GioiTinh, Email, DaDuyet) values (4,N'Nguyễn Kế Thuỳ',N'69 Phạm Hùng P5 Q8','0914235257',N'kethuy',N'thuydeptrai','1987/05/15','0','thuyne123@gmail.com','1');
insert into KHACHHANG (MaKH, HoTenKH, DiaChiKH, DienThoaiKH, TenDangNhap, MatKhau, NgaySinh, GioiTinh, Email, DaDuyet) values (5,N'Trần Thị Thu Hà',N'11 Thành Thái P14 Q10','0785412365',N'thuha',N'thuhamagic123','2001/01/05','1','thuhane05@gmail.com','1');
insert into KHACHHANG (MaKH, HoTenKH, DiaChiKH, DienThoaiKH, TenDangNhap, MatKhau, NgaySinh, GioiTinh, Email, DaDuyet) values (6,N'Nguyễn Thanh Vũ',N'65/11 CMT8 P15 Q10','0909876236',N'vuweb',N'thanhvu0707','1983/07/07','0','thanhvu83@gmail.com','1');
insert into KHACHHANG (MaKH, HoTenKH, DiaChiKH, DienThoaiKH, TenDangNhap, MatKhau, NgaySinh, GioiTinh, Email, DaDuyet) values (7,N'Lê Thị Minh Ngọc',N'49/51 Phạm Hùng P12 Q8','0918273802',N'ngoc21',N'minhngoc123','1983/07/21','1','minhngocxinh@gmail.com','1');
insert into KHACHHANG (MaKH, HoTenKH, DiaChiKH, DienThoaiKH, TenDangNhap, MatKhau, NgaySinh, GioiTinh, Email, DaDuyet) values (8,N'Đoàn Thị Ngọc Minh',N'18/2 Lữ Gia P8 Q11','0979182329',N'minhne12',N'ngocminhxinhdep','2003/06/12','1','minhne12@gmail.com','1');
insert into KHACHHANG (MaKH, HoTenKH, DiaChiKH, DienThoaiKH, TenDangNhap, MatKhau, NgaySinh, GioiTinh, Email, DaDuyet) values (9,N'Nguyễn Văn Sĩ Hùng',N'358/11/25 Hoà Hảo P14 Q10','0715373812',N'sihung',N'hung123','1997/08/20','0','sihung2008@gmail.com','1');
insert into KHACHHANG (MaKH, HoTenKH, DiaChiKH, DienThoaiKH, TenDangNhap, MatKhau, NgaySinh, GioiTinh, Email, DaDuyet) values (10,N'Nguyễn Thị Đoan Trang',N'51/2 Lý Thường Kiệt P1 Q10','0785473812',N'dtrang',N'doantrang512','2002/12/05','1','doantrang1@gmail.com','1');
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF 
SET IDENTITY_INSERT [dbo].[MOHINH] ON
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (1,N'Luffy01',N'mô hình','2000000',N'Mô hình luffy mới nhất cực ngầu','Luffy01','1','1','2022/11/03','3','5')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (2,N'Gojo01',N'mô hình','1500000',N'Mô hình thầy Gojo hài hước nhưng vẫn ngầu','Gojo01','5','5','2022/11/03','2','5')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (3,N'Naruto01',N'mô hình','2500000',N'Mô hình Hokage đệ thất Naruto ngầu quá chừng','Naruto01','2','2','2022/11/03','1','6')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (4,N'Tanjiro01',N'mô hình','3000000',N'Mô hình Tanjiro diệt lũ quỷ tà ác xấu xa','Tanjiro01','4','4','2022/11/03','3','10')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (5,N'Ichigo01',N'mô hình','2500000',N'Mô hình Ichigo ngầu đẹp trai','Ichigo01','3','3','2022/11/03','2','8')
SET IDENTITY_INSERT [dbo].[MOHINH] OFF 
SET IDENTITY_INSERT [dbo].[MOHINH] ON
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (6,N'Ace01',N'mô hình','1950000',N'Mô hình Ace hoả quyền mới','Ace01','1','1','2022/11/09','1','5')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (7,N'Hancock01',N'mô hình','3000000',N'Mô hình Boa Hancock nữ hoàng Amazon Lily','Hancock01','1','1','2022/11/09','2','4')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (8,N'Kid01',N'mô hình','2500000',N'Mô hình Eustass Kid thuyền trưởng','Kid01','1','1','2022/11/09','1','3')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (9,N'Law01',N'mô hình','1850000',N'Mô hình Trafalgar D.Water Law cực ngầu','Law01','1','1','2022/11/09','2','6')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (10,N'Nami01',N'mô hình','1500000',N'Mô hình Nami hoa tiêu xinh đẹp','Nami01','1','1','2022/11/09','2','7')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (11,N'Zoro01',N'mô hình','30000000',N'Mô hình kiếm sĩ Roronoa Zoro','Zoro01','1','1','2022/11/09','3','10')

insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (12,N'Naruto02',N'mô hình','2750000',N'Mô hình ảnh phân thân chi thuật Naruto','Naruto02','2','2','2022/11/09','2','6')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (13,N'Kakashi01',N'mô hình','1500000',N'Mô hình Kakashi Anbu','Kakashi01','2','2','2022/11/09','3','7')

insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (14,N'Yuta01',N'mô hình','2500000',N'Mô hình chú thuật sư Yuta','Yuta01','5','5','2022/11/09','4','10')

SET IDENTITY_INSERT [dbo].[MOHINH] ON
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (15,N'Kamado Tanjiro',N'mô hình','2000000',N'Mô hình Kiếm sĩ diệt quỷ Kamado Tanjiro'+char(10)+N'Kích thước : '+ char(10) +N'Cao : 18cm'+ char(10)+N'Nặng : 750g','Yuta01','5','5','2022/11/09','4','10')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (16,N'Nezuko em bé',N'mô hình','1500000',N'Mô hình Nezuko em bé nhập khẩu từ nước ngoài bảo đảm chất lượng','Nezuko02.jpg','4','4','2022/11/16','3','10')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (17,N'Zenitsu Agatsuma',N'mô hình','4000000',N'Mô hình kiếm sĩ Zenitsu ngủ gật','Zenitsu02.jpg','4','4','2022/11/16','2','8')


insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (18,N'Renji Abarai',N'mô hình','2750000',N'Mô hình Abarai chất lượng chuẩn nước ngoài','Abarai.jpg','3','3','2022/11/16','2','8')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (19,N'Sosuke Aizen',N'mô hình','3500000',N'Mô hình cựu đội trưởng đội 5 Aizen','Aizen01.jpg','3','3','2022/11/16','1','5')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (20,N'Byakuya Kuchiki',N'mô hình','1750000',N'Mô hình đội trưởng đội 6 Byakuya','Byakuya01.jpg','3','3','2022/11/16','3','7')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (21,N'Byakuya Kuchiki basic',N'mô hình','2500000',N'Mô hình đội trưởng đội 6 Byakuya','Byakuya02.jpg','3','3','2022/11/16','1','3')

insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (22,N'Kenpachi Zaraki',N'mô hình','2450000',N'Mô hình Kenpachi chất lượng chuẩn nước ngoài','Kenpachi01.jpg','3','3','2022/11/16','2','8')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (23,N'Toshiro Hitsugaya',N'mô hình','3500000',N'Mô hình đội trưởng đội 10 trẻ nhất Toshiro','Toshiro01.jpg','3','3','2022/11/16','1','5')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (24,N'Shigekuni Yamamoto',N'mô hình','1750000',N'Mô hình đội trưởng Gotei 13 Yamamoto','Yamamoto01.jpg','3','3','2022/11/16','3','7')


insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (25,N'DarkKnight Batman',N'mô hình','3450000',N'Mô hình siêu anh hùng Batman','Batman01.jpg','8','8','2022/11/16','2','7')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (26,N'The Flash',N'mô hình','1450000',N'Mô hình siêu anh hùng The Flash','flash01.jpg','8','8','2022/11/16','3','7')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (27,N'Green Lantern',N'mô hình','3750000',N'Mô hình siêu anh hùng Green Lantern','Green01.jpg','8','8','2022/11/16','3','6')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (28,N'Supergirl',N'mô hình','1350000',N'Mô hình siêu nữ anh hùng Supergirl','SuperGirl01.jpg','8','8','2022/11/16','1','4')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (29,N'Superman',N'mô hình','2250000',N'Mô hình siêu anh hùng Superman','Supermanl01.jpg','8','8','2022/11/16','1','4')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (30,N'Wonder Woman',N'mô hình','4350000',N'Mô hình siêu nữ anh hùng Wonder Woman','wwl01.jpg','8','8','2022/11/16','2','4')


insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (31,N'Black Panther',N'mô hình','3450000',N'Mô hình chiến binh báo đen Black Panther','Blackpanther01.jpg','9','9','2022/11/16','2','7')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (32,N'Hydra Captain America',N'mô hình','2450000',N'Mô hình chiến binh Hydra Captain America','Captain01.jpg','9','9','2022/11/16','3','6')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (33,N'Captain America',N'mô hình','1500000',N'Mô hình đội trưởng Mỹ Captain America','Captain02.jpg','9','9','2022/11/16','1','4')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (34,N'Hulk',N'mô hình','3450000',N'Mô hình người khổng lồ xanh Hulk','Hulk01.jpg','9','9','2022/11/16','2','7')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (35,N'Iron Man',N'mô hình','5450000',N'Mô hình người sắt Iron Man','Ironman01.jpg','9','9','2022/11/16','2','4')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (36,N'Spiderman',N'mô hình','3450000',N'Mô hình người nhện Spiderman Into the Spider-Verse','Spiderman01.jpg','9','9','2022/11/16','2','7')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (37,N'Thor Endgame',N'mô hình','3450000',N'Mô hình thần sấm Thor version ENDGAME','Thor01.jpg','9','9','2022/11/16','3','5')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (38,N'Black Panther',N'mô hình','6500000',N'Mô hình thần sấm Thor version Avengers 2012','Thor02.jpg','9','9','2022/11/16','2','7')

SET IDENTITY_INSERT [dbo].[MOHINH] ON
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (39,N'Eren Yeager',N'mô hình','1250000',N'Mô hình Eren còn ở học viện','Eren01.jpg','6','6','2022/11/16','2','4')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (40,N'Levi',N'mô hình','1250000',N'Mô hình binh trưởng Levi, người đàn ông mạnh nhất thế giới','Levi01.jpg','6','6','2022/11/16','2','7')

insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (41,N'Combo 4 nhân vật Fairy Tail',N'mô hình','4000000',N'Combo 4 nhân vật trong phim Fairy Tail','ft01.jpg','7','7','2022/11/16','2','5')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (42,N'Juvia Lockser',N'mô hình','1450000',N'Mô hình Juvia Lockser cựu ma đạo sĩ cấp S','Hulk01.jpg','7','7','2022/11/16','2','7')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (43,N'Natsu Dragneel',N'mô hình','3450000',N'Mô hình	Pháp sư Natsu có sức mạnh Etherious mạnh nhất','Natsu01.jpg','7','7','2022/11/16','2','4')
insert into MOHINH (MaMH, TenMH, Donvitinh, DonGia, MoTa, HinhMinhHoa, MaCD, MaNSX, NgayCapNhat, SoLuongBan, SoLuotXem) values (44,N'Wendy Marvell',N'mô hình','1650000',N'Mô hình Wendy Marvell nữ Sát Long Nhân trẻ tuổi','Wendy01.jpg','7','7','2022/11/16','2','7')

SET IDENTITY_INSERT [dbo].[MOHINH] OFF 

SET IDENTITY_INSERT [dbo].[DONDATHANG] ON
insert into DONDATHANG (MaDH,MaKH,NgayDatHang,TriGia, DaGiao, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, SDTNhan, HTThanhToan, HTGiaoHang) values (1,4,'2022/11/06','2000000',0,'2022/11/11',N'Nguyễn Kế Thuỳ','69 Phạm Hùng P5 Q8','0914235257',0,0)
insert into DONDATHANG (MaDH,MaKH,NgayDatHang,TriGia, DaGiao, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, SDTNhan, HTThanhToan, HTGiaoHang) values (2,5,'2022/10/29','2500000',1,'2022/11/02',N'Trần Thị Thu Hà','11 Thành Thái P14 Q10','0785412365',0,0)
insert into DONDATHANG (MaDH,MaKH,NgayDatHang,TriGia, DaGiao, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, SDTNhan, HTThanhToan, HTGiaoHang) values (3,1,'2022/11/01','1500000',1,'2022/11/05',N'Nguyễn Minh Khang',N'495/8/31 Tô Hiến Thành P14 Q10','0912713802',1,0)
insert into DONDATHANG (MaDH,MaKH,NgayDatHang,TriGia, DaGiao, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, SDTNhan, HTThanhToan, HTGiaoHang) values (4,3,'2022/11/05','1850000',0,'2022/11/10',N'Nguyễn Phước Nguyên',N'Hẻm C3 Phạm Hùng P5 Q8','0707071811',0,0)
insert into DONDATHANG (MaDH,MaKH,NgayDatHang,TriGia, DaGiao, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, SDTNhan, HTThanhToan, HTGiaoHang) values (5,2,'2022/11/04','3000000',0,'2022/11/11',N'Đỗ Thành Công',N'58 Nghĩa Phát P15 Q.Tân Bình','0344533736',1,0)
insert into DONDATHANG (MaDH,MaKH,NgayDatHang,TriGia, DaGiao, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, SDTNhan, HTThanhToan, HTGiaoHang) values (6,8,'2022/09/30','1500000',1,'2022/10/05',N'Đoàn Thị Ngọc Minh',N'18/2 Lữ Gia P8 Q11','0979182329',0,0)
insert into DONDATHANG (MaDH,MaKH,NgayDatHang,TriGia, DaGiao, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, SDTNhan, HTThanhToan, HTGiaoHang) values (7,6,'2022/11/06','2000000',0,'2022/11/11',N'Nguyễn Thanh Vũ',N'65/11 CMT8 P15 Q10','0909876236',1,0)
insert into DONDATHANG (MaDH,MaKH,NgayDatHang,TriGia, DaGiao, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, SDTNhan, HTThanhToan, HTGiaoHang) values (8,7,'2022/11/05','1850000',1,'2022/11/09',N'Lê Thị Minh Ngọc',N'49/51 Phạm Hùng P12 Q8','0918273802',0,0)
insert into DONDATHANG (MaDH,MaKH,NgayDatHang,TriGia, DaGiao, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, SDTNhan, HTThanhToan, HTGiaoHang) values (9,10,'2022/11/06','2000000',0,'2022/11/11',N'Nguyễn Thị Đoan Trang',N'51/2 Lý Thường Kiệt P1 Q10','0785473812',1,0)
insert into DONDATHANG (MaDH,MaKH,NgayDatHang,TriGia, DaGiao, NgayGiaoHang, TenNguoiNhan, DiaChiNhan, SDTNhan, HTThanhToan, HTGiaoHang) values (10,9,'2022/11/07','2000000',0,'2022/11/15',N'Nguyễn Văn Sĩ Hùng',N'358/11/25 Hoà Hảo P14 Q10','0715373812',0,0)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF


insert into CTDATHANG (MaDH, MaMH,SoLuong, DonGia) values (1,1,1,2000000)
insert into CTDATHANG (MaDH, MaMH,SoLuong, DonGia) values (2,8,1,2500000)
insert into CTDATHANG (MaDH, MaMH,SoLuong, DonGia) values (3,13,2,1500000)
insert into CTDATHANG (MaDH, MaMH,SoLuong, DonGia) values (4,9,1,1850000)
insert into CTDATHANG (MaDH, MaMH,SoLuong, DonGia) values (5,7,1,3000000)
insert into CTDATHANG (MaDH, MaMH,SoLuong, DonGia) values (6,13,1,1500000)
insert into CTDATHANG (MaDH, MaMH,SoLuong, DonGia) values (7,1,1,2000000)
insert into CTDATHANG (MaDH, MaMH,SoLuong, DonGia) values (8,9,2,1850000)
insert into CTDATHANG (MaDH, MaMH,SoLuong, DonGia) values (9,1,1,2000000)
insert into CTDATHANG (MaDH, MaMH,SoLuong, DonGia) values (10,1,1,2000000)


ALTER TABLE [dbo].[KHACHHANG] ADD PassCus nchar(50) 
alter table [dbo].[CHUDE] add HinhChuDe varchar (50)

insert into [dbo].[CHUDE] (HinhChuDe) values ('logo-onepiece.png')