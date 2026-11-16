-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2026 at 03:03 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`log_id`, `user_id`, `action`, `description`, `created_at`) VALUES
(1, 1, 'Admin Login', 'Head administrator successfully logged into the system dashboard.', '2026-11-15 20:18:47');

-- --------------------------------------------------------

--
-- Table structure for table `availability_inquiries`
--

CREATE TABLE `availability_inquiries` (
  `inquiry_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `pickup_hub` varchar(150) DEFAULT NULL,
  `vehicle_category` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `inquiry_status` enum('pending','checked','confirmed','unavailable') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `availability_inquiries`
--

INSERT INTO `availability_inquiries` (`inquiry_id`, `customer_id`, `pickup_hub`, `vehicle_category`, `start_date`, `end_date`, `inquiry_status`, `created_at`) VALUES
(1, 1, 'Manila Flagship Hub', 'offroad', '2026-11-20', '2026-11-23', 'checked', '2026-11-15 20:05:47'),
(2, 1, 'Clark International (CRK)', 'family', '2026-11-25', '2026-11-28', 'pending', '2026-11-15 20:05:47');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `booking_reference` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `pickup_hub` varchar(150) DEFAULT NULL,
  `pickup_date` date NOT NULL,
  `return_date` date NOT NULL,
  `rental_days` int(11) NOT NULL,
  `daily_rate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rental_fee` decimal(12,2) DEFAULT 0.00,
  `service_fee` decimal(12,2) DEFAULT 0.00,
  `tax` decimal(12,2) DEFAULT 0.00,
  `total_amount` decimal(12,2) DEFAULT 0.00,
  `booking_status` enum('pending','approved','rejected','confirmed','ongoing','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `booking_reference`, `customer_id`, `vehicle_id`, `customer_name`, `contact_number`, `email`, `pickup_hub`, `pickup_date`, `return_date`, `rental_days`, `daily_rate`, `rental_fee`, `service_fee`, `tax`, `total_amount`, `booking_status`, `created_at`) VALUES
(7, 'BK-2026-0001', 1, 1, 'Nicky Customer', '09171234567', 'nickyisdreaming@gmail.com', 'Manila Flagship Hub', '2026-11-20', '2026-11-23', 3, 4500.00, 13500.00, 500.00, 1620.00, 15620.00, 'confirmed', '2026-11-15 20:04:37');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `vehicle_id` int(11) NOT NULL,
  `vehicle_name` varchar(150) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `category` enum('offroad','family','city','sports','other') DEFAULT 'other',
  `transmission` enum('automatic','manual','other') DEFAULT 'automatic',
  `horsepower` varchar(50) DEFAULT NULL,
  `seating_capacity` int(11) DEFAULT NULL,
  `plate_number` varchar(30) DEFAULT NULL,
  `daily_rate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `vehicle_source` enum('company','customer_lending') DEFAULT 'company',
  `availability_status` enum('available','reserved','rented','maintenance','unavailable') DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`vehicle_id`, `vehicle_name`, `brand`, `model`, `category`, `transmission`, `horsepower`, `seating_capacity`, `plate_number`, `daily_rate`, `description`, `image_path`, `vehicle_source`, `availability_status`, `created_at`) VALUES
(1, 'Ford Ranger Wildtrak 4x4', 'Ford', 'Ranger Wildtrak 4x4', 'offroad', 'automatic', '210 hp', 5, 'FRW-4041', 4500.00, 'Built for extreme terrain with advanced 4WD systems, heavy-duty suspension, and high wading depth for rugged trails and unpaved provincial roads.', 'https://images.unsplash.com/photo-1551830820-330a71b99659?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33'),
(2, 'Toyota Hilux Conquest', 'Toyota', 'Hilux Conquest', 'offroad', 'automatic', '201 hp', 5, 'THC-4042', 4200.00, 'Renowned for reliability across rocky paths, mud tracks, and steep inclines. The ultimate heavy-duty adventure workhorse.', 'https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33'),
(3, 'Mitsubishi Montero Sport', 'Mitsubishi', 'Montero Sport', 'offroad', 'automatic', '181 hp', 7, 'MMS-4043', 4800.00, 'Combines executive comfort with 4WD capability, making it suitable for highway cruising and off-road exploration.', 'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33'),
(4, 'Toyota Innova Zenix Hybrid', 'Toyota', 'Innova Zenix Hybrid', 'family', 'automatic', '184 hp', 7, 'TIH-4044', 3800.00, 'A spacious family vehicle with a 7-seater layout, captain\'s seats, hybrid fuel efficiency, and a smooth ride.', 'https://images.unsplash.com/photo-1617469767053-d3b523a0b982?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33'),
(5, 'Hyundai Staria', 'Hyundai', 'Staria', 'family', 'automatic', '177 hp', 11, 'HST-4045', 5500.00, 'Futuristic styling with a spacious cabin, wide panoramic windows, and comfortable seating for family or group travel.', 'https://images.unsplash.com/photo-1566933293069-b55c7f326dd4?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33'),
(6, 'Toyota Hiace Commuter / GL', 'Toyota', 'Hiace Commuter / GL', 'family', 'manual', '174 hp', 15, 'THC-4046', 5000.00, 'A practical transport option for big families, road trips, and group excursions, with high passenger capacity and proven durability.', 'https://images.unsplash.com/photo-1570125909232-eb263c188f7e?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33'),
(7, 'Toyota Wigo', 'Toyota', 'Wigo', 'city', 'automatic', '65 hp', 5, 'TWG-4047', 2000.00, 'Compact and easy to drive, designed for tight parking, everyday errands, and busy city traffic.', 'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33'),
(8, 'Honda Brio', 'Honda', 'Brio', 'city', 'automatic', '89 hp', 5, 'HBR-4048', 2200.00, 'Features a refined 4-cylinder engine in a nimble hatchback body, suitable for everyday city driving.', 'https://images.unsplash.com/photo-1502877338535-766e1452684a?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33'),
(9, 'BYD Tang DM-i', 'BYD', 'Tang DM-i', 'family', 'automatic', '400 hp', 7, 'BYD-4049', 6000.00, 'A premium plug-in hybrid SUV featuring advanced technology, spacious seating, impressive driving range, and a comfortable interior for family journeys.', 'https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33'),
(10, 'Toyota Avanza 1.3 E CVT', 'Toyota', 'Avanza 1.3 E CVT', 'family', 'automatic', '98 hp', 7, 'TAV-4050', 2800.00, 'A practical and fuel-efficient family MPV with comfortable seating, a spacious cabin, and a compact design suitable for everyday transportation and family trips.', 'https://images.unsplash.com/photo-1566933293069-b55c7f326dd4?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33'),
(11, 'Nissan NP300', 'Nissan', 'NP300', 'offroad', 'manual', '163 hp', 5, 'NNP-4051', 3500.00, 'A durable pickup truck designed for demanding work and outdoor adventures, offering a strong chassis, practical cargo capacity, and dependable performance.', 'https://images.unsplash.com/photo-1551830820-330a71b99659?auto=format&fit=crop&w=600&q=80', 'company', 'available', '2026-11-15 19:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `car_lending`
--

CREATE TABLE `car_lending` (
  `lending_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `owner_full_name` varchar(200) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `car_brand_model` varchar(150) NOT NULL,
  `vehicle_type` enum('sedan','suv','van','pickup') NOT NULL,
  `transmission` enum('automatic','manual') NOT NULL,
  `daily_rental_rate` decimal(12,2) NOT NULL,
  `car_image` varchar(255) DEFAULT NULL,
  `lending_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `submitted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_lending`
--

INSERT INTO `car_lending` (`lending_id`, `customer_id`, `owner_full_name`, `contact_number`, `car_brand_model`, `vehicle_type`, `transmission`, `daily_rental_rate`, `car_image`, `lending_status`, `submitted_at`) VALUES
(1, NULL, 'tori mayflower', '09999101512', 'honda city', 'sedan', 'automatic', 16.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRo305W7AVJzJjRLIHmD_NxgExeZeNV8ND8sSJsCyFkQ&s=10', 'pending', '2026-11-15 20:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `home_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`, `first_name`, `last_name`, `contact_number`, `home_address`) VALUES
(1, 2, 'Nicky', 'Customer', '09171234567', 'Manila Flagship Hub, Metro Manila');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `inquiry_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `inquiry_status` enum('pending','responded','closed') DEFAULT 'pending',
  `submitted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`inquiry_id`, `customer_id`, `customer_name`, `message`, `inquiry_status`, `submitted_at`) VALUES
(1, 1, 'Nicky Customer', 'Do you offer long-term corporate leasing options for the Ford Ranger fleet?', 'pending', '2026-11-15 20:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `mail_config`
--

CREATE TABLE `mail_config` (
  `config_id` int(11) NOT NULL,
  `smtp_email` varchar(150) NOT NULL,
  `smtp_app_password` varchar(100) NOT NULL,
  `sender_name` varchar(150) DEFAULT 'JCLMR Drive Security',
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mail_config`
--

INSERT INTO `mail_config` (`config_id`, `smtp_email`, `smtp_app_password`, `sender_name`, `is_active`) VALUES
(1, 'valriescarlet@gmail.com', 'hmipdgnybgsjvavo', 'JCLMR Drive Security', 1),
(2, 'nickyisdreaming@gmail.com', 'norjlougoygmthks', 'JCLMR Drive Security', 0),
(3, 'jackmorgan200205@gmail.com', 'mqbrhckiwfyeburx', 'JCLMR Drive Security', 1),
(4, 'lilyscarlet2001@gmail.com', 'soohufxoghtpllvf', 'JCLMR Drive Security', 1);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `maintenance_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `maintenance_type` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `maintenance_date` date NOT NULL,
  `completion_date` date DEFAULT NULL,
  `cost` decimal(12,2) DEFAULT 0.00,
  `maintenance_status` enum('scheduled','ongoing','completed') DEFAULT 'scheduled',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`maintenance_id`, `vehicle_id`, `maintenance_type`, `description`, `maintenance_date`, `completion_date`, `cost`, `maintenance_status`, `created_at`) VALUES
(1, 2, 'Routine Servicing', '10,000km PMS, oil change, and brake pad inspection.', '2026-11-10', '2026-11-10', 4500.00, 'completed', '2026-11-15 20:06:55'),
(2, 7, 'Repair', 'Replace punctured front-right tire and align steering.', '2026-11-15', NULL, 1800.00, 'ongoing', '2026-11-15 20:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `payment_method` enum('GCash','Credit/Debit Card','Cash','Bank Transfer','Other') NOT NULL,
  `transaction_id` varchar(150) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_status` enum('pending','paid','failed','refunded') DEFAULT 'pending',
  `payment_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `booking_id`, `payment_method`, `transaction_id`, `amount`, `payment_status`, `payment_date`) VALUES
(2, 7, 'GCash', 'GC-123456789', 3500.00, 'paid', '2026-11-12 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `receipt_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `receipt_number` varchar(60) NOT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `vehicle_name` varchar(150) DEFAULT NULL,
  `plate_number` varchar(30) DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `rental_days` int(11) DEFAULT NULL,
  `price_per_day` decimal(12,2) DEFAULT NULL,
  `additional_charges` decimal(12,2) DEFAULT 0.00,
  `discount` decimal(12,2) DEFAULT 0.00,
  `total_paid` decimal(12,2) NOT NULL,
  `issued_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`receipt_id`, `payment_id`, `receipt_number`, `customer_name`, `contact_number`, `email`, `vehicle_name`, `plate_number`, `pickup_date`, `return_date`, `rental_days`, `price_per_day`, `additional_charges`, `discount`, `total_paid`, `issued_at`) VALUES
(2, 2, 'CR-2026-001', 'Nicky', '09123456789', 'nickyisdreaming@gmail.com', 'Toyota Vios', 'ABC-1234', '2026-11-12', '2026-11-14', 2, 1500.00, 0.00, 0.00, 3000.00, '2026-11-12 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rental_agreements`
--

CREATE TABLE `rental_agreements` (
  `agreement_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `agreement_number` varchar(60) NOT NULL,
  `selected_vehicle` varchar(150) DEFAULT NULL,
  `rental_start` date DEFAULT NULL,
  `rental_end` date DEFAULT NULL,
  `daily_rate` decimal(12,2) DEFAULT NULL,
  `security_deposit` decimal(12,2) DEFAULT 0.00,
  `renter_signature` varchar(200) DEFAULT NULL,
  `agreed_to_terms` tinyint(1) DEFAULT 0,
  `agreement_status` enum('pending','signed','cancelled') DEFAULT 'pending',
  `signed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rental_returns`
--

CREATE TABLE `rental_returns` (
  `return_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `actual_return_date` datetime DEFAULT NULL,
  `vehicle_condition` text DEFAULT NULL,
  `late_fee` decimal(12,2) DEFAULT 0.00,
  `damage_fee` decimal(12,2) DEFAULT 0.00,
  `additional_charges` decimal(12,2) DEFAULT 0.00,
  `return_status` enum('pending','returned','overdue') DEFAULT 'pending',
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rental_returns`
--

INSERT INTO `rental_returns` (`return_id`, `booking_id`, `actual_return_date`, `vehicle_condition`, `late_fee`, `damage_fee`, `additional_charges`, `return_status`, `remarks`) VALUES
(9, 7, '2026-11-20 14:30:00', 'Minor scratches on the rear bumper, clean interior.', 0.00, 1500.00, 0.00, 'returned', 'Customer informed about rear bumper scratch upon inspection.');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `position` enum('Manager','Rental Staff','Maintenance Staff','Administrator','Head Administrator') NOT NULL,
  `registration_status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `user_id`, `employee_id`, `first_name`, `last_name`, `contact_number`, `position`, `registration_status`) VALUES
(1, 3, '0055-9990', 'jack', 'morgan', '099991015231', 'Maintenance Staff', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('customer','staff','admin','head_admin') NOT NULL DEFAULT 'customer',
  `account_status` enum('pending','active','inactive','suspended') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `role`, `account_status`, `created_at`) VALUES
(1, 'valrie', 'valriescarlet@gmail.com', '$2y$12$qkFQn5PgeEDjrahLe/tUw.6j5QEta4IyG0voTGa/zEgbgAJ83FTUq', 'head_admin', 'active', '2026-11-15 10:20:31'),
(2, 'nicky', 'nickyisdreaming@gmail.com', '$2y$12$m4SQq6YPw./X66U59VT/2.d4MGoA2B5QiuFSQ0NgcwtVGXgOUSUB.', 'customer', 'active', '2026-11-15 10:39:38'),
(3, 'jack', 'jackmorgan200205@gmail.com', '$2y$12$lVpgK/Z89/A18RzpTycc6.r/GWmVXjE3WUyDOf2hCCrCz9JylAJ2O', 'staff', 'active', '2026-11-15 10:44:45'),
(4, 'Lily', 'lilyscarlet2001@gmail.com', '$2y$12$LKPRFc.UCt7k9fIwJcAkM.tzWIDDvubWHyrAvpi3.BDZcPiFBfp4W', 'admin', 'active', '2026-11-15 10:59:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `availability_inquiries`
--
ALTER TABLE `availability_inquiries`
  ADD PRIMARY KEY (`inquiry_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD UNIQUE KEY `booking_reference` (`booking_reference`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `idx_booking_status` (`booking_status`),
  ADD KEY `idx_booking_dates` (`pickup_date`,`return_date`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD UNIQUE KEY `plate_number` (`plate_number`),
  ADD KEY `idx_vehicle_category` (`category`),
  ADD KEY `idx_vehicle_status` (`availability_status`);

--
-- Indexes for table `car_lending`
--
ALTER TABLE `car_lending`
  ADD PRIMARY KEY (`lending_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `idx_lending_status` (`lending_status`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`inquiry_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `mail_config`
--
ALTER TABLE `mail_config`
  ADD PRIMARY KEY (`config_id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `idx_payment_status` (`payment_status`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`receipt_id`),
  ADD UNIQUE KEY `payment_id` (`payment_id`),
  ADD UNIQUE KEY `receipt_number` (`receipt_number`);

--
-- Indexes for table `rental_agreements`
--
ALTER TABLE `rental_agreements`
  ADD PRIMARY KEY (`agreement_id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`),
  ADD UNIQUE KEY `agreement_number` (`agreement_number`);

--
-- Indexes for table `rental_returns`
--
ALTER TABLE `rental_returns`
  ADD PRIMARY KEY (`return_id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD KEY `idx_staff_status` (`registration_status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `availability_inquiries`
--
ALTER TABLE `availability_inquiries`
  MODIFY `inquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `car_lending`
--
ALTER TABLE `car_lending`
  MODIFY `lending_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `inquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mail_config`
--
ALTER TABLE `mail_config`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `maintenance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rental_agreements`
--
ALTER TABLE `rental_agreements`
  MODIFY `agreement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rental_returns`
--
ALTER TABLE `rental_returns`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `availability_inquiries`
--
ALTER TABLE `availability_inquiries`
  ADD CONSTRAINT `availability_inquiries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE SET NULL;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `cars` (`vehicle_id`);

--
-- Constraints for table `car_lending`
--
ALTER TABLE `car_lending`
  ADD CONSTRAINT `car_lending_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE SET NULL;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD CONSTRAINT `inquiries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE SET NULL;

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `cars` (`vehicle_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`);

--
-- Constraints for table `rental_agreements`
--
ALTER TABLE `rental_agreements`
  ADD CONSTRAINT `rental_agreements_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;

--
-- Constraints for table `rental_returns`
--
ALTER TABLE `rental_returns`
  ADD CONSTRAINT `rental_returns_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
