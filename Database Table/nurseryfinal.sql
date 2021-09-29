-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 19, 2021 at 05:04 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nursery`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `prodid` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_qty` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `prodid`, `product_name`, `product_qty`, `rate`, `userid`, `user_id`, `product_id`) VALUES
(15, 1, 'Pink Rose', 1, 35, 'Mangesh', NULL, NULL),
(16, 2, 'Lotus', 1, 30.5, 'Mangesh', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catid` int(11) NOT NULL,
  `catimage` varchar(255) DEFAULT NULL,
  `catname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catid`, `catimage`, `catname`) VALUES
(1, 'img/product/flowers/Cat-flowers.jpeg', 'Flowers'),
(2, 'img/product/pots/Cat-pots.jpeg', 'Pots'),
(3, 'img/product/fruits/Cat-fruits.jpeg', 'Fruits'),
(4, 'img/product/medicinal/Cat-medicinal.jpeg', 'Medicinal'),
(5, 'img/product/vegetables/Cat-vegetables.jpg', 'Vegetables');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `cardno` varchar(255) DEFAULT NULL,
  `nameoncard` varchar(255) DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `shipaddr` text DEFAULT NULL,
  `billaddr` text DEFAULT NULL,
  `bill_addr` varchar(255) DEFAULT NULL,
  `ship_addr` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `cardno`, `nameoncard`, `orderdate`, `status`, `userid`, `shipaddr`, `billaddr`, `bill_addr`, `ship_addr`) VALUES
(2, '1234', '2333', '2021-09-19 06:16:48', 'Pending', 'Mangesh', NULL, NULL, NULL, NULL),
(3, '123', '123', '2021-09-19 06:21:09', 'Pending', 'Mangesh', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `price` double NOT NULL,
  `prodid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `orderid`, `price`, `prodid`, `qty`, `order_id`, `product_id`) VALUES
(1, 2, 35, 1, 1, 2, NULL),
(2, 3, 35, 1, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prodid` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `product_description` text DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `category_catid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prodid`, `catid`, `company`, `pic`, `pname`, `price`, `product_description`, `qty`, `salt`, `category_catid`) VALUES
(1, 1, NULL, 'img/product/flowers/rose.jpg', 'Pink Rose', 35, 'A rose is a woody perennial flowering plant of the genus Rosa, in the family Rosaceae, or the flower it bears. There are over three hundred species and tens of thousands of cultivars.They form a group of plants that can be erect shrubs, climbing, or trailing, with stems that are often armed with sharp prickles.Their flowers vary in size and shape and are usually large and showy, in colours ranging from white through yellows and reds. Most species are native to Asia, with smaller numbers native to Europe, North America, and northwestern Africa.', 90, NULL, 1),
(2, 1, NULL, 'img/product/flowers/lotus.jpeg', 'Lotus', 30.5, 'Nelumbo nucifera, also known as Indian lotus, sacred lotus, or simply lotus, is one of two extant species of aquatic plant in the family Nelumbonaceae. It is sometimes colloquially called a water lily, though this more often refers to members of the family Nymphaeaceae.\r\n\r\nLotus plants are adapted to grow in the flood plains of slow-moving rivers and delta areas. Stands of lotus drop hundreds of thousands of seeds every year to the bottom of the pond. While some sprout immediately, and most are eaten by wildlife, the remaining seeds can remain dormant for an extensive period of time as the pond silts in and dries out. During flood conditions, sediments containing these seeds are broken open, and the dormant seeds rehydrate and begin a new lotus colony.', 10, NULL, 1),
(3, 1, NULL, 'img/product/flowers/sunflower.jpeg', 'sunflower', 45.7, 'Sunflowers are thought to have been domesticated 3000–5000 years ago by Native Americans who would use them primarily as a source for edible seeds. They were then introduced to Europe in the early 16th century and made their way to Russia. In Russia, where oilseed cultivators were located, these flowers were developed and grown on an industrial scale. Russia then reintroduced this oilseed cultivation process to North America in the mid-20th century; North America began their commercial era of sunflower production and breeding. New breeds of the Helianthus spp. began to become more prominent in new geographical areas.', 30, NULL, 1),
(4, 3, NULL, 'img/product/fruits/Apple.jpg', 'Apple', 35, 'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. Apples have religious and mythological significance in many cultures, including Norse, Greek, and European Christian tradition.', 10, NULL, 3),
(5, 3, NULL, 'img/product/fruits/Banana.jpeg', 'Banana', 45, 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called \"plantains\", distinguishing them from dessert bananas. The fruit is variable in size, color, and firmness, but is usually elongated and curved, with soft flesh rich in starch covered with a rind, which may be green, yellow, red, purple, or brown when ripe. The fruits grow in clusters hanging from the top of the plant. Almost all modern edible seedless (parthenocarp) bananas come from two wild species – Musa acuminata and Musa balbisiana. The scientific names of most cultivated bananas are Musa acuminata, Musa balbisiana, and Musa × paradisiaca for the hybrid Musa acuminata × M. balbisiana, depending on their genomic constitution. The old scientific name for this hybrid, Musa sapientum, is no longer used.', 10, NULL, 3),
(6, 3, NULL, 'img/product/fruits/Watermelon.jpg', 'Watermelon', 56, 'Watermelon (Citrullus lanatus) is a flowering plant species of the Cucurbitaceae family and the name of its edible fruit. A scrambling and trailing vine-like plant, it was originally domesticated in Africa. It is a highly cultivated fruit worldwide, with more than 1,000 varieties.\r\n\r\nWild watermelon seeds have been found in the prehistoric Libyan site of Uan Muhuggiag. There is also evidence from seeds in Pharaoh tombs of watermelon cultivation in Ancient Egypt.', 10, NULL, 3),
(7, 2, NULL, 'img/product/pots/plastic-pot.jpg', 'Plastic Pot', 70, 'Gardening can be fun provided you know what type of planter pots to pick when you shop for plastic pots online. These plant pots have an advantage over the others due to some of their inherent properties such as lightweight, durability and resistance to damage. Plastic pots also have a higher capacity to retain moisture in the soil as they are impervious to water evaporation. So, you grow your plants using a lesser amount of water. The water consumption is even lower if you use plastic planters for indoor gardening. It is always better to plan ahead, the size of a pot to be used, based on how big the plant will eventually grow to be and how much water it would consume. If you’re growing vegetables, avoid using dark coloured pots as they increase the heat of the soil. Also, use pots that are long so the roots can grow deeper. If you are growing flowers and other decorative plants, match the size of the plant to the size of the pot to save space. ', 10, NULL, 2),
(8, 2, NULL, 'img/product/pots/Ceramic-pot.jpeg', 'Ceramic pots', 280, 'Ceramic pots come with a glaze that makes it perfect for indoor and outdoor decor. Our entire array of ceramic pots is available in a wide range of colors, shapes, and sizes.\r\n\r\n', 30, NULL, 2),
(9, 2, NULL, 'img/product/pots/Hanging-pot.jpg', 'Hanging Pot', 290, 'Hanging plant holders can fit into any large/tiny spaced area, say a wall or a window above the surface. Hanging plant pots are best suited for balcony, indoor as well as outdoor gardening. Lightweight and decorative, indoor hanging flower pots give a unique look to any decor. \r\n\r\nHanging baskets and containers add a whole new dimension to gardening, helping you utilise all the available space. A variety of flowers and plants can be grown in hanging baskets. The choice of plants in pot planters depends on both the size of the planter and the growing conditions where the plant pot has to be placed. ', 10, NULL, 2),
(10, 4, NULL, 'img/product/medicinal/Aloe-vera.jpg', 'Aloe vera', 250, 'The Aloe vera plant has been known and used for centuries for its health, beauty, medicinal and skin care properties. The name Aloe vera derives from the Arabic word “Alloeh” meaning “shining bitter substance,” while “vera” in Latin means “true.” 2000 years ago, the Greek scientists regarded Aloe vera as the universal panacea. The Egyptians called Aloe “the plant of immortality.” Today, the Aloe vera plant has been used for various purposes in dermatology.', 16, NULL, 4),
(11, 4, NULL, 'img/product/medicinal/Tulsi.jpg', 'Tulsi', 25.5, 'Ocimum tenuiflorum, commonly known as holy basil or tulsi, is an aromatic perennial plant in the family Lamiaceae. It is native to the Indian subcontinent and widespread as a cultivated plant throughout the Southeast Asian tropics.\r\n\r\nTulsi is cultivated for religious and traditional medicine purposes, and also for its essential oil. It is widely used as a herbal tea, commonly used in Ayurveda, and has a place within the Vaishnava tradition of Hinduism, in which devotees perform worship involving holy basil plants or leaves.\r\n\r\n', 23, NULL, 4),
(12, 4, NULL, 'img/product/medicinal/amla.jpg', 'Amla', 35.5, 'The tree is small to medium in size, reaching 1–8 m (3 ft 3 in–26 ft 3 in) in height. The branchlets are not glabrous or finely pubescent, 10–20 cm (3.9–7.9 in) long, usually deciduous; the leaves are simple, subsessile and closely set along branchlets, light green, resembling pinnate leaves. The flowers are greenish-yellow. The fruit is nearly spherical, light greenish-yellow, quite smooth and hard on appearance, with six vertical stripes or furrows.\r\n\r\nRipening in autumn, the berries are harvested by hand after climbing to upper branches bearing the fruits. The taste of Indian emblic is sour, bitter and astringent, and it is quite fibrous.', 23, NULL, 4),
(13, 5, NULL, 'img/product/vegetables/baingan.jpg', 'Brinjal', 30, 'Also known as Brinjal or Aubergine. In England it is known as aubergine and in America it is known as eggplant.\r\nBrinjal contains high fibre content and has low calories, making it a must-add to any healthy diet. With its high fibre content, brinjal moves through the digestive tract slowly, and can make you more satiated.', 20, NULL, 5),
(14, 5, NULL, 'img/product/vegetables/tomato.jpg', 'Tomato', 40, 'The tomato is the edible berry of the plant Solanum lycopersicum, commonly known as a tomato plant. The species originated in western South America and Central America. The Nahuatl word tomatl gave rise to the Spanish word tomate, from which the English word tomato derived. Its domestication and use as a cultivated food may have originated with the indigenous peoples of Mexico. The Aztecs used tomatoes in their cooking at the time of the Spanish conquest of the Aztec Empire, and after the Spanish encountered the tomato for the first time after their contact with the Aztecs, they brought the plant to Europe. From there, the tomato was introduced to other parts of the European-colonized world during the 16th century.', 30, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_register`
--

CREATE TABLE `user_register` (
  `userid` varchar(255) NOT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `upassword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_register`
--

INSERT INTO `user_register` (`userid`, `dob`, `email`, `fname`, `gender`, `lname`, `upassword`) VALUES
('Akash', '2005-02-03', 'akash@gmail.com', 'Akash', 'Male', 'S', NULL),
('Mangesh', '2020-02-12', 'ser', 'Mangesh', 'Male', 'J', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhqr7kwtkw9hr3pekken9n1qpt` (`user_id`),
  ADD KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKryfgqky7mqodcmxno0lsgxst` (`userid`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  ADD KEY `FKinivj2k1370kw224lavkm3rqm` (`product_id`),
  ADD KEY `FKh35b1ljeu4440iie9psw8a7yt` (`orderid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodid`),
  ADD KEY `FKm06c9i95wxavx4oyvfksuweuy` (`category_catid`);

--
-- Indexes for table `user_register`
--
ALTER TABLE `user_register`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prodid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`prodid`),
  ADD CONSTRAINT `FKhqr7kwtkw9hr3pekken9n1qpt` FOREIGN KEY (`user_id`) REFERENCES `user_register` (`userid`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKryfgqky7mqodcmxno0lsgxst` FOREIGN KEY (`userid`) REFERENCES `user_register` (`userid`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FKh35b1ljeu4440iie9psw8a7yt` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKinivj2k1370kw224lavkm3rqm` FOREIGN KEY (`product_id`) REFERENCES `product` (`prodid`),
  ADD CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FKm06c9i95wxavx4oyvfksuweuy` FOREIGN KEY (`category_catid`) REFERENCES `category` (`catid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
