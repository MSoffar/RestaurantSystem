-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2021 at 08:11 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opd`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, 'APPETIZERS', 'Start your meal off right with our tasty appetizers, perfect for sharing or enjoying solo.', '2024-05-06 12:00:00'),
(2, 'SANDWICHES', 'Satisfy your hunger with our delicious sandwiches, packed with flavorful ingredients and served on fresh bread.', '2024-05-06 12:00:00'),
(3, 'SMASH BURGERS', 'Indulge in our mouth-watering smash burgers, made with premium beef and smashed to perfection on the grill.', '2024-05-06 12:00:00'),
(4, 'LOADED FRIES', 'Treat yourself to our loaded fries topped with cheese, bacon, jalapenos, and more, for a flavor explosion in every bite.', '2024-05-06 12:00:00'),
(5, 'MAC AND CHEESE', 'Delight in our creamy mac and cheese, made with a blend of cheeses and baked to perfection.', '2024-05-06 12:00:00'),
(6, 'SAUCES', 'Enhance your meal with our selection of delicious sauces, from tangy barbecue to creamy ranch.', '2024-05-06 12:00:00'),
(7, 'DRINKS', 'Quench your thirst with our refreshing selection of beverages, including sodas, juices, and more.', '2024-05-06 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `FoodId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Food`
--

CREATE TABLE `Food` (
  `FoodId` int(12) NOT NULL,
  `FoodName` varchar(255) NOT NULL,
  `FoodPrice` int(12) NOT NULL,
  `FoodDesc` text NOT NULL,
  `FoodCategorieId` int(12) NOT NULL,
  `FoodPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Food`
--

INSERT INTO `Food` (`FoodId`, `FoodName`, `FoodPrice`, `FoodDesc`, `FoodCategorieId`, `FoodPubDate`) VALUES
(1, 'Homemade Nuggets', 80, 'Delicious homemade chicken nuggets, perfect for snacking or sharing.', 1, '2024-05-06 12:00:00'),
(2, 'Stuffed Chicken Popcorn', 105, 'Crispy popcorn chicken stuffed with gooey cheese, a delightful appetizer.', 1, '2024-05-06 12:00:00'),
(3, 'Dipped Chicken Fingers', 105, 'Tender chicken fingers dipped in a savory sauce, a classic appetizer choice.', 1, '2024-05-06 12:00:00'),
(4, 'Mozzarella Sticks', 80, 'Golden mozzarella sticks fried to perfection, served with marinara sauce.', 1, '2024-05-06 12:00:00'),
(5, 'Cheesy Fries', 65, 'Crispy fries topped with melted cheese, a comforting and indulgent appetizer.', 1, '2024-05-06 12:00:00'),
(6, 'Fries', 30, 'Classic crispy fries, the perfect accompaniment to any meal.', 1, '2024-05-06 12:00:00'),

-- Sandwiches
(7, 'Buffalo Chicken Sandwich', 110, 'Spicy buffalo chicken sandwich served with lettuce, tomato, and ranch dressing.', 2, '2024-05-06 12:00:00'),
(8, 'Philly Cheese Steak Sandwich', 120, 'Tender slices of steak with sautéed onions, peppers, and melted cheese on a hoagie roll.', 2, '2024-05-06 12:00:00'),
(9, 'Cheesy Chicken Sandwich', 130, 'Grilled chicken sandwich topped with melted cheese, lettuce, and mayo.', 2, '2024-05-06 12:00:00'),
(10, 'Original Chicken Sandwich', 130, 'Classic fried chicken sandwich served with pickles and mayo on a soft bun.', 2, '2024-05-06 12:00:00'),

-- Smash Burgers
(11, 'Original Beef Smash Burger', 120, 'Juicy beef patty smashed on the grill and topped with lettuce, tomato, and pickles.', 3, '2024-05-06 12:00:00'),
(12, 'Cheesy Beef Smash Burger', 140, 'Savory beef patty topped with melted cheese, lettuce, and our special sauce.', 3, '2024-05-06 12:00:00'),
(13, 'Crunchy Beef Smash Burger', 180, 'Crunchy beef patty topped with lettuce, crispy onions, and tangy BBQ sauce.', 3, '2024-05-06 12:00:00'),
(14, 'Texas Beef Smash Burger', 120, 'Hearty beef patty topped with bacon, BBQ sauce, onion rings, and cheddar cheese.', 3, '2024-05-06 12:00:00'),
(15, 'Blue Cheese Beef Smash Burger', 125, 'Flavorful beef patty topped with tangy blue cheese, lettuce, and caramelized onions.', 3, '2024-05-06 12:00:00'),
(16, 'Surf and Turf Beef Smash Burger', 135, 'Delicious beef patty topped with grilled shrimp, lettuce, and garlic aioli.', 3, '2024-05-06 12:00:00'),

-- Loaded Fries
(17, 'Dipped Honey BBQ Chicken Bites Loaded Fries', 110, 'Crispy fries loaded with honey BBQ chicken bites, melted cheese, and ranch dressing.', 4, '2024-05-06 12:00:00'),
(18, 'Dipped Buffalo Chicken Bites Loaded Fries', 110, 'Loaded fries topped with buffalo chicken bites, melted cheese, and blue cheese dressing.', 4, '2024-05-06 12:00:00'),
(19, 'Smash Burger Loaded Fries', 115, 'Irresistible loaded fries topped with smashed beef, cheese, and our signature sauce.', 4, '2024-05-06 12:00:00'),

-- Mac and Cheese
(20, 'Classic Mac and Cheese', 70, 'Creamy macaroni and cheese made with a blend of cheeses, a timeless favorite.', 5, '2024-05-06 12:00:00'),
(21, 'Honey BBQ Chicken Mac and Cheese', 75, 'Mac and cheese loaded with tender honey BBQ chicken, a sweet and savory delight.', 5, '2024-05-06 12:00:00'),

-- Sauces
(22, 'Buffalo Sauce', 25, 'Spicy and tangy buffalo sauce, perfect for dipping or drizzling.', 6, '2024-05-06 12:00:00'),
(23, 'Cheese Sauce', 25, 'Smooth and creamy cheese sauce, great for topping fries or nachos.', 6, '2024-05-06 12:00:00'),
(24, 'Ketchup', 25, 'Classic tomato ketchup, a must-have condiment for any meal.', 6, '2024-05-06 12:00:00'),
(25, 'Hot Sauce', 25, 'Fiery hot sauce for those who like a little heat with their food.', 6, '2024-05-06 12:00:00'),
(26, 'Blue Cheese Dressing', 25, 'Creamy blue cheese dressing, perfect for salads or dipping wings.', 6, '2024-05-06 12:00:00'),
(27, 'Honey BBQ Sauce', 25, 'Sweet and tangy BBQ sauce with a hint of honey, great for marinating or dipping.', 6, '2024-05-06 12:00:00'),

-- Drinks
(28, 'Cola', 15, 'Classic cola soda, refreshing and satisfying.', 7, '2024-05-06 12:00:00'),
(29, 'Pepsi', 15, 'Refreshing Pepsi soda, the perfect companion to any meal.', 7, '2024-05-06 12:00:00'),
(30, '7UP', 15, 'Crisp and bubbly 7UP soda, a refreshing choice for any occasion.', 7, '2024-05-06 12:00:00'),
(31, 'Spiro Spathis', 15, 'Spiro Spathis drink, a unique blend of flavors for a refreshing experience.', 7, '2024-05-06 12:00:00'),
(32, 'Big Cola', 12, 'Big Cola, a larger-than-life cola soda for those who love a bold flavor.', 7, '2024-05-06 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'True Mama', 'TrueMama@outlook.com', 01115978887, 01115979997, 'Kafr Abdo Saint Gini Sq. Alexandria', '2024-05-06 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `FoodId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `Food`
--
ALTER TABLE `Food`
  ADD PRIMARY KEY (`FoodId`);
ALTER TABLE `Food` ADD FULLTEXT KEY `FoodName` (`FoodName`,`FoodDesc`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Food`
--
ALTER TABLE `Food`
  MODIFY `FoodId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
