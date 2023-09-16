-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2023 at 05:18 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `care`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `app_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `availbility_id` int(11) NOT NULL,
  `appointment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`app_id`, `patient_id`, `availbility_id`, `appointment_date`) VALUES
(23, 24, 1, NULL),
(24, 24, 5, NULL),
(25, 24, 6, '2023-08-14'),
(26, 26, 6, '2023-08-21'),
(27, 26, 8, '2023-08-14');

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

CREATE TABLE `availability` (
  `avail_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `hosp_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `days` varchar(11) NOT NULL,
  `timings(from)` time NOT NULL,
  `timings(to)` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `availability`
--

INSERT INTO `availability` (`avail_id`, `doctor_id`, `hosp_id`, `city_id`, `days`, `timings(from)`, `timings(to)`) VALUES
(8, 2, 34, 7, 'Monday', '04:00:00', '12:00:00'),
(10, 2, 34, 7, 'Sunday', '09:00:00', '15:00:00'),
(6, 5, 34, 7, 'Monday', '11:00:00', '15:00:00'),
(1, 20, 1, 1, 'Monday', '16:00:00', '20:00:00'),
(2, 20, 1, 1, 'Tuesday', '16:00:00', '20:00:00'),
(4, 20, 1, 1, 'Wednesday', '16:00:00', '20:00:00'),
(5, 20, 5, 1, 'Thursday', '16:00:00', '20:00:00'),
(7, 20, 35, 7, 'Tuesday', '15:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `status`) VALUES
(1, 'Karachi', 1),
(2, 'Lahore', 1),
(3, 'Multan', 1),
(4, 'Peshawar', 1),
(7, 'Islamabad', 1),
(10, 'Gujranwala', 1);

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `day_id` int(11) NOT NULL,
  `day` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`day_id`, `day`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday'),
(6, 'Saturday'),
(7, 'Sunday');

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `citation` varchar(500) NOT NULL,
  `about` varchar(500) NOT NULL,
  `about_description` varchar(500) NOT NULL,
  `cause` varchar(500) NOT NULL,
  `cause_description` varchar(500) NOT NULL,
  `diagnoses` varchar(500) NOT NULL,
  `diagnoses_description` varchar(500) NOT NULL,
  `treatment` varchar(500) NOT NULL,
  `treatment_description` varchar(500) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `title`, `citation`, `about`, `about_description`, `cause`, `cause_description`, `diagnoses`, `diagnoses_description`, `treatment`, `treatment_description`, `image`) VALUES
(2, 'Acne', 'https://www.nhsinform.scot/illnesses-and-conditions/skin-hair-and-nails/acne/', 'About acne', 'Acne is a common skin condition that affects most people at some point. It causes spots oily skin and sometimes skin thats hot or painful to touch.', 'Causes of acne', 'Acne is caused when tiny holes in the skin known as hair follicles become blocked.  Sebaceous glands are tiny glands found near the surface of your skin. The glands are attached to hair follicles which are small holes in your skin that an individual hair grows out of.  Sebaceous glands lubricate the hair and the skin to stop it drying out. They do this by producing an oily substance called sebum.', ' acne', 'Your pharmacist can diagnose acne by looking at your skin', 'Treating acne', 'Treatment for acne depends on how severe it is. It can take several months of treatment before acne symptoms improve', 'acne-2.jpg'),
(4, 'Bone cancer', 'https://www.nhsinform.scot/illnesses-and-conditions/a-to-z', 'About bone cancer', 'Primary bone cancer is a rare type of cancer that begins in the bones. This is a separate condition from secondary bone cancer, which is cancer that spreads to the bones after developing in another part of the body.', 'Causes of bone cancer', 'Cancer occurs when the cells in a certain area of your body divide and multiply too rapidly. This produces a lump of tissue known as a tumour. The exact reason why this happens is often not known, but certain things can increase your chance of developing the condition, including: previous radiotherapy treatment other bone conditions, such as Pagets disease of the bone rare genetic conditions, such as Li-Fraumeni syndrome.', 'Diagnosing bone cancer', 'If youre experiencing bone pain, your GP will ask about your symptoms and examine the affected area, before deciding whether you need to have any further tests.  They will look for any swelling or lumps, and ask if you have problems moving the affected area. They may ask about the type of pain you experience – whether its constant or comes and goes, and whether anything makes it worse.  After being examined, you may be referred for an X-ray of the affected area to look for any problems in the bo', 'Treating bone cancer', 'Treatment for bone cancer depends on the type of bone cancer you have, how far it has spread and your general health. The main treatments are surgery, chemotherapy and radiotherapy.Your treatment should be managed by a specialist centre with experience in treating bone cancer, where youll be cared for by a team of different healthcare professionals known as a multi-disciplinary team (MDT).  Members of the MDT will include an orthopaedic surgeon (a surgeon who specialises in bone and joint surger', 'bone cancer.png'),
(5, 'Diabetes', 'https://www.nhsinform.scot/illnesses-and-conditions/a-to-z', 'About Diabetes', 'Diabetes is a lifelong condition that causes a persons blood glucose (sugar) level to become too high.  There are two main types of diabetes – type 1 diabetes and type 2 diabetes.  Type 2 diabetes is far more common than type 1. In the UK, around 90% of all adults with diabetes have type 2.  There are 4.7 million people living with diabetes in the UK. Thats more than one in 15 people in the UK who has diabetes (diagnosed or undiagnosed).  This figure has nearly trebled since 1996, when there wer', 'Symptoms of diabetes', 'The main symptoms of diabetes are:  feeling very thirsty urinating more frequently than usual, particularly at night feeling very tired weight loss and loss of muscle bulk itching around the penis or vagina, or frequent episodes of thrush cuts or wounds that heal slowly blurred vision Type 1 diabetes can develop quickly over a few hours or even days.  Many people have type 2 diabetes for years without realising because the early symptoms tend to be general.', 'What causes diabetes', 'The amount of glucose in the blood is controlled by a hormone called insulin, which is produced by the pancreas (a gland behind the stomach).  When food is digested and enters your bloodstream, insulin moves glucose out of the blood and into cells, where its broken down to produce energy.  However, if you have diabetes, your body is unable to break down glucose into energy. This is because theres either not enough insulin to move the glucose, or the insulin produced doesnt work properly.', 'Other types of diabetes', 'In addition to Type 1, Type 2 and gestational diabetes, there are a range of other types of diabetes.  These types of diabetes are much rarer, with about 2% of people having them. The rare types of diabetes include:  different types of monogenic diabetes cystic fibrosis-related diabetes diabetes caused by rare syndromes diabetes caused by certain medications such as steroids and antipsychotics diabetes caused by surgery or hormonal imbalances Unfortunately, many people with rarer types of diabet', 'diabates.png'),
(6, 'Lung cancer', 'https://www.nhsinform.scot/illnesses-and-conditions/a-to-z', 'About lung cancer', 'Lung cancer is one of the most common and serious types of cancer.   There are usually no signs or symptoms in the early stages of lung cancer, but many people with the condition eventually develop symptoms including:  a persistent cough coughing up blood persistent breathlessness unexplained tiredness and weight loss an ache or pain when breathing or coughing You should speak to your GP if you have these symptoms.', 'Causes of lung cancer', 'Smoking cigarettes is the single biggest risk factor for lung cancer. Its responsible for more than 85% of all cases.  Tobacco smoke contains more than 60 different toxic substances, which can lead to the development of cancer. These substances are known to be carcinogenic (cancer-producing).  If you smoke more than 25 cigarettes a day, you are 25 times more likely to get lung cancer than a non-smoker.  While smoking cigarettes is the biggest risk factor, using other types of tobacco products ca', 'Diagnosing lung cancer', 'Speak to your GP if you have symptoms of lung cancer, such as breathlessness or a persistent cough.  Your GP will ask about your general health and what symptoms youve been experiencing. They may examine you and ask you to breathe into a device called a spirometer, which measures how much air you breathe in and out.  You may be asked to have a blood test to rule out some of the possible causes of your symptoms, such as a chest infection.  In 2015, the National Institute for Health and Care Excel', ' Treating lung cancer', 'Treatment for lung cancer is carried out by a team of specialists who will work together to provide the best possible treatment.  This team contains all the specialists required to make a proper diagnosis, to stage your cancer and to plan the best treatment. If you want to know more, ask your specialist about this.  The type of treatment youll receive for lung cancer depends on several factors, including:  the type of lung cancer you have (non-small-cell or small-cell cancer) the size and positi', 'lung.png');

-- --------------------------------------------------------

--
-- Table structure for table `doctorsspecializations`
--

CREATE TABLE `doctorsspecializations` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `specialization_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctorsspecializations`
--

INSERT INTO `doctorsspecializations` (`ID`, `user_ID`, `specialization_ID`) VALUES
(2, 5, 8),
(3, 5, 1),
(4, 20, 4),
(5, 20, 1),
(6, 2, 2),
(7, 2, 3),
(8, 2, 4),
(9, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `hospital_id` int(11) NOT NULL,
  `City_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`hospital_id`, `City_ID`, `Name`, `Status`) VALUES
(1, 1, 'fatimiyah hospital', 1),
(2, 3, 'Al Khaliq Hospital', 1),
(5, 1, 'agha khan hospital', 1),
(34, 7, 'Islamabad Diagnostic Centre', 1),
(35, 7, 'Islamabad Medical Center', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Role_ID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `User_ID`, `Role_ID`, `Username`, `Password`) VALUES
(1, 1, 1, 'admin', 'admin@123'),
(2, 2, 2, 'Zehra', 'sabeen@42'),
(5, 5, 2, 'murtuzaali76', 'murtuza@43'),
(14, 20, 2, 'Haider', 'ali'),
(18, 24, 3, 'Zainab', 'Ali'),
(20, 26, 3, 'abihaZaidi', '$$Zaidi55');

-- --------------------------------------------------------

--
-- Table structure for table `medicalnews`
--

CREATE TABLE `medicalnews` (
  `id` int(11) NOT NULL,
  `Headline` varchar(200) NOT NULL,
  `NewsBody` text NOT NULL,
  `Author` varchar(100) NOT NULL,
  `PublicationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicalnews`
--

INSERT INTO `medicalnews` (`id`, `Headline`, `NewsBody`, `Author`, `PublicationDate`) VALUES
(1, 'In Conversation: Can biological race explain disparities in health? ', 'Have you ever been asked a seemingly innocuous question that later left you feeling uncomfortable? Perhaps it made you think, would any other person, especially someone of a different ethnic or racial background, be asked that same question?', 'Yasemin Nicola Sakay', '2023-07-31'),
(3, 'Ancient Brazilian skeleton discovered to be descendant of First Americans  Danielle Ellis', 'Based on the largest set of Brazilian archeological genomic data, cemeteries and territorial boundaries. Archeologists often refer to these monuments as shell mounds or kitchen middens.The first author of the article is Tiago Ferraz.The study was supported by FAPESP (projects 17/16451-2 and 20/06527-4) and conducted in partnership with researchers at the University of Tübingens Senckenberg Center for Human Evolution and Paleoenvironment (Germany).\n', ' Alexandre and Vau', '2023-08-24'),
(4, 'Aromas while sleeping boost cognitive capacity', 'People in the enriched group showed a 226% increase in cognitive performance compared to the control group, as measured by a word list test commonly used to evaluate memory. Imaging revealed better integrity in the brain pathway called the left uncinate fasciculus. This pathway, which connects the medial temporal lobe to the decision-making prefrontal cortex, becomes less robust with age. Participants also reported sleeping more soundly.', ' Megan Craig', '2023-08-01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Roles_ID` int(11) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Roles_ID`, `Role`, `Description`) VALUES
(1, 'Administrator', 'Web Administrator, Master Login.'),
(2, 'Doctor', 'Doctor of Medicine.'),
(3, 'Patient', 'A person in medical need.');

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `special_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specializations`
--

INSERT INTO `specializations` (`special_ID`, `Name`, `Description`) VALUES
(1, 'General Medicine', 'Specialization in General Medicine (more than covers the entire body excluding maxo-facial and eye)'),
(2, 'General Surgery', 'Specialization in General Surgery'),
(3, 'Otorhinolaryngology', 'Specialization  dealing  with  the  surgical  and  medical management of conditions of the head and neck.'),
(4, 'Internal Medicine', 'Similar to general medicine, with the difference that this only  caters  to  adult  patients  only.  Specialization  in prevention, diagnosis, and treatment of internal diseases'),
(5, 'Immunology', 'Specialization in immune systems in the body and antigen-antibody allergic reactions.'),
(7, 'Infectious Diseases', 'Specialization  in  diagnosis  and  treatment  of  complex infections.'),
(8, 'Cardiologists', 'They’re experts on the heart and blood vessels. You might see them for heart failure, a heart attack, high blood pressure, or an irregular heartbeat.');

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE `time` (
  `time_id` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`time_id`, `time`) VALUES
(1, '00:00:00'),
(2, '01:00:00'),
(3, '02:00:00'),
(4, '03:00:00'),
(5, '04:00:00'),
(6, '05:00:00'),
(7, '06:00:00'),
(8, '07:00:00'),
(9, '08:00:00'),
(10, '09:00:00'),
(11, '10:00:00'),
(12, '11:00:00'),
(13, '12:00:00'),
(14, '13:00:00'),
(15, '14:00:00'),
(16, '15:00:00'),
(17, '16:00:00'),
(18, '17:00:00'),
(19, '18:00:00'),
(20, '19:00:00'),
(21, '20:00:00'),
(22, '21:00:00'),
(23, '22:00:00'),
(24, '23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `MidName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Contact_Residence` varchar(50) NOT NULL,
  `Contact_Mobile` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` text NOT NULL,
  `image_name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `FirstName`, `MidName`, `LastName`, `Contact_Residence`, `Contact_Mobile`, `Email`, `Address`, `image_name`) VALUES
(1, 'Admin', 'of', 'Web', '0307-2526307', '0314-2308332', 'sirmurtazaaptechtr@outlook.com', 'Karachi, Pakistan.', 'smartboy.png'),
(2, 'Zehra', 'haider', 'sarwar', '032587412589', '03254789654', 'sabeen@55', 'karachi Pakistan', 'WhatsApp Image 2023-08-04 at 4.39.29 AM (2).jpeg'),
(5, 'Murtuza', 'Ali ', 'Gowa', '0311 2196252', '0311 2196252', 'murtuzaali54@gmail.com', 'X3MX+XXC, Sector 11 A Gulzar E Hijri Scheme 33, Karachi, Karachi City, Sindh', 'WhatsApp Image 2023-08-04 at 4.39.29 AM (1).jpeg'),
(20, 'Haider', 'Ali', 'Shuja', '02587412589', '03214569874', 'haiderali@gmail.com', 'karachi Pakistan', 'WhatsApp Image 2023-08-04 at 4.39.29 AM (5).jpeg'),
(24, 'Zainab', 'Hussain', 'Zainulabideen', '0321456985', '032145698547', 'zainabhussain@gmail.com', 'karachi Pakistan', 'default.jpg'),
(26, 'Umm e', ' Abiha', 'Zaidi', '02587412589', '03303054987', 'ummeabiha55@gmail.com', 'Islamabad, Pakistan', 'arabian-woman-hijab-ouside-street-drinking-coffee.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`app_id`),
  ADD UNIQUE KEY `patient_id` (`patient_id`,`availbility_id`),
  ADD KEY `avail_id` (`availbility_id`);

--
-- Indexes for table `availability`
--
ALTER TABLE `availability`
  ADD PRIMARY KEY (`avail_id`),
  ADD UNIQUE KEY `doctor_id` (`doctor_id`,`hosp_id`,`city_id`,`timings(from)`,`timings(to)`,`days`),
  ADD KEY `hosp_id` (`hosp_id`),
  ADD KEY `city_Id` (`city_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`day_id`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorsspecializations`
--
ALTER TABLE `doctorsspecializations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `specialization_ID` (`specialization_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`hospital_id`),
  ADD KEY `City_ID` (`City_ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `Role_ID` (`Role_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `medicalnews`
--
ALTER TABLE `medicalnews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Roles_ID`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`special_ID`);

--
-- Indexes for table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`time_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `availability`
--
ALTER TABLE `availability`
  MODIFY `avail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `day_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doctorsspecializations`
--
ALTER TABLE `doctorsspecializations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `medicalnews`
--
ALTER TABLE `medicalnews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `Roles_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specializations`
--
ALTER TABLE `specializations`
  MODIFY `special_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `time`
--
ALTER TABLE `time`
  MODIFY `time_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `avail_id` FOREIGN KEY (`availbility_id`) REFERENCES `availability` (`avail_id`),
  ADD CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `users` (`ID`);

--
-- Constraints for table `availability`
--
ALTER TABLE `availability`
  ADD CONSTRAINT `city_Id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `hosp_id` FOREIGN KEY (`hosp_id`) REFERENCES `hospitals` (`hospital_id`);

--
-- Constraints for table `doctorsspecializations`
--
ALTER TABLE `doctorsspecializations`
  ADD CONSTRAINT `doctorsspecializations_ibfk_1` FOREIGN KEY (`specialization_ID`) REFERENCES `specializations` (`special_ID`),
  ADD CONSTRAINT `doctorsspecializations_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD CONSTRAINT `hospitals_ibfk_1` FOREIGN KEY (`City_ID`) REFERENCES `cities` (`id`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `roles` (`Roles_ID`),
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
