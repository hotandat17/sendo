-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2024 at 07:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping-sendo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userId`, `createdAt`, `updatedAt`) VALUES
('40355015-452f-416a-a28e-c523c21d3797', 'aee9be71-a715-41df-9a28-c4b1b7234bf1', '2024-12-13 16:35:19', '2024-12-13 16:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `cartitems`
--

CREATE TABLE `cartitems` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `cartId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `productId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cartitems`
--

INSERT INTO `cartitems` (`id`, `cartId`, `productId`, `quantity`, `createdAt`, `updatedAt`) VALUES
('5ff7d21a-df9f-48f8-bcd8-298276fa5555', '40355015-452f-416a-a28e-c523c21d3797', '5b02b438-f45e-4a04-ba64-cd545b738332', 19, '2024-12-13 17:51:31', '2024-12-14 05:57:58'),
('8ad81e4e-a926-46ff-84c6-9cbd198a159c', '40355015-452f-416a-a28e-c523c21d3797', 'fe3e12cd-74a8-46ed-8f70-da22384289ca', 30, '2024-12-13 16:35:19', '2024-12-14 06:08:48'),
('ee8b149c-99b4-4993-a4ff-61778d888c0e', '40355015-452f-416a-a28e-c523c21d3797', '2f3ef0d6-2019-4b75-b183-338fc13cb17e', 30, '2024-12-13 17:05:39', '2024-12-14 09:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
('b7be4d6c-5f8e-493c-af15-7bf3712e00b4', 'Thời trang nữ', NULL, '2024-12-11 05:26:02', '2024-12-11 05:26:02'),
('c57d5b41-d3b1-4e05-80de-185d60a88b89', 'Sức khỏe - Làm đẹp', NULL, '2024-12-11 05:26:37', '2024-12-11 05:26:37'),
('db3d88bb-5722-4c33-bd70-bd710a52075d', 'Đồng hồ - Trang sức', NULL, '2024-12-11 05:27:15', '2024-12-11 05:27:15'),
('f2eaeb05-bc3e-40cc-8217-985ed19878b9', 'Thời trang nam', NULL, '2024-12-11 05:25:53', '2024-12-11 05:25:53');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `subCategoryId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `image`, `quantity`, `createdAt`, `updatedAt`, `subCategoryId`) VALUES
('02a588d5-4cc5-4904-87c1-9c837ca02095', 'Quần jogger nam cá tính', 'Quần jogger nam thiết kế cá tính, trẻ trung, chất liệu cotton thoáng mát.', 170000.00, 'https://salt.tikicdn.com/ts/tmp/28/07/45/2dfcce41d7056716d22774dee860179c.jpg', 15, '2024-12-17 17:49:06', '2024-12-17 17:49:06', '8a4b79b9-f612-4b72-b281-1101ade64aa2'),
('0611b9b8-b1e2-45fe-b408-1b07f457182b', 'Đầm váy nữ xòe hoa', 'Đầm váy nữ xòe hoa, trẻ trung, nữ tính, thích hợp cho những buổi dạo phố.', 280000.00, 'https://down-vn.img.susercontent.com/file/642fa8b36129d1b9b4b39320a9b576c5', 20, '2024-12-17 17:59:11', '2024-12-17 17:59:11', '930083ba-4bed-45dc-a607-72aed717012c'),
('0f55b57f-ae1d-482b-87eb-994b7cfa4a1b', 'Áo hoodie nam trơn', 'Áo hoodie nam trơn chất liệu nỉ ấm áp, phù hợp mùa đông.', 150.00, 'https://vn-test-11.slatic.net/p/1a130a88593671068f6446f30284bb89.jpg', 15, '2024-12-17 17:26:44', '2024-12-17 17:26:44', '08cfbe35-1916-489d-be13-9363f5ca1818'),
('0f78de28-1b17-4e98-bd33-d07844291871', 'Tinh chất dưỡng da mật ong', 'Tinh chất dưỡng da mật ong, cung cấp dưỡng chất làm sáng da và chống lão hóa hiệu quả.', 450000.00, 'https://vn-live-01.slatic.net/p/40ffe8b4495fa26ac4f26b82c125cda7.jpg', 20, '2024-12-17 18:12:09', '2024-12-17 18:12:09', '70c434e5-35fe-4b1f-8db1-62993d880178'),
('0f9b7dde-7990-49b7-8a0f-5a7d83b781c1', 'Áo thun nam cổ tròn', 'Áo thun nam cổ tròn chất liệu cotton mềm mịn, thoáng mát.', 85.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXfQPObya0PlsBWm89oMOL0PawEq3F76de3w&s', 25, '2024-12-17 17:18:13', '2024-12-17 17:18:13', '08cfbe35-1916-489d-be13-9363f5ca1818'),
('14074cf0-66e4-4db5-802d-fed5d841ca6d', 'Đầm váy nữ lệch vai', 'Đầm váy nữ lệch vai, thiết kế sang trọng và quyến rũ, phù hợp cho các bữa tiệc tối.', 400000.00, 'https://neva.vn/upload/img/dam%20maxi%20lech%20vai1.jpg', 15, '2024-12-17 17:59:50', '2024-12-17 17:59:50', '930083ba-4bed-45dc-a607-72aed717012c'),
('16ca46db-2577-4863-a471-6acd2207cf53', 'Nước hoa unisex Tom Ford Oud Wood', 'Nước hoa unisex Tom Ford Oud Wood, mùi hương gỗ trầm ấm, phù hợp cho cả nam và nữ.', 3500000.00, 'https://nuochoa95.com/Data/images/san%20pham/Tom%20Ford/tom-ford-oud-wood-intense-1.jpg', 30, '2024-12-17 18:15:09', '2024-12-17 18:15:09', 'c5eec49d-736b-447c-884d-d7b20d3e42a5'),
('18b0dc6f-5a6f-45d7-9920-5429a42367e6', 'Đồng hồ nam Rolex Submariner', 'Đồng hồ nam Rolex Submariner, phong cách sang trọng, thời gian chính xác, phù hợp cho những dịp đặc biệt.', 35000000.00, 'https://i0.wp.com/dwatch.vn/wp-content/uploads/2020/12/%C4%90%E1%BB%93ng-h%E1%BB%93-Rolex-nam-si%C3%AAu-c%E1%BA%A5p-1.jpg?fit=2560%2C2560&ssl=1', 10, '2024-12-17 18:20:06', '2024-12-17 18:20:06', '9a330fea-4169-4a0f-be9b-d5f8c9c25262'),
('19ec4fc9-0bdb-46d8-993f-eb981e0df3a2', 'Áo sơ mi nam caro tay dài', 'Áo sơ mi nam caro tay dài, chất liệu vải mềm thoáng mát.', 145.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNJwZfasj4oiTYyf_ZXg8dwqZ-tNWRxcrGQw&s', 15, '2024-12-17 17:42:55', '2024-12-17 17:42:55', '635d8222-c328-4850-99ac-bdea4d0f126d'),
('1e9a709e-2707-44ac-ab2c-2be05c94aa2e', 'Áo khoác nữ bomber', 'Áo khoác nữ bomber, phong cách trẻ trung và năng động.', 380000.00, 'https://vn-test-11.slatic.net/p/70329b2ad12048fb458e7ebb6187c47c.jpg', 25, '2024-12-17 17:55:13', '2024-12-17 17:55:13', '88b38c28-b2c5-477c-95b1-97eb71a412d3'),
('20f5c37f-6c81-41e1-81f0-6f24b8ff5673', 'Quần dài jean slimfit nam', 'Quần jean dài slimfit tôn dáng cho nam giới.', 140.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHNhXW1A9AUFnIMiBQT_RHo9mlR9GmTC4UPA&s', 19, '2024-12-17 17:11:02', '2024-12-17 17:11:02', '0478796b-808f-4e8f-8257-f195910aad40'),
('21064ecf-1374-4185-b937-64579bc46139', 'Quần dài jean nam rách', 'Quần dài jean nam phong cách, điểm nhấn với thiết kế rách cá tính.', 150.00, 'https://mcdn.coolmate.me/image/September2023/quan-jeans-rach-nam_657.jpg', 18, '2024-12-17 17:10:55', '2024-12-17 17:10:55', '0478796b-808f-4e8f-8257-f195910aad40'),
('23392a1e-17f0-4264-aee4-0f9140e1e2da', 'Nước hoa nữ Chanel No.5', 'Nước hoa nữ Chanel No.5, mùi hương nhẹ nhàng, sang trọng, phù hợp cho các dịp đặc biệt.', 3000000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbOuMrLvxRqEPYOJgzdia3KQHJGSh60qVuog&s', 50, '2024-12-17 18:13:49', '2024-12-17 18:13:49', 'c5eec49d-736b-447c-884d-d7b20d3e42a5'),
('23fcdd01-52fc-4f2b-94c0-9d44b9db60c8', 'Nhẫn nữ vàng 18k', 'Nhẫn nữ vàng 18k, thiết kế tinh tế, mang lại vẻ đẹp lấp lánh cho người sở hữu.', 5000000.00, 'https://trangsuctsj.vn/wp-content/uploads/2021/07/nhan-cap-vang-18k-mat-da-citrine-vang.jpg', 25, '2024-12-17 18:23:22', '2024-12-17 18:23:22', 'd1d23fd8-7c17-47e6-9de4-6dec231ed88e'),
('244de829-3fbf-472b-9045-e84f2f6b4aa2', 'Áo sơ mi nam dài tay', 'Áo sơ mi dài tay lịch lãm, phù hợp công sở và các sự kiện.', 140.00, 'https://www.chapi.vn/img/product/2019/8/14/ao-so-mi-nam-dai-tay-four1-7-500x500.jpg', 18, '2024-12-17 17:25:34', '2024-12-17 17:25:34', '08cfbe35-1916-489d-be13-9363f5ca1818'),
('29657510-620b-4035-a747-3a6c24be2b79', 'Áo sơ mi nam trắng cổ điển', 'Áo sơ mi trắng tay dài, kiểu dáng cổ điển phù hợp đi làm và dự tiệc.', 120.00, 'https://dongphuchaianh.vn/wp-content/uploads/2022/08/Nhung-mau-ao-so-mi-trang-nam-dep-nhat-dai-tay-basic.jpeg', 20, '2024-12-17 17:30:33', '2024-12-17 17:30:33', '635d8222-c328-4850-99ac-bdea4d0f126d'),
('2b2a34b2-bf48-4e98-b096-45f9f5cf4fd1', 'Áo khoác nam dạ', 'Áo khoác nam dạ cao cấp, giữ ấm tốt và mang lại vẻ ngoài lịch lãm, sang trọng.', 400000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdLvMCBE1WY9pzsYAUvnbhCrHWhbQsSGqB5A&s', 10, '2024-12-17 17:52:25', '2024-12-17 17:52:25', 'cc42efa0-2939-4654-9cec-5381f4091bb0'),
('2f3ef0d6-2019-4b75-b183-338fc13cb17e', 'Quần tây baggy công sở cạp liền 2 cúc- Quần baggy nữ lưng cao dễ phối đồ đi làm siêu xinh - fd0014fh', 'Giới thiệu sản phẩm: Quần tây baggy nữ công sở lưng cao cạp liền 2 cúc thuộc bộ sưu tập quần baggy vải K&amp;K SHOP Quần Baggy Nữ lưng cao: Mẫu quần siêu hot dành cho các chị em nếu bạn không sở hữu một đôi chân dài thon gọn thì cũng khỏi lo nha, sả...', 189.00, 'https://media3.scdn.vn/img4/2021/07_24/eiFTKjQSSVTHuj8wyyb3_simg_de2fe0_500x500_maxb.jpg', 30, '2024-12-11 06:16:47', '2024-12-11 06:16:47', 'd2a6d537-d31d-4be1-a213-b359bca467ca'),
('31e8a06d-a46b-495f-9964-3e8ece687de5', 'Quần nam kaki thời trang', 'Quần kaki nam thiết kế đơn giản, thanh lịch, thích hợp mặc đi làm và đi chơi.', 150000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_KF3s8OX67BIZFeoZFg_EfN7GoZW5KO8_lg&s', 20, '2024-12-17 17:47:04', '2024-12-17 17:47:04', '8a4b79b9-f612-4b72-b281-1101ade64aa2'),
('353abb12-957f-4584-80fb-f896ffe38a91', 'Quần dài nam vải dù chống nước', 'Quần dài vải dù bền chắc, chống nước phù hợp cho mọi hoạt động ngoài trời.', 130.00, 'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-lo1uqfonc9ln50', 17, '2024-12-17 17:11:25', '2024-12-17 17:11:25', '0478796b-808f-4e8f-8257-f195910aad40'),
('361d1a13-6a07-4de1-96c9-0f3b9237c773', 'Quần nữ jean ôm', 'Quần nữ jean ôm sát, thiết kế trẻ trung, phù hợp cho nhiều phong cách khác nhau.', 350000.00, 'https://thoitrangngaynay.com/upload/images/Quan-jean-nu-dep-lung-cao-om-dang(1).jpg', 25, '2024-12-17 18:05:17', '2024-12-17 18:05:17', 'd2a6d537-d31d-4be1-a213-b359bca467ca'),
('3b68fe3c-d0df-47a9-a62d-40c38dca6bba', 'Kính mát nữ thời trang', 'Kính mát nữ thiết kế hiện đại, bảo vệ mắt khỏi ánh nắng mặt trời.', 150000.00, 'https://hoangmaiphukien.com/wp-content/uploads/2022/06/Kinh-ram-thoi-trang-nu-cao-cap-phien-ban-Han-Quoc-khong-gong-da-dang-mau-sac-tang-kem-phu-kien-HL01.jpg', 30, '2024-12-17 18:01:39', '2024-12-17 18:01:39', '99a99001-360b-4a43-9fa2-f839a820cb9a'),
('43356f61-9177-4549-a6fb-270b0c9ce6fb', 'Áo len nữ dài tay', 'Áo len nữ dài tay, thiết kế ấm áp và thời trang, phù hợp cho mùa thu đông.', 350000.00, 'https://down-vn.img.susercontent.com/file/5ba04630f9515db5e50d8c4dabd0a8bd', 15, '2024-12-17 18:09:23', '2024-12-17 18:09:23', 'f0921582-9555-4699-9896-d1d94da1bc2c'),
('52adc67a-9a41-4b56-8426-d5252ff8d414', 'Sữa dưỡng da mật ong', 'Sữa dưỡng da mật ong, làm dịu và phục hồi làn da khô, giúp da mềm mại và căng mịn.', 250000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVk_hZ5PfMxwNgGwxgRdRJDwYbBjbm-qoQEg&s', 25, '2024-12-17 18:11:35', '2024-12-17 18:11:35', '70c434e5-35fe-4b1f-8db1-62993d880178'),
('52f0afe6-6d8c-419f-8aec-69d793199684', 'Quần nữ đẹp ', 'Áo thun nữ tay ngắn cổ tròn trơn công sở dạo phố c25   Link shop: https://www.sendo.vn/shop/maikhanh-shop Xin chào quý khách!!! Để đặt hàng quý khách có thể đặt hàng trực tiếp trên sendo hoặc liên hệ Zalo: 0898451592 hoặc 0386595653 ', 65.00, 'https://media3.scdn.vn/img4/2022/03_14/uwHpr6glaSQeZMf3nEqW_simg_de2fe0_500x500_maxb.jpg', 30, '2024-12-17 15:24:10', '2024-12-17 15:24:10', 'd2a6d537-d31d-4be1-a213-b359bca467ca'),
('583629bc-094f-4505-8fd0-e7722196b607', 'Quần dài nam túi hộp', 'Quần dài nam túi hộp phong cách quân đội thời trang.', 100.00, 'https://bumshop.com.vn/wp-content/uploads/2019/12/quan-jogger-kaki-nam-tui-hop-xam-1.jpg', 14, '2024-12-17 17:11:17', '2024-12-17 17:11:17', '0478796b-808f-4e8f-8257-f195910aad40'),
('59291efc-fbe9-4e31-94d7-83acad66e37e', 'Áo sơ mi nam denim', 'Áo sơ mi nam denim phong cách bụi bặm, cá tính, phù hợp dạo phố.', 160.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOCMJqs_AJdyBRo-7Y2gjbG553Yx8SREffIQ&s', 10, '2024-12-17 17:43:30', '2024-12-17 17:43:30', '635d8222-c328-4850-99ac-bdea4d0f126d'),
('5b02b438-f45e-4a04-ba64-cd545b738332', 'Quần suông nhung tăm ống rộng bigsize ', '  - Quần Nhung Tăm Ống Rộng dài 95 - 100cm chất nhung tăm- Có 3 màu: đen, be, ghi ( Kèm Ảnh Thật Shop Tự Chụp )- Bảng size (S, M, L, XL) tương ứng khoảng cân với số đo các vòng- Shop ưu tiên theo thông số đo eo mông hơn nha c e, thông số cân nặng để câ...', 75.00, 'https://media3.scdn.vn/img4/2022/10_14/D295u22te3AdCYDJ219H_simg_de2fe0_500x500_maxb.png', 30, '2024-12-11 06:14:43', '2024-12-11 06:14:43', 'd2a6d537-d31d-4be1-a213-b359bca467ca'),
('62f45ac5-90e3-4187-856f-408d3771e2bd', 'Nhẫn nữ kim cương', 'Nhẫn nữ kim cương, thiết kế sang trọng, thích hợp cho các dịp đám cưới, lễ kỷ niệm.', 12000000.00, 'https://tnj.vn/57601-large_default/nhan-nu-kim-cuong-moissanite-don-gian-nnm0005.jpg', 15, '2024-12-17 18:24:21', '2024-12-17 18:24:21', 'd1d23fd8-7c17-47e6-9de4-6dec231ed88e'),
('64aa0d55-ad2b-44c2-86cf-9a1bba8d9cba', 'Quần dài nam vải lụa', 'Quần dài vải lụa mềm mịn, thoải mái cho ngày hè.', 110.00, 'https://down-vn.img.susercontent.com/file/2caf1867a61ce12e88644227ebedc7f3', 12, '2024-12-17 17:11:10', '2024-12-17 17:11:10', '0478796b-808f-4e8f-8257-f195910aad40'),
('6ff3d158-dc7c-4296-a837-1ddfc717d4a4', 'Đồng hồ nam Fossil Hybrid HR', 'Đồng hồ nam Fossil Hybrid HR, kết hợp giữa đồng hồ kỹ thuật số và cơ học, phù hợp với phong cách hiện đại.', 4000000.00, 'https://umove.com.vn/mediacenter/media/images/503/products/503/33/ghh-1641787795.png', 20, '2024-12-17 18:21:31', '2024-12-17 18:21:31', '9a330fea-4169-4a0f-be9b-d5f8c9c25262'),
('70765ae2-878d-47fe-9926-06ffa8c52e5d', 'Áo sơ mi nữ công sở', 'Áo sơ mi nữ công sở, thiết kế thanh lịch, phù hợp với môi trường làm việc chuyên nghiệp.', 250000.00, 'https://pos.nvncdn.com/f06edc-11055/ps/content/20230316_nTnmbYMDGdFc.jpg', 25, '2024-12-17 18:08:23', '2024-12-17 18:08:23', 'f0921582-9555-4699-9896-d1d94da1bc2c'),
('72a447ec-f91f-4cf6-8ff0-90b293d694be', 'Áo khoác nữ parka', 'Áo khoác nữ parka có mũ, ấm áp và dễ phối đồ cho mùa đông.', 500000.00, 'https://imgcdn.thitruongsi.com/tts/rs:fill:600:0:1:1/g:sm/plain/file://product/2022/02/09/9fdb7d00-8930-11ec-ae0f-9d42765cef34.jpg', 15, '2024-12-17 17:56:43', '2024-12-17 17:56:43', '88b38c28-b2c5-477c-95b1-97eb71a412d3'),
('769e2526-d14a-439f-8885-1767d2111f87', 'Áo khoác nữ cardigan', 'Áo khoác nữ cardigan, phong cách nhẹ nhàng, dễ dàng phối với các trang phục khác.', 300000.00, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/403/511/products/o1cn01cghzgm1j9lg4yihj11660954.jpg', 20, '2024-12-17 18:08:52', '2024-12-17 18:08:52', 'f0921582-9555-4699-9896-d1d94da1bc2c'),
('7d1cd226-6de6-401c-ac31-0f761b496303', 'Áo sơ mi nam ngắn tay họa tiết', 'Áo sơ mi nam ngắn tay họa tiết trẻ trung, phong cách mùa hè.', 95.00, 'https://product.hstatic.net/1000318840/product/08_chu_phuc_d2fd274bded74b6f989209a89d3dff14_master.jpg', 30, '2024-12-17 17:25:43', '2024-12-17 17:25:43', '08cfbe35-1916-489d-be13-9363f5ca1818'),
('813ddd13-8e15-49e3-9677-c30477a54701', 'Đồng hồ nam Omega Seamaster', 'Đồng hồ nam Omega Seamaster, thiết kế thể thao, độ bền cao, phù hợp cho những chuyến phiêu lưu ngoài trời.', 25000000.00, 'https://donghopho.vn/upload/img/2022/07/29/1659089847372_Omega-Seamaster-Professional-Diver-210.32.42.20.01.001-%C4%90%E1%BB%93ng-H%E1%BB%93-Ph%E1%BB%91-1.jpg', 15, '2024-12-17 18:20:29', '2024-12-17 18:20:29', '9a330fea-4169-4a0f-be9b-d5f8c9c25262'),
('8574c34c-4ad2-42fa-bc78-6e5afa36c1cd', 'Đầm váy nữ ôm body', 'Đầm váy nữ ôm body, thiết kế tôn dáng, phù hợp cho các buổi tiệc hay sự kiện.', 350000.00, 'https://bizweb.dktcdn.net/100/208/198/products/4309ea04-0c1b-4031-b2cb-e61ad4a307b4.jpg?v=1681101487480', 25, '2024-12-17 17:58:02', '2024-12-17 17:58:02', '930083ba-4bed-45dc-a607-72aed717012c'),
('85b75764-3252-4b00-9583-ede11b6d4bdd', 'Nước hoa nam Dior Sauvage', 'Nước hoa nam Dior Sauvage, mùi hương mạnh mẽ, nam tính, phù hợp cho những buổi tối quyến rũ.', 2800000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8jE-N_wq-msVhQBartmNsNg020P2NoXFtiw&s', 45, '2024-12-17 18:14:15', '2024-12-17 18:14:15', 'c5eec49d-736b-447c-884d-d7b20d3e42a5'),
('85c6564d-2f93-415d-aeda-23f63d6e4831', 'Áo ba lỗ nam tập gym', 'Áo ba lỗ nam thoáng mát, co giãn, phù hợp cho các buổi tập gym.', 70.00, 'https://thegioidotap.vn/wp-content/uploads/2022/12/z4433816121770_06774ca6bcad66453c7a0394295b838a.jpg', 28, '2024-12-17 17:28:06', '2024-12-17 17:28:06', '08cfbe35-1916-489d-be13-9363f5ca1818'),
('865f689c-198d-4f49-8613-e96f94667b55', 'Áo sơ mi nam tay ngắn', 'Áo sơ mi nam tay ngắn vải lanh, thoáng mát, phù hợp mùa hè.', 115.00, 'https://vulcano.sgp1.digitaloceanspaces.com/media/20305/ao-so-mi-4036W-1.jpg', 25, '2024-12-17 17:43:59', '2024-12-17 17:43:59', '635d8222-c328-4850-99ac-bdea4d0f126d'),
('88ac5749-7058-427d-84fd-a7f2d70a6540', 'Áo khoác gió nam', 'Áo khoác gió nam nhẹ, chống nước, thích hợp đi du lịch và dạo phố.', 175.00, 'https://aokhoacnam.vn/upload/product/akn-180/ao-khoac-gio-nam-den-chinh-hang.jpg', 12, '2024-12-17 17:27:30', '2024-12-17 17:27:30', '08cfbe35-1916-489d-be13-9363f5ca1818'),
('8d755eb6-797f-46b8-9253-978ebdab8ea0', 'Quần short nam thể thao', 'Quần short nam chất liệu thun co giãn, thích hợp cho các hoạt động thể thao.', 120000.00, 'https://product.hstatic.net/1000406053/product/ca._aoste_2_h_-_noir_-_ca.h623390.noi_eeef8dc007214f01b2b69c3113a1ee87_master.jpg', 30, '2024-12-17 17:48:21', '2024-12-17 17:48:21', '8a4b79b9-f612-4b72-b281-1101ade64aa2'),
('92f521b1-0cac-40c3-8a97-47a78de330da', 'Quần kaki nam', 'Quần dài kaki nam bền đẹp, form chuẩn cho phái mạnh.', 90.00, 'https://pos.nvncdn.com/5048a3-93414/ps/20211227_ahAL9gd0dYGwpbDlCDFo5Emr.jpg', 15, '2024-12-17 17:10:27', '2024-12-17 17:10:27', '0478796b-808f-4e8f-8257-f195910aad40'),
('9747fa63-6db5-410b-aa7f-ccb404bf203d', 'Nước hoa nữ Gucci Bloom', 'Nước hoa nữ Gucci Bloom, mùi hương hoa cỏ nhẹ nhàng, mang lại cảm giác tươi mới và quyến rũ.', 2500000.00, 'https://product.hstatic.net/1000340570/product/bloom-edp_af83b7f7217e433dbafa621ec2f2509e_master.jpg', 40, '2024-12-17 18:14:45', '2024-12-17 18:14:45', 'c5eec49d-736b-447c-884d-d7b20d3e42a5'),
('979c2137-5292-4446-a618-54f04cc20c41', 'Đầm váy nữ suông dáng dài', 'Đầm váy nữ suông dáng dài, thoải mái và thanh lịch, thích hợp cho các buổi gặp mặt bạn bè.', 330000.00, 'https://lamia.com.vn/storage/anh-seo/dam-suong-dai.jpg', 18, '2024-12-17 18:00:20', '2024-12-17 18:00:20', '930083ba-4bed-45dc-a607-72aed717012c'),
('9853770c-9169-4bd6-86fe-c19f95882b35', 'Quần dài nam thể thao jogger', 'Quần dài nam kiểu jogger co giãn thoải mái khi tập luyện.', 80.00, 'https://product.hstatic.net/200000472743/product/untitled_session18305_f37b4fa093424a38b2be884013e3dd83_master.jpg', 22, '2024-12-17 17:10:47', '2024-12-17 17:10:47', '0478796b-808f-4e8f-8257-f195910aad40'),
('98d73841-7f26-49fe-b039-c44d5019e2c0', 'Kem dưỡng da mật ong', 'Kem dưỡng da mật ong, cung cấp độ ẩm cho da, làm mềm mịn và trắng sáng.', 350000.00, 'https://bizweb.dktcdn.net/100/371/892/products/kem-du-o-ng-tra-ng-da-ma-t-chie-t-xua-t-su-a-ong-chu-a-truesky-whitening-face-cream-20g.jpg?v=1652492662317', 30, '2024-12-17 18:11:03', '2024-12-17 18:11:03', '70c434e5-35fe-4b1f-8db1-62993d880178'),
('9b7bf5ce-3a98-43a9-8b69-d5c81c8204d1', 'Dây chuyền nữ bạc', 'Dây chuyền nữ làm từ bạc cao cấp, thiết kế tinh tế, thích hợp cho các buổi tiệc.', 250000.00, 'https://down-vn.img.susercontent.com/file/19e238cdd14c4e92c7feda166407ccd8', 25, '2024-12-17 18:02:08', '2024-12-17 18:02:08', '99a99001-360b-4a43-9fa2-f839a820cb9a'),
('9b865c48-e366-4ea9-ba94-3119e694905e', 'Đồng hồ nam Casio G-Shock', 'Đồng hồ nam Casio G-Shock, thiết kế mạnh mẽ, chống va đập, phù hợp cho các hoạt động thể thao.', 1500000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMI1AGV5GxoozdRUeWFFD8JlXJng9hJJnb9w&s', 50, '2024-12-17 18:19:32', '2024-12-17 18:19:32', '9a330fea-4169-4a0f-be9b-d5f8c9c25262'),
('9c4092c5-58f8-4086-b0a1-8620aa7c6203', 'Áo sơ mi nam kẻ sọc', 'Áo sơ mi nam họa tiết kẻ sọc trẻ trung, phong cách và thời trang.', 135.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPODAQDR7z5hwxJs4vJvs-8_BShBrWtsz2HA&s', 18, '2024-12-17 17:38:08', '2024-12-17 17:38:08', '635d8222-c328-4850-99ac-bdea4d0f126d'),
('9d009d3a-901f-4d88-b532-1d9bd0260cdf', 'Bộ phong thủy thạch anh vàng', 'Bộ phong thủy thạch anh vàng, mang lại sự may mắn và tài lộc cho gia chủ.', 500000.00, 'https://phongthuyshop.com.vn/admin/sanpham/cay-da-tieu-canh-non-bo-thach-anh-vang_110271_anh1.jpg', 50, '2024-12-17 18:16:17', '2024-12-17 18:16:17', '9953ba49-8a68-452e-a00e-a412b59dddc9'),
('a232aba6-1747-4823-b681-d3dd0e987924', 'Áo khoác nữ dài tay nhẹ', 'Áo khoác nữ dài tay chất liệu nhẹ, thích hợp cho các ngày se lạnh.', 250000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCaRNCAEFdHr_2DGefMulYFdiVlkD1T7vJuw&s', 18, '2024-12-17 17:56:09', '2024-12-17 17:56:09', '88b38c28-b2c5-477c-95b1-97eb71a412d3'),
('a26e0961-7880-40fb-8f91-c82720e2ba1f', 'Áo khoác nam gió chống nước', 'Áo khoác nam gió chống nước, thiết kế năng động, thích hợp cho những ngày mưa.', 220000.00, 'https://armystore.vn/upload/files/12910599330_553616300.jpg', 30, '2024-12-17 17:50:40', '2024-12-17 17:50:40', 'cc42efa0-2939-4654-9cec-5381f4091bb0'),
('a9f835e5-23ad-4afe-8bd9-d02ad5b97c8a', 'Nhẫn nam bạc 925', 'Nhẫn nam bạc 925, thiết kế sang trọng, thích hợp cho các dịp đặc biệt.', 1500000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlwVX_2FAqVtJfAaLmtO_oRPRRhPyr6CzBGg&s', 30, '2024-12-17 18:22:45', '2024-12-17 18:22:45', 'd1d23fd8-7c17-47e6-9de4-6dec231ed88e'),
('ae0a6240-087f-42b8-b6bf-f86898c09570', 'Áo thun nữ basic', 'Áo thun nữ basic, thiết kế đơn giản, dễ phối đồ, thích hợp cho các buổi dạo phố.', 150000.00, 'https://pos.nvncdn.com/888555-3379/ps/20190410_huLgT1XyxSsRNKd6dlivaHTo.jpg', 30, '2024-12-17 18:07:56', '2024-12-17 18:07:56', 'f0921582-9555-4699-9896-d1d94da1bc2c'),
('b091f7ef-00b5-40ab-835b-782df56fe1b0', 'Quần nữ ống rộng', 'Quần nữ ống rộng, thiết kế thoải mái, thích hợp cho những buổi dạo phố hay đi chơi.', 300000.00, 'https://maylanstore.com/wp-content/uploads/2020/11/quan-thun-ong-rong-den-1.jpg', 20, '2024-12-17 18:06:24', '2024-12-17 18:06:24', 'd2a6d537-d31d-4be1-a213-b359bca467ca'),
('b138a5d7-93cd-468c-b92e-68ee7509f723', 'Áo sơ mi nam cổ tàu', 'Áo sơ mi nam cổ tàu kiểu dáng độc đáo, lịch lãm và sang trọng.', 150.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuV-83555hgq_dQj10ghPY5jEbIqHGiLjucQ&s', 22, '2024-12-17 17:44:31', '2024-12-17 17:44:31', '635d8222-c328-4850-99ac-bdea4d0f126d'),
('b46d258d-5d17-49d1-9c59-fb7e1128a9b5', 'Áo khoác nam bomber', 'Áo khoác bomber nam với chất liệu vải bền bỉ, thiết kế thời trang, phù hợp cho mùa thu đông.', 280000.00, 'https://down-vn.img.susercontent.com/file/7b52e519b8956724ea2246532e3b5806', 25, '2024-12-17 17:51:17', '2024-12-17 17:51:17', 'cc42efa0-2939-4654-9cec-5381f4091bb0'),
('b49b8f53-2ef0-4aa8-b1f8-4a8f89985034', 'Nam nữ xin đẹp ', 'Áo thun nữ tay ngắn cổ tròn trơn công sở dạo phố c25   Link shop: https://www.sendo.vn/shop/maikhanh-shop Xin chào quý khách!!! Để đặt hàng quý khách có thể đặt hàng trực tiếp trên sendo hoặc liên hệ Zalo: 0898451592 hoặc 0386595653 ', 65.00, 'https://media3.scdn.vn/img4/2022/03_14/uwHpr6glaSQeZMf3nEqW_simg_de2fe0_500x500_maxb.jpg', 30, '2024-12-17 15:33:01', '2024-12-17 15:33:01', 'd2a6d537-d31d-4be1-a213-b359bca467ca'),
('bf7469a2-2987-49fe-bb61-5fd276ac2d64', 'Quần nữ vải dáng suông', 'Quần nữ vải dáng suông, thoải mái và thanh lịch, dễ dàng phối với nhiều kiểu áo.', 270000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9o-LZnyPkbgMA4MOrEUEceg75B6pWMju5nw&s', 30, '2024-12-17 18:05:57', '2024-12-17 18:05:57', 'd2a6d537-d31d-4be1-a213-b359bca467ca'),
('c6b4b63a-c988-4ffc-b5f5-b7523d785f3b', 'Áo khoác nam parka', 'Áo khoác nam parka có mũ, chống gió và giữ ấm tuyệt vời cho mùa đông lạnh giá.', 350000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDa-5mncHXjUqj22nVdLUm9VaHBqs-K7uy_Q&s', 15, '2024-12-17 17:51:54', '2024-12-17 17:51:54', 'cc42efa0-2939-4654-9cec-5381f4091bb0'),
('c8d73eb0-1949-4a66-972f-4a5f4c3323bf', 'Bộ phong thủy tượng Phật di lạc', 'Bộ phong thủy tượng Phật di lạc, mang lại niềm vui và sự thịnh vượng cho gia đình.', 750000.00, 'https://phunuvietnam.mediacdn.vn/179072216278405120/2023/8/9/tuong-phat-di-lac-dep-nhat063111336-1691561618337917600360.jpg', 30, '2024-12-17 18:17:47', '2024-12-17 18:17:47', '9953ba49-8a68-452e-a00e-a412b59dddc9'),
('cb441bfe-568d-4eda-95bd-48d44cb883ee', 'Bộ phong thủy đá mã não', 'Bộ phong thủy đá mã não, bảo vệ gia chủ khỏi những năng lượng xấu và mang lại sự bình an.', 400000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBfnik5YV-kByedqgLdYNZaZQohtvCUVSN7g&s', 40, '2024-12-17 18:17:19', '2024-12-17 18:17:19', '9953ba49-8a68-452e-a00e-a412b59dddc9'),
('cb60444c-c78e-4211-81fe-3535f9e30f9a', 'Nhẫn nam đính đá', 'Nhẫn nam đính đá, thiết kế mạnh mẽ, mang lại vẻ đẹp ấn tượng cho người sử dụng.', 2000000.00, 'https://pos.nvncdn.com/331316-3334/ps/20230622_8n0TFLCQcH.jpeg', 40, '2024-12-17 18:24:57', '2024-12-17 18:24:57', 'd1d23fd8-7c17-47e6-9de4-6dec231ed88e'),
('ccb8c697-178e-4f5f-9f29-da5a922eaade', 'Áo khoác nữ dạ cổ lông', 'Áo khoác nữ dạ cổ lông, sang trọng và ấm áp cho mùa đông lạnh giá.', 450000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSESDnH2K002ksfoZgHs7H_V7uB2-FAvgEtOw&s', 20, '2024-12-17 17:54:01', '2024-12-17 17:54:01', '88b38c28-b2c5-477c-95b1-97eb71a412d3'),
('cce1e41a-2d49-4488-a0dc-29805ac00f78', 'Đầm váy nữ công sở', 'Đầm váy nữ công sở, thiết kế thanh lịch và nhẹ nhàng, thích hợp cho môi trường làm việc.', 290000.00, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/403/511/products/o1cn014osuef1ovkmnrmlns2129001.jpg', 30, '2024-12-17 17:58:32', '2024-12-17 17:58:32', '930083ba-4bed-45dc-a607-72aed717012c'),
('d17dea28-109b-464c-af47-e922f5227890', 'Áo polo nam thể thao', 'Áo polo nam thể thao kiểu dáng lịch sự, chất liệu thấm hút mồ hôi.', 110.00, 'https://product.hstatic.net/200000456065/product/3a_36391ae208394cd58eee0ea308e66474.png', 20, '2024-12-17 17:20:40', '2024-12-17 17:20:40', '08cfbe35-1916-489d-be13-9363f5ca1818'),
('d46af521-306a-49b3-961c-29c9bf341948', 'Đồng hồ nam Seiko 5', 'Đồng hồ nam Seiko 5, thiết kế đơn giản nhưng tinh tế, phù hợp với mọi phong cách.', 2000000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3us09VwohavpnIhFD0jbJwCGUujxZ5vowHg&s', 30, '2024-12-17 18:21:05', '2024-12-17 18:21:05', '9a330fea-4169-4a0f-be9b-d5f8c9c25262'),
('dbfd658a-c8ae-4072-81ce-2c175e552af9', 'Bộ phong thủy tượng ngọc bích', 'Bộ phong thủy tượng ngọc bích, tượng trưng cho sự thịnh vượng, trường thọ và hạnh phúc.', 800000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2Mz8or7tOVZ23yWVPLMFgNx9U8ZGTw5jjFQ&s', 25, '2024-12-17 18:18:23', '2024-12-17 18:18:23', '9953ba49-8a68-452e-a00e-a412b59dddc9'),
('df3b7526-3426-4c5b-b5a7-27c8510f2459', 'Mặt nạ dưỡng da mật ong', 'Mặt nạ dưỡng da mật ong, giúp cung cấp độ ẩm sâu và làm sáng da chỉ sau một lần sử dụng.', 200000.00, 'https://thefaceshop360.net/wp-content/uploads/2017/10/mat-truoc-mat-na-mat-ong-real-nature-honey-face-mask-face-shop.jpg', 35, '2024-12-17 18:12:34', '2024-12-17 18:12:34', '70c434e5-35fe-4b1f-8db1-62993d880178'),
('e0b8d59d-afe2-4a10-9b67-0da18f8a194a', 'Nhẫn nữ đá quý', 'Nhẫn nữ với đá quý sang trọng, phù hợp cho các dịp lễ hội và tiệc tùng.', 350000.00, 'https://tahigems.vn/wp-content/uploads/2022/01/tahigems-5488-nhan-nu-hoang-gia-ket-hop-giua-citrine-va-kim-cuong-resize-40.jpg', 20, '2024-12-17 18:02:39', '2024-12-17 18:02:39', '99a99001-360b-4a43-9fa2-f839a820cb9a'),
('e5080062-4bb2-4f73-bf54-934ba17d7294', 'Bộ phong thủy gỗ hương', 'Bộ phong thủy gỗ hương, giúp tăng cường sức khỏe và năng lượng tích cực cho gia đình.', 600000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmGNSUm9j1TbD4bqc8S6LPu1hfULI6Q9eufA&s', 45, '2024-12-17 18:16:47', '2024-12-17 18:16:47', '9953ba49-8a68-452e-a00e-a412b59dddc9'),
('e595218d-3779-4310-8a2c-a7681abbdb00', 'Nhẫn nữ bạc 925 đính ngọc trai', 'Nhẫn nữ bạc 925 đính ngọc trai, thiết kế tinh xảo, mang lại vẻ đẹp dịu dàng và thanh thoát.', 2500000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhmkvuNhYXU1ji2yUVw8xySonyi_Y_FchqSQ&s', 35, '2024-12-17 18:25:51', '2024-12-17 18:25:51', 'd1d23fd8-7c17-47e6-9de4-6dec231ed88e'),
('e5f28e93-86fb-42b5-9993-ba350d3a6cc5', 'Túi xách nữ da thật', 'Túi xách nữ làm từ da thật, thiết kế thời trang, phù hợp cho đi làm và đi chơi.', 650000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT36DkfEcrG6ahOUKBPJUZNDM8jKXHCMFRrAg&s', 15, '2024-12-17 18:03:34', '2024-12-17 18:03:34', '99a99001-360b-4a43-9fa2-f839a820cb9a'),
('e81c6a2d-3497-4360-a169-183d45af54a8', 'Quần dài nam baggy', 'Quần dài nam kiểu dáng baggy trẻ trung, năng động.', 85.00, 'https://zizoou.com/cdn/shop/products/Quan-Baggy-Jean-nam-nu-2b-1-Quan-ong-rong-xanh-classic-ZiZoou-Store_300x300_crop_center.jpg?v=1680283265', 30, '2024-12-17 17:10:40', '2024-12-17 17:10:40', '0478796b-808f-4e8f-8257-f195910aad40'),
('e86eeb0c-3f4d-410b-b15b-dd3a3cf925c6', 'Quần dài nam công sở', 'Quần dài nam công sở lịch lãm, thích hợp cho môi trường làm việc.', 120.00, 'https://dongphucbonmua.com/wp-content/uploads/2021/08/dong-phuc-quan-tay-nam-cong-so-26-min.jpg', 20, '2024-12-17 17:10:16', '2024-12-17 17:10:16', '0478796b-808f-4e8f-8257-f195910aad40'),
('f57a845e-12eb-4769-b61c-56a4d575f9ef', 'Áo crop top nữ', 'Áo crop top nữ, thiết kế năng động và trẻ trung, lý tưởng cho các buổi đi chơi hay dạo phố.', 200000.00, 'https://bizweb.dktcdn.net/100/287/440/files/ao-croptop-mua-den-nu.jpg?v=1611823715543', 30, '2024-12-17 18:09:51', '2024-12-17 18:09:51', 'f0921582-9555-4699-9896-d1d94da1bc2c'),
('f799cdb8-d38e-49d7-a674-7e0a32e3e307', 'Quần nam jean co giãn', 'Quần jean nam chất liệu co giãn, mang lại cảm giác thoải mái suốt cả ngày.', 180000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9EWRnMF0kZlxjSvqA3u2WcmAmlNjhJs30Bg&s', 25, '2024-12-17 17:47:43', '2024-12-17 17:47:43', '8a4b79b9-f612-4b72-b281-1101ade64aa2'),
('f9bd89fa-3c80-407b-8053-1d5db8140969', 'Quần dài nam thể thao', 'Quần dài nam thể thao phong cách, thoáng mát, chất liệu cotton co giãn.', 75.00, 'https://img.lazcdn.com/g/p/18fb76adb45091dc6d54fc41bd161bdb.jpg_720x720q80.jpg', 25, '2024-12-17 17:08:07', '2024-12-17 17:08:07', '0478796b-808f-4e8f-8257-f195910aad40'),
('faae5d01-b146-4a7d-8948-97ad33feb3e2', 'Áo khoác nữ hoodie', 'Áo khoác nữ hoodie, thiết kế thời trang, phù hợp cho mùa thu đông.', 320000.00, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnjlfo03rx0t0c', 30, '2024-12-17 17:54:35', '2024-12-17 17:54:35', '88b38c28-b2c5-477c-95b1-97eb71a412d3'),
('fc7a772f-a12b-4d28-ac3f-fca4b9719f30', 'Khăn quàng cổ nữ lụa', 'Khăn quàng cổ nữ làm từ lụa mềm mại, thiết kế sang trọng, dễ dàng phối với các bộ trang phục.', 200000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3zFs7SLTOjHCSbN4DlImYMuefu8cB8qg4lg&s', 25, '2024-12-17 18:04:08', '2024-12-17 18:04:08', '99a99001-360b-4a43-9fa2-f839a820cb9a'),
('fe3e12cd-74a8-46ed-8f70-da22384289ca', 'Áo thun nữ tay ngắn cổ tròn trơn công sở dạo phố c25 - C25', 'Áo thun nữ tay ngắn cổ tròn trơn công sở dạo phố c25   Link shop: https://www.sendo.vn/shop/maikhanh-shop Xin chào quý khách!!! Để đặt hàng quý khách có thể đặt hàng trực tiếp trên sendo hoặc liên hệ Zalo: 0898451592 hoặc 0386595653 ', 65.00, 'https://media3.scdn.vn/img4/2022/03_14/uwHpr6glaSQeZMf3nEqW_simg_de2fe0_500x500_maxb.jpg', 30, '2024-12-11 06:21:56', '2024-12-11 06:21:56', 'f0921582-9555-4699-9896-d1d94da1bc2c'),
('ff96d4ad-512c-4065-80c2-141a3eb80909', 'Bông tai nữ bạc', 'Bông tai nữ làm từ bạc, thiết kế tinh xảo và nhẹ nhàng, phù hợp với mọi trang phục.', 180000.00, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/231/234/products/ha82-2.png?v=1664782415317', 30, '2024-12-17 18:03:05', '2024-12-17 18:03:05', '99a99001-360b-4a43-9fa2-f839a820cb9a');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `name`, `description`, `createdAt`, `updatedAt`, `categoryId`) VALUES
('0478796b-808f-4e8f-8257-f195910aad40', 'Quần dài nam', NULL, '2024-12-11 05:51:28', '2024-12-11 05:51:28', 'f2eaeb05-bc3e-40cc-8217-985ed19878b9'),
('08cfbe35-1916-489d-be13-9363f5ca1818', 'Áo nam', NULL, '2024-12-11 05:50:23', '2024-12-11 05:50:23', 'f2eaeb05-bc3e-40cc-8217-985ed19878b9'),
('635d8222-c328-4850-99ac-bdea4d0f126d', 'Áo sơ mi', NULL, '2024-12-11 05:51:38', '2024-12-11 05:51:38', 'f2eaeb05-bc3e-40cc-8217-985ed19878b9'),
('70c434e5-35fe-4b1f-8db1-62993d880178', 'Dưỡng da mặt', NULL, '2024-12-11 05:52:44', '2024-12-11 05:52:44', 'c57d5b41-d3b1-4e05-80de-185d60a88b89'),
('88b38c28-b2c5-477c-95b1-97eb71a412d3', 'Áo khoác nữ', NULL, '2024-12-11 05:48:18', '2024-12-11 05:48:18', 'b7be4d6c-5f8e-493c-af15-7bf3712e00b4'),
('8a4b79b9-f612-4b72-b281-1101ade64aa2', 'Quần nam', NULL, '2024-12-11 05:50:35', '2024-12-11 05:50:35', 'f2eaeb05-bc3e-40cc-8217-985ed19878b9'),
('930083ba-4bed-45dc-a607-72aed717012c', 'Đầm ,Váy', NULL, '2024-12-11 05:47:40', '2024-12-11 05:47:40', 'b7be4d6c-5f8e-493c-af15-7bf3712e00b4'),
('9953ba49-8a68-452e-a00e-a412b59dddc9', 'Bộ phong thủy', NULL, '2024-12-11 05:54:55', '2024-12-11 05:54:55', 'db3d88bb-5722-4c33-bd70-bd710a52075d'),
('99a99001-360b-4a43-9fa2-f839a820cb9a', 'Phụ kiện thời trang nữ', NULL, '2024-12-14 07:31:53', '2024-12-14 07:31:53', 'b7be4d6c-5f8e-493c-af15-7bf3712e00b4'),
('9a330fea-4169-4a0f-be9b-d5f8c9c25262', 'Đồng hồ nam', NULL, '2024-12-11 05:54:20', '2024-12-11 05:54:20', 'db3d88bb-5722-4c33-bd70-bd710a52075d'),
('c5eec49d-736b-447c-884d-d7b20d3e42a5', 'Nước hoa', NULL, '2024-12-11 05:52:57', '2024-12-11 05:52:57', 'c57d5b41-d3b1-4e05-80de-185d60a88b89'),
('cc42efa0-2939-4654-9cec-5381f4091bb0', 'Áo khoác nam', NULL, '2024-12-11 05:50:44', '2024-12-11 05:50:44', 'f2eaeb05-bc3e-40cc-8217-985ed19878b9'),
('d1d23fd8-7c17-47e6-9de4-6dec231ed88e', 'Nhẫn', NULL, '2024-12-11 05:55:03', '2024-12-11 05:55:03', 'db3d88bb-5722-4c33-bd70-bd710a52075d'),
('d2a6d537-d31d-4be1-a213-b359bca467ca', 'Quần nữ', NULL, '2024-12-11 05:48:05', '2024-12-11 05:48:05', 'b7be4d6c-5f8e-493c-af15-7bf3712e00b4'),
('f0921582-9555-4699-9896-d1d94da1bc2c', 'Áo nữ', NULL, '2024-12-11 05:47:53', '2024-12-11 05:47:53', 'b7be4d6c-5f8e-493c-af15-7bf3712e00b4');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `numberPhone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullName`, `numberPhone`, `address`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
('aee9be71-a715-41df-9a28-c4b1b7234bf1', 'Đạt Hồ', '0939062509', '43/46 vuon lai', 'hotandat17@gmail.com', '$2a$10$UKWDEf5S1xJ12MXZyb0wO.oAFcjUBMrLrHH5pbJsmNsZvpPtU/WLy', '2024-12-13 09:00:20', '2024-12-13 09:00:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartId` (`cartId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subCategoryId` (`subCategoryId`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD CONSTRAINT `cartitems_ibfk_345` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cartitems_ibfk_346` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`subCategoryId`) REFERENCES `subcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
