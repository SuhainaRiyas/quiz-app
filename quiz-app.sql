-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2023 at 02:44 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `correct_ans` text NOT NULL,
  `level` enum('beginner','intermediate','professional') NOT NULL DEFAULT 'beginner',
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `topic_id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_ans`, `level`, `status`, `created_at`) VALUES
(1, 1, 'When was the first Common Wealth Games held?', '1930', '1934', '1938', '1948', '1934', 'professional', '1', '2023-06-06 11:20:24'),
(2, 1, 'In which sports is the participant called pugilist?', 'Sprinter', 'Boxing', 'Wrestling', 'Javelin throw', 'Boxing', 'intermediate', '1', '2023-06-06 11:20:24'),
(3, 1, 'The term \"Butterfly Stroke\" is referred to in which sport?', 'Wrestling', 'Volleyball', 'Tennis', 'Swimming', 'Swimming', 'beginner', '1', '2023-06-06 11:20:24'),
(4, 1, 'Who was the first Test Centurion in India Cricket?', 'C.K. Naidu', 'Lala Amarnath', 'Vinu Mankad', 'Mansur Ali Pataudi', 'Lala Amarnath', 'professional', '1', '2023-06-06 11:20:24'),
(5, 1, 'The term \"Beamer\" is associated with', 'Cricket', 'Hockey', 'Chess', 'Football', 'Cricket', 'intermediate', '1', '2023-06-06 11:20:24'),
(6, 1, 'Thomas Cup is related to', 'Tennis', 'Cricket', 'Basketball', 'Badminton', 'Badminton', 'beginner', '1', '2023-06-06 11:20:24'),
(7, 1, 'Ryder Cup is related with which sports?', 'Cricket', 'Badminton', 'Golf', 'Football', 'Golf', 'beginner', '1', '2023-06-06 11:20:24'),
(8, 1, 'Which was the first country to host the Asian Games?', 'China', 'Japan', 'India', 'Korea', 'India', 'professional', '1', '2023-06-06 11:20:24'),
(9, 1, 'Where is the headquarters of the International Olympic Committee located?', 'Italy', 'France', 'Belgium', 'Switzerland', 'Switzerland', 'beginner', '1', '2023-06-06 11:20:24'),
(10, 1, '\"Free throw\" is associated with:', 'Basketball', 'Hockey', 'Volleyball', 'Football', 'Basketball', 'professional', '1', '2023-06-06 11:20:24'),
(11, 1, 'Hopman Cup is related with which sports?', 'Tennis', 'Football', 'Badminton', 'Hockey', 'Tennis', 'intermediate', '1', '2023-06-06 11:20:24'),
(12, 1, 'The first World Cup in cricket was held in', '1971', '1973', '1975', '1977', '1975', 'intermediate', '1', '2023-06-06 11:20:24'),
(13, 1, 'Where did the game of Chess originate?', 'India', 'Persia', 'Arabia', 'Europe', 'India', 'beginner', '1', '2023-06-06 11:20:24'),
(14, 2, 'Which one of the following is an \"Air-to-Air\" missile?', 'Astra', 'Akash', 'Becquerel', 'Prithivi', 'Astra', 'professional', '1', '2023-06-06 11:50:29'),
(15, 2, 'Who is popularly known as \"Missile Man of India\"?', 'Dr. C. V. Raman', 'Dr. S. Chandrasekhar', 'Dr. Hargobind Khurana', 'Dr. A. P. J. Abdul Kalam', 'Dr. A. P. J. Abdul Kalam', 'beginner', '1', '2023-06-06 11:50:29'),
(16, 2, 'What was the name of the space shuttle that landed man on the moon?', 'Apollo', 'Challenger', 'Columbia', 'Eagle', 'Apollo', 'intermediate', '1', '2023-06-06 11:50:29'),
(17, 2, 'Nuclear explosive devices were tested in India at', 'Bangalore', 'Sriharikota', 'Kanchipuram', 'Pokharan', 'Pokharan', 'professional', '1', '2023-06-06 11:50:29'),
(18, 2, 'The first ever robot spacecraft to probe planet Venus was named', 'Challenger', 'Newton', 'Magellan', 'Galileo', 'Magellan', 'intermediate', '1', '2023-06-06 11:50:29'),
(19, 2, 'The Messenger Satellite launched by NASA is to study', 'Jupiter', 'Saturn', 'Venus', 'Mercury', 'Mercury', 'beginner', '1', '2023-06-06 11:50:29'),
(20, 2, 'Which country assisted India to establish the Koodan-kulam Nuclear Power Station in Tamil Nadu?', 'Russia', 'France', 'Germany', 'Canada', 'Russia', 'beginner', '1', '2023-06-06 11:50:29'),
(21, 2, 'Where is the world\'s first Integrated Solar Combined Cycle Power Project proposed to be set up?', 'Patna', 'Jaipur', 'Cuttack', 'Jodhpur', 'Jodhpur', 'professional', '1', '2023-06-06 11:50:29'),
(22, 2, 'ISRO is the abbreviation for', 'Indian Scientific Research Organisation', 'Indian Space Research Organisation', 'International Scientific Research Organisation', 'International Space Research Organisation', 'Indian Space Research Organisation', 'beginner', '1', '2023-06-06 11:50:29'),
(23, 2, 'What is supernova?', 'A comet', 'An asteroid', 'A dying star', 'A black hole', 'A dying star', 'professional', '1', '2023-06-06 11:50:29'),
(24, 2, 'An astronaut in outer space will observe sky as', 'Black', 'White', 'Rich blue', 'Light blue', 'Black', 'intermediate', '1', '2023-06-06 11:50:29'),
(25, 2, 'Indira Gandhi Centre for Atomic Research is situated in', 'Mumbai', 'Sriharikota', 'Kalpakkam', 'Thiruvananthapuram', 'Kalpakkam', 'intermediate', '1', '2023-06-06 11:50:29'),
(26, 2, 'Which one of the following is considered as nature\'s radar?', 'Pigeon', 'Vulture', 'Owl', 'Hippopotamus', 'Pigeon', 'beginner', '1', '2023-06-06 11:50:29'),
(27, 3, 'Which city is the host of \"All-India Official Language Conference\" held in 2022?', 'Surat', 'Ahmedabad', 'Bengaluru', 'Pune', 'Surat', 'professional', '1', '2023-06-06 16:28:39'),
(28, 3, 'Tamasha is the famous folk form of musical theatre in', 'Punjab', 'Bihar', 'Uttar Pradesh', 'Maharashtra', 'Maharashtra', 'intermediate', '1', '2023-06-06 16:28:39'),
(29, 3, 'Kathakali dance style belongs to', 'Tamil Nadu', 'Kerala', 'Andhra Pradesh', 'Karnataka', 'Kerala', 'beginner', '1', '2023-06-06 16:28:39'),
(30, 3, 'Which city is the host of the \"UNESCO-MONDIACULT 2022 World Conference\"?', 'Cairo', 'India', 'Mexico', 'Dhaka', 'Mexico', 'professional', '1', '2023-06-06 16:28:39'),
(31, 3, '\"Mehrauli Archaeological Park\" is a heritage area located in which state?', 'Uttar Pradesh', 'New Delhi', 'Kolkata', 'Punjab', 'New Delhi', 'intermediate', '1', '2023-06-06 16:28:39'),
(32, 3, 'Which one of the following is the most ancient musical instrument?', 'Veena', 'Tabla', 'Sitar', 'Sarod', 'Veena', 'beginner', '1', '2023-06-06 16:28:39'),
(33, 3, 'Which of the following is a dance drama?', 'Odissi', 'Kathakali', 'Manipuri', 'Kathak', 'Kathakali', 'beginner', '1', '2023-06-06 16:28:39'),
(34, 3, '\"Madhubani\" painting is related to which state?', 'Bihar', 'Tamil Nadu', 'Uttar Pradesh', 'Kerala', 'Bihar', 'professional', '1', '2023-06-06 16:28:39'),
(35, 3, 'Which state organised an International Book Fair recently?', 'Kerala', 'Tamil Nadu', 'Karnataka', 'New Delhi', 'Tamil Nadu', 'beginner', '1', '2023-06-06 16:28:39'),
(36, 3, 'Where is the Tagore Centre for the Study of Culture and Civilization?', 'Chennai', 'Kolkata', 'Dehradun', 'Shimla', 'Shimla', 'professional', '1', '2023-06-06 16:28:39'),
(37, 3, 'Who painted the famous \"Mona Lisa\"?', 'Jashua Reynolds', 'Leonardo Da Vinci', 'Michel Angelo', 'Rambrandt', 'Leonardo Da Vinci', 'beginner', '1', '2023-06-06 16:28:39'),
(38, 3, 'The chenchus tribes found in the state', 'Uttar Pradesh', 'Andhra Pradesh', 'Karnataka', 'Jharkhand', 'Andhra Pradesh', 'intermediate', '1', '2023-06-06 16:28:39'),
(39, 3, 'Which of the dance forms enlisted in UNESCO?', 'Maach', 'Bidesia', 'Yakshagan', 'Mudiyeltu', 'Mudiyeltu', 'intermediate', '1', '2023-06-06 16:28:39'),
(40, 4, 'The constituent Assembly was set up in :', '1945', '1946', '1947', '1949', '1946', 'professional', '1', '2023-06-06 16:29:04'),
(41, 4, 'Who proposed the Preamble before the Drafting Committee of the Constitution ?', 'Jawaharlal Nehru', 'B.R. Ambedkar', 'B.N Rao', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'beginner', '1', '2023-06-06 16:29:04'),
(42, 4, 'How many schedules does the Constitution of India contain ?', '9', '10', '11', '12', '12', 'intermediate', '1', '2023-06-06 16:29:04'),
(43, 4, '\"Consent of the people\" means consent of', 'All people', 'A few people', 'Majority of the people', 'Leader of the people', 'Majority of the people', 'professional', '1', '2023-06-06 16:29:04'),
(44, 4, 'The term \"Greater India\" denotes', 'Political unity', 'Cultural unity', 'Religious unity', 'Social unity', 'Cultural unity', 'intermediate', '1', '2023-06-06 16:29:04'),
(45, 4, 'The number of subjects in the Union List of the Indian Constitution is', '47', '66', '97', '100', '97', 'beginner', '1', '2023-06-06 16:29:04'),
(46, 4, 'The method of Impeachment of the President of India is adopted from', 'U.S.A.', 'U.K.', 'U.S.S.R.', 'France', 'U.S.A.', 'beginner', '1', '2023-06-06 16:29:04'),
(47, 4, 'The final authority to interpret our Constitution is the', 'President', 'Parliament', 'Prime Minister', 'Supreme Court', 'Supreme Court', 'professional', '1', '2023-06-06 16:29:04'),
(48, 4, 'What is the colour of the \"Dharma Chakra\" in the middle of our national flag ?', 'Black', 'Green', 'Navy blue', 'Sea blue', 'Navy blue', 'beginner', '1', '2023-06-06 16:29:04'),
(49, 4, 'The term \"Fourth Estate\" is used for', 'Parliament', 'Judiciary', 'The Executive', 'The press and newspaper', 'The press and newspaper', 'professional', '1', '2023-06-06 16:29:04'),
(50, 4, 'Which State enjoys the distinction of being the first linguistic state of India ?', 'Kerala', 'Tamil Nadu', 'West Bengal', 'Andhra Pradesh', 'Andhra Pradesh', 'intermediate', '1', '2023-06-06 16:29:04'),
(51, 4, 'Plural theory of sovereignty emphasizes of', 'State', 'Religion', 'Individuals', 'Association', 'Association', 'intermediate', '1', '2023-06-06 16:29:04'),
(52, 4, 'What is the playing time of the full version of the Indian National Anthem ?', '52 seconds', '50 seconds', '47 seconds', '40 seconds', '52 seconds', 'beginner', '1', '2023-06-06 16:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `title`, `status`, `created_at`) VALUES
(1, 'Sports', '1', '2023-06-03 15:04:41'),
(2, 'Science & Technology', '1', '2023-06-03 15:04:41'),
(3, 'Arts', '1', '2023-06-03 15:04:41'),
(4, 'Politics', '1', '2023-06-03 15:04:41');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL,
  `topic_id` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `qn_id` varchar(255) NOT NULL,
  `user_answer` text NOT NULL,
  `correct_ans` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_scores`
--

CREATE TABLE `user_scores` (
  `id` int(11) NOT NULL,
  `topic_id` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `score` bigint(20) NOT NULL,
  `prev_score` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_scores`
--
ALTER TABLE `user_scores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_scores`
--
ALTER TABLE `user_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
