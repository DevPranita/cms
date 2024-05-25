-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2024 at 04:08 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barti`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive, 1 - active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `username`, `email`, `first_name`, `last_name`, `image`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'encureit@admin.com', 'encureit@admin.com', 'EncureIt', 'Admin', NULL, '$2y$10$GmpCu.PeDocMg.lHY5Kph.sVVSuFnNil0PUrx9ZAinMzH0355Fqne', 1, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(2, 2, 'admin@admin.com', 'admin@admin.com', 'Admin', 'test', NULL, '$2y$10$7PD5oeVWdHLwn9G1qUTXKuiL8StFoOk38hdbPWcGY4xbHn/4NMtOK', 1, '2024-04-19 09:15:27', '2024-04-23 09:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `alink`
--

CREATE TABLE `alink` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alink`
--

INSERT INTO `alink` (`id`, `language_id`, `name`, `url`) VALUES
(1, 169, 'History', 'http://localhost:8001/history'),
(2, 169, 'Budget Reports', 'http://localhost:8001/budget/report'),
(3, 169, 'Leadership', 'http://localhost:8001/'),
(4, 170, 'इतिहास', 'http://localhost:8001/history'),
(5, 170, 'बजेट अहवाल', 'http://localhost:8001/budget/report'),
(6, 170, 'नेतृत्व', 'http://localhost:8001/');

-- --------------------------------------------------------

--
-- Table structure for table `archives`
--

CREATE TABLE `archives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `article_category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` blob NOT NULL,
  `serial_number` int(11) NOT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_categories`
--

CREATE TABLE `article_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `auditable_type` varchar(255) NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text DEFAULT NULL,
  `new_values` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(1023) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic_settings`
--

CREATE TABLE `basic_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `favicon` varchar(50) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `website_heading` text DEFAULT NULL,
  `header_logo` varchar(50) DEFAULT NULL,
  `website_title` varchar(255) DEFAULT NULL,
  `base_color` varchar(30) DEFAULT NULL,
  `secondary_base_color` varchar(20) DEFAULT NULL,
  `support_email` varchar(100) DEFAULT NULL,
  `support_phone` varchar(30) DEFAULT NULL,
  `breadcrumb` varchar(50) DEFAULT NULL,
  `footer_logo` varchar(50) DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `newsletter_text` varchar(255) DEFAULT NULL,
  `copyright_text` blob DEFAULT NULL,
  `hero_bg` varchar(50) DEFAULT NULL,
  `hero_section_title` varchar(255) DEFAULT NULL,
  `hero_section_bold_text` varchar(255) DEFAULT NULL,
  `hero_section_text` varchar(255) DEFAULT NULL,
  `hero_section_button_text` varchar(255) DEFAULT NULL,
  `hero_section_button_url` varchar(255) DEFAULT NULL,
  `hero_section_video_link` varchar(255) DEFAULT NULL,
  `intro_bg` varchar(50) DEFAULT NULL,
  `intro_section_title` varchar(50) DEFAULT NULL,
  `intro_section_subtitle` varchar(255) DEFAULT NULL,
  `intro_section_text` text DEFAULT NULL,
  `intro_section_button_text` varchar(255) DEFAULT NULL,
  `intro_section_button_url` varchar(255) DEFAULT NULL,
  `intro_section_video_link` text DEFAULT NULL,
  `service_section_title` varchar(255) DEFAULT NULL,
  `our_services_desc` text DEFAULT NULL,
  `service_section_subtitle` varchar(255) DEFAULT NULL,
  `approach_title` varchar(255) DEFAULT NULL,
  `approach_subtitle` varchar(255) DEFAULT NULL,
  `approach_button_text` varchar(255) DEFAULT NULL,
  `approach_button_url` varchar(255) DEFAULT NULL,
  `cta_bg` varchar(50) DEFAULT NULL,
  `cta_section_text` varchar(255) DEFAULT NULL,
  `cta_section_button_text` varchar(255) DEFAULT NULL,
  `cta_section_button_url` varchar(255) DEFAULT NULL,
  `portfolio_section_title` varchar(255) DEFAULT NULL,
  `portfolio_section_text` varchar(255) DEFAULT NULL,
  `team_bg` varchar(50) DEFAULT NULL,
  `team_section_title` varchar(255) DEFAULT NULL,
  `team_section_subtitle` varchar(255) DEFAULT NULL,
  `contact_form_title` varchar(255) DEFAULT NULL,
  `contact_form_subtitle` varchar(255) DEFAULT NULL,
  `quote_title` varchar(255) DEFAULT NULL,
  `quote_subtitle` varchar(255) DEFAULT NULL,
  `tawk_to_script` text DEFAULT NULL,
  `google_analytics_script` text DEFAULT NULL,
  `is_recaptcha` tinyint(4) NOT NULL DEFAULT 0,
  `google_recaptcha_site_key` varchar(255) DEFAULT NULL,
  `google_recaptcha_secret_key` varchar(255) DEFAULT NULL,
  `is_tawkto` tinyint(4) NOT NULL DEFAULT 1,
  `is_disqus` tinyint(4) NOT NULL DEFAULT 1,
  `disqus_script` text DEFAULT NULL,
  `is_analytics` tinyint(4) NOT NULL DEFAULT 1,
  `maintainance_mode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - active, 0 - deactive',
  `maintainance_text` text DEFAULT NULL,
  `secret_path` varchar(255) DEFAULT NULL,
  `is_appzi` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - deactive, 1 - active',
  `appzi_script` text DEFAULT NULL,
  `is_addthis` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - deactive, 1 - active',
  `addthis_script` text DEFAULT NULL,
  `service_title` varchar(30) DEFAULT NULL,
  `service_subtitle` varchar(255) DEFAULT NULL,
  `portfolio_title` varchar(30) DEFAULT NULL,
  `portfolio_subtitle` varchar(255) DEFAULT NULL,
  `testimonial_title` varchar(255) DEFAULT NULL,
  `testimonial_subtitle` varchar(255) DEFAULT NULL,
  `blog_section_title` varchar(255) DEFAULT NULL,
  `blog_section_subtitle` varchar(255) DEFAULT NULL,
  `faq_title` varchar(255) DEFAULT NULL,
  `faq_subtitle` varchar(255) DEFAULT NULL,
  `blog_title` varchar(255) DEFAULT NULL,
  `blog_subtitle` varchar(255) DEFAULT NULL,
  `service_details_title` varchar(255) DEFAULT NULL,
  `portfolio_details_title` varchar(255) DEFAULT NULL,
  `blog_details_title` varchar(255) DEFAULT NULL,
  `gallery_title` varchar(255) DEFAULT NULL,
  `gallery_subtitle` varchar(255) DEFAULT NULL,
  `team_title` varchar(255) DEFAULT NULL,
  `team_subtitle` varchar(255) DEFAULT NULL,
  `contact_title` varchar(255) DEFAULT NULL,
  `contact_subtitle` varchar(255) DEFAULT NULL,
  `error_title` varchar(255) DEFAULT NULL,
  `error_subtitle` varchar(255) DEFAULT NULL,
  `is_quote` tinyint(4) NOT NULL DEFAULT 1,
  `home_version` varchar(100) DEFAULT NULL,
  `event_title` text DEFAULT NULL,
  `event_subtitle` text DEFAULT NULL,
  `event_details_title` text DEFAULT NULL,
  `cause_title` text DEFAULT NULL,
  `cause_subtitle` text DEFAULT NULL,
  `cause_details_title` text DEFAULT NULL,
  `feature_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `intro_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `service_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `approach_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `statistics_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `portfolio_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `testimonial_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `team_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `news_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `call_to_action_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `partner_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `top_footer_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `copyright_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `newsletter_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_settings`
--

INSERT INTO `basic_settings` (`id`, `language_id`, `favicon`, `logo`, `website_heading`, `header_logo`, `website_title`, `base_color`, `secondary_base_color`, `support_email`, `support_phone`, `breadcrumb`, `footer_logo`, `footer_text`, `newsletter_text`, `copyright_text`, `hero_bg`, `hero_section_title`, `hero_section_bold_text`, `hero_section_text`, `hero_section_button_text`, `hero_section_button_url`, `hero_section_video_link`, `intro_bg`, `intro_section_title`, `intro_section_subtitle`, `intro_section_text`, `intro_section_button_text`, `intro_section_button_url`, `intro_section_video_link`, `service_section_title`, `our_services_desc`, `service_section_subtitle`, `approach_title`, `approach_subtitle`, `approach_button_text`, `approach_button_url`, `cta_bg`, `cta_section_text`, `cta_section_button_text`, `cta_section_button_url`, `portfolio_section_title`, `portfolio_section_text`, `team_bg`, `team_section_title`, `team_section_subtitle`, `contact_form_title`, `contact_form_subtitle`, `quote_title`, `quote_subtitle`, `tawk_to_script`, `google_analytics_script`, `is_recaptcha`, `google_recaptcha_site_key`, `google_recaptcha_secret_key`, `is_tawkto`, `is_disqus`, `disqus_script`, `is_analytics`, `maintainance_mode`, `maintainance_text`, `secret_path`, `is_appzi`, `appzi_script`, `is_addthis`, `addthis_script`, `service_title`, `service_subtitle`, `portfolio_title`, `portfolio_subtitle`, `testimonial_title`, `testimonial_subtitle`, `blog_section_title`, `blog_section_subtitle`, `faq_title`, `faq_subtitle`, `blog_title`, `blog_subtitle`, `service_details_title`, `portfolio_details_title`, `blog_details_title`, `gallery_title`, `gallery_subtitle`, `team_title`, `team_subtitle`, `contact_title`, `contact_subtitle`, `error_title`, `error_subtitle`, `is_quote`, `home_version`, `event_title`, `event_subtitle`, `event_details_title`, `cause_title`, `cause_subtitle`, `cause_details_title`, `feature_section`, `intro_section`, `service_section`, `approach_section`, `statistics_section`, `portfolio_section`, `testimonial_section`, `team_section`, `news_section`, `call_to_action_section`, `partner_section`, `top_footer_section`, `copyright_section`, `newsletter_section`) VALUES
(142, 169, '66419f794d65c.png', '66419f78dcded.png', 'Stem Water Distribution And Infrastructure Company Private Limited स्टेम वॉटर डिस्ट्रिब्युशन अँड इन्फ्रास्ट्रक्चर कंपनी प्रायव्हेट लिमिटेड', '66419f7945bae.png', 'STEM WATER DISTRIBUTION AND INFRA CO.PVT.LTD', '17305E', '303743', 'info@geotechit.com', '+44 078 9101 1714', '66419f795c8c2.png', '6641b3029329b.png', 'We are a awward winning multinaitonal Company. We Believe quality and standard worlwidex Consider.We are a awward winning multinaitonal Company. We Believe quality and standard worlwidex Consider.  We Believe quality and standard worlwidex Consider.', 'Subscribe to get Latest News, Offer and connect With Us.', 0x3c703e436f7079726967687420c2a920323032342e20416c6c20726967687473207265736572766564206279266e6273703b20656e6375726569743c62723e3c2f703e, '618d038bbd7f9.jpg', 'Financial Planning For Life', 'Quality Service Happy customers', 'Trusted to help guide entrepreneurs make better financial decisions.', 'Learn More', 'https://megasoft.biz/plusagency/about-us/22/page', 'https://www.youtube.com/watch?v=BAVfUvByStY', '6641a059e0f9d.png', 'STEM having capacity of treating 316 million+', 'liters per day of high quality potable water per day', 'Our mission is to provide reliable, sustainable, and accessible water services to communities, ensuring their well-being and prosperity. We are committed to innovation, responsible resource management, and delivering exceptional customer service.', 'KNOW MORE ABOUT STEM', 'https://stemwater.org/', 'https://www.youtube.com/watch?v=S7wCAquf9Us', 'Our Services', 'At STEM, our primary objective is to provide high-quality water supply services to Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and rural areas. We strive for excellence in managing, maintaining, and administering the water infrastructure assets entrusted to us.', 'We work with you to achieve your goals', 'How we do', 'A fresh approach to financial services for entrepreneurs', 'Our Approach', 'https://megasoft.biz/plusagency/about-us/22/page', '618d0785966f1.jpg', 'Contact us for help with your finances.', 'Contact Us', 'http://localhost/plusagency/plusagency_2.5/contact', 'Our latest projects', 'A fresh approach to financial services for entrepreneurs', '618d08247ce11.jpg', 'Expert Team', 'Meet our expert finlance executive team', 'Have Any Questions?', 'Distinctively exploit revolutionary catalysts for chang the Seamlessly optimal rather than just in web & apps development optimal alignments for intuitive.', 'Request A Quote', 'Have a project ? Send us a quote', '<!--Start of Tawk.to Script-->\r\n<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/5e7477c08d24fc226588d638/default\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>\r\n<!--End of Tawk.to Script-->', '<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-137437974-2\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'UA-137437974-2\');\r\n</script>', 0, '6Lf9jOQUAAAAABJKj_nQBNvji7wh4DdOZIPAdRKk', '6Lf9jOQUAAAAALO4C5pC7O_HHw0Z1BuYCU_FA606', 1, 1, '<script>\r\n\r\n/**\r\n*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.\r\n*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/\r\n/*\r\nvar disqus_config = function () {\r\nthis.page.url = PAGE_URL;  // Replace PAGE_URL with your page\'s canonical URL variable\r\nthis.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page\'s unique identifier variable\r\n};\r\n*/\r\n(function() { // DON\'T EDIT BELOW THIS LINE\r\nvar d = document, s = d.createElement(\'script\');\r\ns.src = \'https://plusagency.disqus.com/embed.js\';\r\ns.setAttribute(\'data-timestamp\', +new Date());\r\n(d.head || d.body).appendChild(s);\r\n})();\r\n</script>', 1, 0, 'We are upgrading our site. We will come back soon. \r\nPlease stay with us.\r\nThank you.', NULL, 0, '<!-- Appzi: Capture Insightful Feedback -->\r\n<script async src=\"https://w.appzi.io/bootstrap/bundle.js?token=LyCxj\"></script>\r\n<!-- End Appzi -->', 0, '<!-- Go to www.addthis.com/dashboard to customize your tools -->\r\n<script type=\"text/javascript\" src=\"//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5db876f049b4480b\"></script>', 'Services We Provide', 'We work with you to achieve your goals.', 'Portfolios', 'Have a look at our all projects', 'Testimonial', 'What people say about finlance planning', 'Latest news', 'Have a look at the finlance latest News', 'F.A.Q', 'Frequestly Asked Questions', 'Latest Blog', 'From the latest news and blog', 'Service Details', 'Portfolio Details', 'Blog Details', 'Our Gallery', 'Take a look at our captured moments', 'Team Members', 'Meet our team members', 'Contact Us', 'Need information? contact us', '404 Not Found', 'Oops! Looks like you\'re lost', 1, 'static', 'Events', 'Join Our Events & Conferences', 'Event Details', 'Causes', 'Donate Us to Grow Together', 'Cause Details', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(156, 170, '66419f794d65c.png', '66419f78dcded.png', 'Stem Water Distribution And Infrastructure Company Private Limited स्टेम वॉटर डिस्ट्रिब्युशन अँड इन्फ्रास्ट्रक्चर कंपनी प्रायव्हेट लिमिटेड', '66419f7945bae.png', 'STEM WATER DISTRIBUTION AND INFRA CO.PVT.LTD', '17305E', '303743', 'info@geotechit.com', '+44 078 9101 1714', '66419f795c8c2.png', '663a2431e1c14.png', 'We are a awward winning multinaitonal Company. We Believe quality and standard worlwidex Consider.We are a awward winning multinaitonal Company. We Believe quality and standard worlwidex Consider.  We Believe quality and standard worlwidex Consider.', 'Subscribe to get Latest News, Offer and connect With Us.', 0xe0a495e0a589e0a4aae0a580e0a4b0e0a4bee0a487e0a49f20c2a920323032342e20e0a4b8e0a4b0e0a58de0a4b520e0a4b9e0a495e0a58de0a49520656e63757265697420e0a4a6e0a58de0a4b5e0a4bee0a4b0e0a58720e0a4b0e0a4bee0a496e0a580e0a4b520e0a486e0a4b9e0a587e0a4a4, '618d038bbd7f9.jpg', 'Financial Planning For Life', 'Quality Service Happy customers', 'Trusted to help guide entrepreneurs make better financial decisions.', 'Learn More', 'https://megasoft.biz/plusagency/about-us/22/page', 'https://www.youtube.com/watch?v=BAVfUvByStY', '6641a72e9abda.png', 'STEM ची उपचार क्षमता 316 दशलक्ष आहे', 'लिटर प्रतिदिन उच्च दर्जाचे पिण्यायोग्य पाणी...', 'आमचे ध्येय समुदायांना विश्वासार्ह, शाश्वत आणि प्रवेशयोग्य पाणी सेवा प्रदान करणे, त्यांचे कल्याण आणि समृद्धी सुनिश्चित करणे हे आहे. आम्ही नावीन्य, जबाबदार संसाधन व्यवस्थापन आणि अपवादात्मक ग्राहक सेवा देण्यासाठी वचनबद्ध आहोत.', 'STEM बद्दल अधिक जाणून घ्या', 'https://stemwater.org/', 'https://www.youtube.com/watch?v=S7wCAquf9Us', 'आमच्या सेवा', 'STEM मध्ये, आमचे प्राथमिक उद्दिष्ट ठाणे महानगरपालिका, भिवंडी निजामपूर महानगरपालिका, मीरा भाईंदर महानगरपालिका आणि ग्रामीण भागात उच्च दर्जाची पाणीपुरवठा सेवा प्रदान करणे आहे. आमच्याकडे सोपवलेल्या पाण्याच्या पायाभूत सुविधांच्या मालमत्तेचे व्यवस्थापन, देखरेख आणि प्रशासन करण्यासाठी आम्ही उत्कृष्टतेसाठी प्रयत्न करतो.', 'We work with you to achieve your goals', 'How we do', 'A fresh approach to financial services for entrepreneurs', 'Our Approach', 'https://megasoft.biz/plusagency/about-us/22/page', '618d0785966f1.jpg', 'Contact us for help with your finances.', 'Contact Us', 'http://localhost/plusagency/plusagency_2.5/contact', 'Our latest projects', 'A fresh approach to financial services for entrepreneurs', '618d08247ce11.jpg', 'Expert Team', 'Meet our expert finlance executive team', 'काही प्रश्न आहेत का?', 'केवळ वेब आणि ॲप्स डेव्हलपमेंटमध्ये अंतर्ज्ञानी इष्टतम संरेखन करण्याऐवजी अखंडपणे इष्टतम बदलण्यासाठी क्रांतिकारक उत्प्रेरकांचे विशिष्टपणे शोषण करा.', 'Request A Quote', 'Have a project ? Send us a quote', '<!--Start of Tawk.to Script-->\r\n<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/5e7477c08d24fc226588d638/default\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>\r\n<!--End of Tawk.to Script-->', '<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-137437974-2\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'UA-137437974-2\');\r\n</script>', 0, '6Lf9jOQUAAAAABJKj_nQBNvji7wh4DdOZIPAdRKk', '6Lf9jOQUAAAAALO4C5pC7O_HHw0Z1BuYCU_FA606', 1, 1, '<script>\r\n\r\n/**\r\n*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.\r\n*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/\r\n/*\r\nvar disqus_config = function () {\r\nthis.page.url = PAGE_URL;  // Replace PAGE_URL with your page\'s canonical URL variable\r\nthis.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page\'s unique identifier variable\r\n};\r\n*/\r\n(function() { // DON\'T EDIT BELOW THIS LINE\r\nvar d = document, s = d.createElement(\'script\');\r\ns.src = \'https://plusagency.disqus.com/embed.js\';\r\ns.setAttribute(\'data-timestamp\', +new Date());\r\n(d.head || d.body).appendChild(s);\r\n})();\r\n</script>', 1, 0, 'We are upgrading our site. We will come back soon. \r\nPlease stay with us.\r\nThank you.', NULL, 0, '<!-- Appzi: Capture Insightful Feedback -->\r\n<script async src=\"https://w.appzi.io/bootstrap/bundle.js?token=LyCxj\"></script>\r\n<!-- End Appzi -->', 0, '<!-- Go to www.addthis.com/dashboard to customize your tools -->\r\n<script type=\"text/javascript\" src=\"//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5db876f049b4480b\"></script>', 'Services We Provide', 'We work with you to achieve your goals.', 'Portfolios', 'Have a look at our all projects', 'Testimonial', 'What people say about finlance planning', 'Latest news', 'Have a look at the finlance latest News', 'F.A.Q', 'Frequestly Asked Questions', 'Latest Blog', 'From the latest news and blog', 'Service Details', 'Portfolio Details', 'Blog Details', 'Our Gallery', 'Take a look at our captured moments', 'Team Members', 'Meet our team members', 'Contact Us', 'Need information? contact us', '404 Not Found', 'Oops! Looks like you\'re lost', 1, 'static', 'Events', 'Join Our Events & Conferences', 'Event Details', 'Causes', 'Donate Us to Grow Together', 'Cause Details', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `basic_settings_extended`
--

CREATE TABLE `basic_settings_extended` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `pricing_title` varchar(255) DEFAULT NULL,
  `pricing_subtitle` varchar(255) DEFAULT NULL,
  `cookie_alert_status` tinyint(4) NOT NULL DEFAULT 1,
  `cookie_alert_text` blob DEFAULT NULL,
  `cookie_alert_button_text` varchar(255) DEFAULT NULL,
  `to_mail` varchar(255) DEFAULT NULL,
  `career_title` varchar(255) DEFAULT NULL,
  `career_subtitle` varchar(255) DEFAULT NULL,
  `event_calendar_title` varchar(255) DEFAULT NULL,
  `event_calendar_subtitle` varchar(255) DEFAULT NULL,
  `rss_title` varchar(255) DEFAULT NULL,
  `rss_subtitle` varchar(255) DEFAULT NULL,
  `rss_details_title` varchar(255) DEFAULT NULL,
  `default_language_direction` varchar(20) NOT NULL DEFAULT 'ltr' COMMENT 'ltr / rtl',
  `home_meta_keywords` text DEFAULT NULL,
  `home_meta_description` text DEFAULT NULL,
  `services_meta_keywords` text DEFAULT NULL,
  `services_meta_description` text DEFAULT NULL,
  `packages_meta_keywords` text DEFAULT NULL,
  `packages_meta_description` text DEFAULT NULL,
  `portfolios_meta_keywords` text DEFAULT NULL,
  `portfolios_meta_description` text DEFAULT NULL,
  `team_meta_keywords` text DEFAULT NULL,
  `team_meta_description` text DEFAULT NULL,
  `career_meta_keywords` text DEFAULT NULL,
  `career_meta_description` text DEFAULT NULL,
  `calendar_meta_keywords` text DEFAULT NULL,
  `calendar_meta_description` text DEFAULT NULL,
  `gallery_meta_keywords` text DEFAULT NULL,
  `gallery_meta_description` text DEFAULT NULL,
  `faq_meta_keywords` text DEFAULT NULL,
  `faq_meta_description` text DEFAULT NULL,
  `blogs_meta_keywords` text DEFAULT NULL,
  `blogs_meta_description` text DEFAULT NULL,
  `rss_meta_keywords` text DEFAULT NULL,
  `rss_meta_description` text DEFAULT NULL,
  `contact_meta_keywords` text DEFAULT NULL,
  `contact_meta_description` text DEFAULT NULL,
  `quote_meta_keywords` text DEFAULT NULL,
  `quote_meta_description` text DEFAULT NULL,
  `is_facebook_pexel` tinyint(4) NOT NULL DEFAULT 0,
  `facebook_pexel_script` text DEFAULT NULL,
  `theme_version` varchar(70) DEFAULT 'default_service_category',
  `hero_overlay_color` varchar(20) DEFAULT NULL,
  `hero_overlay_opacity` decimal(8,2) DEFAULT NULL,
  `statistics_overlay_color` varchar(20) DEFAULT NULL,
  `statistics_overlay_opacity` decimal(8,2) DEFAULT NULL,
  `team_overlay_color` varchar(20) DEFAULT NULL,
  `team_overlay_opacity` decimal(8,2) DEFAULT NULL,
  `cta_overlay_color` varchar(20) DEFAULT NULL,
  `cta_overlay_opacity` decimal(8,2) DEFAULT NULL,
  `intro_overlay_color` varchar(20) DEFAULT NULL,
  `intro_overlay_opacity` decimal(8,2) DEFAULT NULL,
  `pricing_overlay_color` varchar(20) DEFAULT NULL,
  `pricing_overlay_opacity` decimal(8,2) DEFAULT NULL,
  `breadcrumb_overlay_color` varchar(20) DEFAULT NULL,
  `breadcrumb_overlay_opacity` decimal(8,2) DEFAULT NULL,
  `from_mail` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `is_smtp` tinyint(4) NOT NULL DEFAULT 0,
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(30) DEFAULT NULL,
  `encryption` varchar(30) DEFAULT NULL,
  `smtp_username` varchar(255) DEFAULT NULL,
  `smtp_password` varchar(255) DEFAULT NULL,
  `hero_section_title_font_size` int(11) DEFAULT NULL,
  `hero_section_bold_text_font_size` int(11) DEFAULT NULL,
  `hero_section_bold_text_color` varchar(20) DEFAULT NULL,
  `hero_section_text_font_size` int(11) DEFAULT NULL,
  `hero_section_button_text_font_size` int(11) DEFAULT NULL,
  `statistics_bg` varchar(50) DEFAULT NULL,
  `package_background` varchar(50) DEFAULT NULL,
  `product_title` varchar(255) DEFAULT NULL,
  `product_subtitle` varchar(255) DEFAULT NULL,
  `product_details_title` varchar(255) DEFAULT NULL,
  `cart_title` varchar(255) DEFAULT NULL,
  `cart_subtitle` varchar(255) DEFAULT NULL,
  `checkout_title` varchar(255) DEFAULT NULL,
  `checkout_subtitle` varchar(255) DEFAULT NULL,
  `intro_bg2` varchar(50) DEFAULT NULL,
  `popular_tags` text DEFAULT NULL,
  `open_hour` varchar(255) DEFAULT NULL,
  `about_title` varchar(25) DEFAULT NULL,
  `about_year` int(11) NOT NULL DEFAULT 0,
  `about_bold_text` varchar(255) DEFAULT NULL,
  `about_summary` text DEFAULT NULL,
  `about_signature` varchar(50) DEFAULT NULL,
  `about_phone` varchar(30) DEFAULT NULL,
  `about_main_image` varchar(50) DEFAULT NULL,
  `about_side_image1` varchar(50) DEFAULT NULL,
  `about_side_image2` varchar(50) DEFAULT NULL,
  `about_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive, 1 - active',
  `menu_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive, 1 - active',
  `special_offer_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive, 1 - active',
  `instagram_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive, 1 - active',
  `map_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive, 1 - active',
  `products_meta_keywords` text DEFAULT NULL,
  `products_meta_description` text DEFAULT NULL,
  `cart_meta_keywords` text DEFAULT NULL,
  `cart_meta_description` text DEFAULT NULL,
  `checkout_meta_keywords` text DEFAULT NULL,
  `checkout_meta_description` text DEFAULT NULL,
  `login_meta_keywords` text DEFAULT NULL,
  `login_meta_description` text DEFAULT NULL,
  `register_meta_keywords` text DEFAULT NULL,
  `register_meta_description` text DEFAULT NULL,
  `forgot_meta_keywords` text DEFAULT NULL,
  `forgot_meta_description` text DEFAULT NULL,
  `events_meta_keywords` text DEFAULT NULL,
  `events_meta_description` text DEFAULT NULL,
  `causes_meta_keywords` text DEFAULT NULL,
  `causes_meta_description` text DEFAULT NULL,
  `pricing_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `categories_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `featured_products_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `category_products_section` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_settings_extended`
--

INSERT INTO `basic_settings_extended` (`id`, `language_id`, `pricing_title`, `pricing_subtitle`, `cookie_alert_status`, `cookie_alert_text`, `cookie_alert_button_text`, `to_mail`, `career_title`, `career_subtitle`, `event_calendar_title`, `event_calendar_subtitle`, `rss_title`, `rss_subtitle`, `rss_details_title`, `default_language_direction`, `home_meta_keywords`, `home_meta_description`, `services_meta_keywords`, `services_meta_description`, `packages_meta_keywords`, `packages_meta_description`, `portfolios_meta_keywords`, `portfolios_meta_description`, `team_meta_keywords`, `team_meta_description`, `career_meta_keywords`, `career_meta_description`, `calendar_meta_keywords`, `calendar_meta_description`, `gallery_meta_keywords`, `gallery_meta_description`, `faq_meta_keywords`, `faq_meta_description`, `blogs_meta_keywords`, `blogs_meta_description`, `rss_meta_keywords`, `rss_meta_description`, `contact_meta_keywords`, `contact_meta_description`, `quote_meta_keywords`, `quote_meta_description`, `is_facebook_pexel`, `facebook_pexel_script`, `theme_version`, `hero_overlay_color`, `hero_overlay_opacity`, `statistics_overlay_color`, `statistics_overlay_opacity`, `team_overlay_color`, `team_overlay_opacity`, `cta_overlay_color`, `cta_overlay_opacity`, `intro_overlay_color`, `intro_overlay_opacity`, `pricing_overlay_color`, `pricing_overlay_opacity`, `breadcrumb_overlay_color`, `breadcrumb_overlay_opacity`, `from_mail`, `from_name`, `is_smtp`, `smtp_host`, `smtp_port`, `encryption`, `smtp_username`, `smtp_password`, `hero_section_title_font_size`, `hero_section_bold_text_font_size`, `hero_section_bold_text_color`, `hero_section_text_font_size`, `hero_section_button_text_font_size`, `statistics_bg`, `package_background`, `product_title`, `product_subtitle`, `product_details_title`, `cart_title`, `cart_subtitle`, `checkout_title`, `checkout_subtitle`, `intro_bg2`, `popular_tags`, `open_hour`, `about_title`, `about_year`, `about_bold_text`, `about_summary`, `about_signature`, `about_phone`, `about_main_image`, `about_side_image1`, `about_side_image2`, `about_section`, `menu_section`, `special_offer_section`, `instagram_section`, `map_section`, `products_meta_keywords`, `products_meta_description`, `cart_meta_keywords`, `cart_meta_description`, `checkout_meta_keywords`, `checkout_meta_description`, `login_meta_keywords`, `login_meta_description`, `register_meta_keywords`, `register_meta_description`, `forgot_meta_keywords`, `forgot_meta_description`, `events_meta_keywords`, `events_meta_description`, `causes_meta_keywords`, `causes_meta_description`, `pricing_section`, `categories_section`, `featured_products_section`, `category_products_section`) VALUES
(140, 169, 'Packages', 'Choose a package which suits you best', 1, 0x3c703e3c7370616e20636c6173733d22636f6f6b69652d636f6e73656e745f5f6d65737361676522207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20766572746963616c2d616c69676e3a20626173656c696e653b20666f6e742d66616d696c793a20506f7070696e732c2073616e732d73657269663b20666f6e742d73697a653a20313670783b223e3c7370616e20636c6173733d22636f6f6b69652d636f6e73656e745f5f6d65737361676522207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20766572746963616c2d616c69676e3a20626173656c696e653b223e596f757220657870657269656e6365206f6e207468697320736974652077696c6c20626520696d70726f76656420627920616c6c6f77696e6720636f6f6b6965732e3c2f7370616e3e3c2f7370616e3e3c7370616e20636c6173733d22636f6f6b69652d636f6e73656e745f5f6d65737361676522207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20766572746963616c2d616c69676e3a20626173656c696e653b20666f6e742d66616d696c793a20506f7070696e732c2073616e732d73657269663b20666f6e742d73697a653a20313670783b223e3c7370616e20636c6173733d22636f6f6b69652d636f6e73656e745f5f6d65737361676522207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20766572746963616c2d616c69676e3a20626173656c696e653b223e3c62723e3c2f7370616e3e3c2f7370616e3e3c2f703e3c6469763e3c7370616e20636c6173733d22636f6f6b69652d636f6e73656e745f5f6d65737361676522207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20766572746963616c2d616c69676e3a20626173656c696e653b20636f6c6f723a20726762283235352c203235352c20323535293b20666f6e742d66616d696c793a20506f7070696e732c2073616e732d73657269663b20666f6e742d73697a653a20313670783b206261636b67726f756e642d636f6c6f723a207267622833382c2034312c203536293b223e3c7370616e20636c6173733d22636f6f6b69652d636f6e73656e745f5f6d65737361676522207374796c653d226d617267696e3a203070783b2070616464696e673a203070783b20626f726465723a203070783b20766572746963616c2d616c69676e3a20626173656c696e653b223e3c62723e3c2f7370616e3e3c2f7370616e3e3c2f6469763e, 'Allow Cookies', 'do-not-reply@example.com', 'Career', 'Join our team, improve your skills', 'Events in Calendar', 'Take a quick look at our schedules', 'RSS Feeds', 'Stay Updated about World News', 'Blog Details', 'ltr', 'lorem,ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'Meta Keywords for Portfolios', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem,ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem,ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'event,calendar', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem,ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem, dolor', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'rss,abc,independent', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 0, '<!-- Facebook Pixel Code -->\r\n<script>\r\n!function(f,b,e,v,n,t,s)\r\n{if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\nif(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\nn.queue=[];t=b.createElement(e);t.async=!0;\r\nt.src=v;s=b.getElementsByTagName(e)[0];\r\ns.parentNode.insertBefore(t,s)}(window, document,\'script\',\r\n\'https://connect.facebook.net/en_US/fbevents.js\');\r\nfbq(\'init\', \'2723323421236702\');\r\nfbq(\'track\', \'PageView\');\r\n</script>\r\n<noscript><img height=\"1\" width=\"1\" style=\"display:none\"\r\nsrc=\"https://www.facebook.com/tr?id=2723323421236702&ev=PageView&noscript=1\"\r\n/></noscript>\r\n<!-- End Facebook Pixel Code -->', 'default', '1D3990', '0.60', '0A3041', '0.90', '0A3041', '0.80', '0A3041', '0.70', '13287E', '0.50', '09090B', '0.65', '17305E', '0.80', 'admin@kreativdev.com', 'PlusAgency', 1, 'az1-ts2.a2hosting.com', '587', 'TLS', 'admin@kreativdev.com', 'ZAOP!~rSk~gb', 24, 76, 'FFFFFF', 60, 14, '618d04b8a8775.jpg', '604ed4c139312.jpg', 'Products', 'Choose from our amazing products', 'Product Details', 'Cart', 'Manage your cart', 'Checkout', 'Pay & Purchase your desired items', '606457e160659.png', 'a,b,c,d', 'Sat - Sun 07.00 AM to 10.00 PM', 'Our Story', 25, 'Years Since We Provide Organic Food & Vegetables For Golbal Agency', 'Aenean sed nibh a magna posuere tempor. Nunc faucibus pellentesque nunc in aliquet. Donec congue, nunc vel tempor congue, enim sapien lobortis ipsum, in volutpat.', NULL, '515-708-9386', '5ec62a616c333.png', '5ec62afdd77b5.jpg', '5ec62b301b568.jpg', 1, 1, 1, 1, 1, 'products,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'cart,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'checkout,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'login,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'register,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'forgot,password,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, NULL, NULL, NULL, 1, 1, 1, 1),
(154, 170, 'Packages', 'Choose a package which suits you best', 1, NULL, 'Allow Cookies', 'do-not-reply@example.com', 'Career', 'Join our team, improve your skills', 'Events in Calendar', 'Take a quick look at our schedules', 'RSS Feeds', 'Stay Updated about World News', 'Blog Details', 'ltr', 'lorem,ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'Lorem Ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'Meta Keywords for Portfolios', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem,ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem,ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'event,calendar', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem,ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem, dolor', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'rss,abc,independent', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'lorem', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'ipsum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 0, '<!-- Facebook Pixel Code -->\r\n<script>\r\n!function(f,b,e,v,n,t,s)\r\n{if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\nif(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\nn.queue=[];t=b.createElement(e);t.async=!0;\r\nt.src=v;s=b.getElementsByTagName(e)[0];\r\ns.parentNode.insertBefore(t,s)}(window, document,\'script\',\r\n\'https://connect.facebook.net/en_US/fbevents.js\');\r\nfbq(\'init\', \'2723323421236702\');\r\nfbq(\'track\', \'PageView\');\r\n</script>\r\n<noscript><img height=\"1\" width=\"1\" style=\"display:none\"\r\nsrc=\"https://www.facebook.com/tr?id=2723323421236702&ev=PageView&noscript=1\"\r\n/></noscript>\r\n<!-- End Facebook Pixel Code -->', 'default', '1D3990', '0.60', '0A3041', '0.90', '0A3041', '0.80', '0A3041', '0.70', '13287E', '0.50', '09090B', '0.65', '17305E', '0.80', 'admin@kreativdev.com', 'PlusAgency', 1, 'az1-ts2.a2hosting.com', '587', 'TLS', 'admin@kreativdev.com', 'ZAOP!~rSk~gb', 24, 76, 'FFFFFF', 60, 14, '618d04b8a8775.jpg', '604ed4c139312.jpg', 'Products', 'Choose from our amazing products', 'Product Details', 'Cart', 'Manage your cart', 'Checkout', 'Pay & Purchase your desired items', '606457e160659.png', 'a,b,c,d', 'Sat - Sun 07.00 AM to 10.00 PM', 'Our Story', 25, 'Years Since We Provide Organic Food & Vegetables For Golbal Agency', 'Aenean sed nibh a magna posuere tempor. Nunc faucibus pellentesque nunc in aliquet. Donec congue, nunc vel tempor congue, enim sapien lobortis ipsum, in volutpat.', NULL, '515-708-9386', '5ec62a616c333.png', '5ec62afdd77b5.jpg', '5ec62b301b568.jpg', 1, 1, 1, 1, 1, 'products,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'cart,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'checkout,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'login,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'register,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'forgot,password,page', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, NULL, NULL, NULL, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `basic_settings_extra`
--

CREATE TABLE `basic_settings_extra` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `is_shop` tinyint(4) NOT NULL DEFAULT 1,
  `is_ticket` tinyint(4) NOT NULL DEFAULT 1,
  `is_user_panel` tinyint(4) NOT NULL DEFAULT 1,
  `base_currency_symbol` blob DEFAULT NULL,
  `base_currency_symbol_position` varchar(10) NOT NULL DEFAULT 'left',
  `base_currency_text` varchar(100) DEFAULT NULL,
  `base_currency_text_position` varchar(10) NOT NULL DEFAULT 'right',
  `base_currency_rate` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_facebook_login` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - Active, 0 - Deactive',
  `facebook_app_id` varchar(100) DEFAULT NULL,
  `facebook_app_secret` varchar(100) DEFAULT NULL,
  `is_google_login` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - Active, 0 - Deactive',
  `google_client_id` varchar(150) DEFAULT NULL,
  `google_client_secret` varchar(70) DEFAULT NULL,
  `product_guest_checkout` tinyint(4) NOT NULL DEFAULT 1,
  `product_rating_system` tinyint(4) NOT NULL DEFAULT 1,
  `package_guest_checkout` tinyint(4) NOT NULL DEFAULT 1,
  `timezone` varchar(255) DEFAULT NULL,
  `recurring_billing` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `expiration_reminder` int(11) DEFAULT NULL COMMENT 'number of days of reminder before subscription expiration',
  `preloader_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive, 1 - active',
  `preloader` varchar(50) DEFAULT NULL,
  `course_title` varchar(255) DEFAULT NULL,
  `course_subtitle` varchar(255) DEFAULT NULL,
  `course_details_title` varchar(255) DEFAULT NULL,
  `is_course` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - activate all pages related to courses, 0 - deactivate all pages related to courses',
  `knowledgebase_title` varchar(70) DEFAULT NULL,
  `knowledgebase_subtitle` varchar(70) DEFAULT NULL,
  `knowledgebase_details_title` varchar(70) DEFAULT NULL,
  `donation_guest_checkout` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `is_donation` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `is_event` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `event_guest_checkout` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `service_category` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `catalog_mode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - active, 2 - deactive',
  `is_course_rating` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive, 1 - active',
  `push_notification_icon` varchar(50) DEFAULT NULL,
  `contact_addresses` text DEFAULT NULL,
  `contact_numbers` text DEFAULT NULL,
  `contact_mails` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `map_zoom` int(11) NOT NULL DEFAULT 15,
  `home_page_pagebuilder` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - enabled, 0 - disabled',
  `custom_page_pagebuilder` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `is_whatsapp` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - enable, 0 - disable',
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `whatsapp_header_title` varchar(255) NOT NULL DEFAULT 'Chat with us on WhatsApp!',
  `whatsapp_popup_message` text DEFAULT NULL,
  `whatsapp_popup` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - enable, 0 - disable',
  `client_feedback_title` varchar(255) NOT NULL,
  `client_feedback_subtitle` varchar(255) NOT NULL,
  `faq_category_status` tinyint(3) UNSIGNED NOT NULL,
  `gallery_category_status` tinyint(3) UNSIGNED NOT NULL,
  `package_category_status` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_settings_extra`
--

INSERT INTO `basic_settings_extra` (`id`, `language_id`, `is_shop`, `is_ticket`, `is_user_panel`, `base_currency_symbol`, `base_currency_symbol_position`, `base_currency_text`, `base_currency_text_position`, `base_currency_rate`, `tax`, `is_facebook_login`, `facebook_app_id`, `facebook_app_secret`, `is_google_login`, `google_client_id`, `google_client_secret`, `product_guest_checkout`, `product_rating_system`, `package_guest_checkout`, `timezone`, `recurring_billing`, `expiration_reminder`, `preloader_status`, `preloader`, `course_title`, `course_subtitle`, `course_details_title`, `is_course`, `knowledgebase_title`, `knowledgebase_subtitle`, `knowledgebase_details_title`, `donation_guest_checkout`, `is_donation`, `is_event`, `event_guest_checkout`, `service_category`, `catalog_mode`, `is_course_rating`, `push_notification_icon`, `contact_addresses`, `contact_numbers`, `contact_mails`, `url`, `latitude`, `longitude`, `map_zoom`, `home_page_pagebuilder`, `custom_page_pagebuilder`, `is_whatsapp`, `whatsapp_number`, `whatsapp_header_title`, `whatsapp_popup_message`, `whatsapp_popup`, `client_feedback_title`, `client_feedback_subtitle`, `faq_category_status`, `gallery_category_status`, `package_category_status`) VALUES
(1, 169, 1, 1, 1, 0x24, 'left', 'NGN', 'right', '362.00', '5.00', 1, '211657824026859', '72e2d5c729f4116ae69b37544efcf588', 1, '81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com', 'otutovHmfl4eFj8WZVq0sYNz', 1, 1, 0, 'Asia/Kolkata', 1, 3, 1, '6190a0c21cda2.gif', 'Courses', 'Choose From Our Amazing Courses', 'Course Details', 1, 'Knowledgebase', 'Find Answers Before Asking', 'Knowledgebase Details', 0, 1, 1, 1, 1, 0, 1, '61909f4aabadc.png', 'Thane, Maharashtra', '(022) 2541 4739', 'support@stemwater.org', 'https://stemwater.org', '19.194495', '72.954099', 0, 1, 1, 0, '+12025550147', 'Welcome to PlusAgency', 'Admin can also disable WhatsApp Chat\r\n& enable Tawk.to chat\r\n(Admin can set any message here)', 1, 'Client Feedback', 'Feel Free to Leave us Some Suggestions', 1, 1, 1),
(181, 170, 1, 1, 1, 0x24, 'left', 'NGN', 'right', '362.00', '5.00', 1, '211657824026859', '72e2d5c729f4116ae69b37544efcf588', 1, '81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com', 'otutovHmfl4eFj8WZVq0sYNz', 1, 1, 0, 'Asia/Kolkata', 1, 3, 1, '6190a0c21cda2.gif', 'Courses', 'Choose From Our Amazing Courses', 'Course Details', 1, 'Knowledgebase', 'Find Answers Before Asking', 'Knowledgebase Details', 0, 1, 1, 1, 1, 0, 1, '61909f4aabadc.png', 'ठाणे, महाराष्ट्र', '(०२२) २५४१ ४७३९', 'support@stemwater.org', NULL, '19.194495', '72.954099', 0, 1, 1, 0, '+12025550147', 'Welcome to PlusAgency', 'Admin can also disable WhatsApp Chat\r\n& enable Tawk.to chat\r\n(Admin can set any message here)', 1, 'Client Feedback', 'Feel Free to Leave us Some Suggestions', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bcategories`
--

CREATE TABLE `bcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `serial_number` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `bcategory_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `main_image` varchar(255) DEFAULT NULL,
  `content` blob DEFAULT NULL,
  `sidebar` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - enabled, 0 - disabled',
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `limits` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE `calendar_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_query`
--

CREATE TABLE `contact_query` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(90) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` decimal(11,2) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `minimum_spend` decimal(11,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `course_category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `current_price` int(11) DEFAULT NULL,
  `previous_price` int(11) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `course_image` varchar(255) NOT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `overview` text NOT NULL,
  `instructor_image` varchar(255) NOT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `instructor_occupation` varchar(255) NOT NULL,
  `instructor_details` text NOT NULL,
  `instructor_facebook` varchar(255) DEFAULT NULL,
  `instructor_instagram` varchar(255) DEFAULT NULL,
  `instructor_twitter` varchar(255) DEFAULT NULL,
  `instructor_linkedin` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `duration` varchar(255) NOT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `average_rating` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_purchases`
--

CREATE TABLE `course_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `current_price` int(11) DEFAULT NULL,
  `previous_price` int(11) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `receipt` varchar(255) DEFAULT NULL,
  `gateway_type` varchar(255) NOT NULL DEFAULT 'online'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_reviews`
--

CREATE TABLE `course_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `date_table`
--

CREATE TABLE `date_table` (
  `id` int(11) NOT NULL,
  `tdate` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `date_table`
--

INSERT INTO `date_table` (`id`, `tdate`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2024-05-09', 1, '2024-05-16 03:42:40', '2024-05-16 03:43:36', '2024-05-16 03:43:36'),
(2, '2024-05-11', 0, '2024-05-16 03:42:54', '2024-05-16 03:42:54', NULL),
(3, '2023-04-01', 1, '2024-05-16 03:43:36', '2024-05-16 05:30:39', '2024-05-16 05:30:39'),
(4, '2024-05-18', 1, '2024-05-16 05:30:39', '2024-05-16 05:30:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dlink`
--

CREATE TABLE `dlink` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dlink`
--

INSERT INTO `dlink` (`id`, `language_id`, `name`, `url`) VALUES
(1, 169, 'Administration', 'http://localhost:8001/'),
(2, 169, 'Engineering', 'http://localhost:8001/'),
(3, 169, 'Finance and Accounts', 'http://localhost:8001/'),
(4, 170, 'प्रशासन', 'http://localhost:8001/'),
(5, 170, 'अभियांत्रिकी', 'http://localhost:8001/'),
(6, 170, 'वित्त आणि लेखा', 'http://localhost:8001/'),
(7, 169, 'Technical Documents', 'http://localhost:8001/documents/technical-documents-896'),
(9, 170, 'तांत्रिक कागदपत्रे', 'http://localhost:8001/documents/technical-documents-896'),
(10, 169, 'Circulars', 'http://localhost:8001/documents/circulars-2717'),
(11, 170, 'परिपत्रके', 'http://localhost:8001/documents/circulars-2717'),
(12, 169, 'Water Tariff And Charges', 'http://localhost:8001/Water-Tariff-And-Charges'),
(13, 170, 'पाणी दर आणि शुल्क', 'http://localhost:8001/Water-Tariff-And-Charges---MR');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `document_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_mr` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `files` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `language_id`, `document_category_id`, `name`, `name_mr`, `status`, `files`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'BRIHANMUMBAI MUNICIPAL CORPORATION-BRIDGE WORKS-2023', 'बृहन्मुंबई महानगरपालिका-ब्रिज वर्क-२०२३', 1, '404-1715602335.pdf', NULL, '2024-05-13 12:12:15', '2024-05-13 12:12:15'),
(2, NULL, 1, 'MUNICIPAL CORPORATION OF GREATER MUMBAI VOLUME-I USOR FOR HORTICULTURE AND GARDEN WORKS 2013', 'ग्रेटर मुंबई व्हॉल्यूम-1 युएसओआर फॉर हॉर्टीकल्चर अँड गार्डन वर्क्स 2013 चे नगरपालिका कॉर्पोरेशन', 1, '673-1715602356.pdf', NULL, '2024-05-13 12:12:36', '2024-05-13 12:12:36'),
(3, NULL, 1, 'BRIHAN MUMBAI MAHANAGARPALIKA HORTICULTURE DEVELOPMENT, MAINTENANCE, GARDEN MATERIALS AND TREE PRESERVATION & PROTECTION WORKS USOR 2023', 'बृहन मुंबई महानगरपालिका फलोत्पादन विकास, देखभाल, गार्डन मटेरिअल्स आणि ट्री रिझर्वेशन आणि प्रोटेक्शन वर्क्स USOR 2023', 1, '174-1715602402.pdf', NULL, '2024-05-13 12:13:22', '2024-05-13 12:13:22'),
(4, NULL, 1, 'BRIHAN MUMBAI MUNICIPAL CORPORATION VOLUME - I USOR FOR HYDRAULIC ENGINEERING SCHEDULE 2023', 'बृहन मुंबई महानगरपालिका खंड - हायड्रोलिक इंजिनिअरिंग शेड्यूल 2023 साठी I USOR', 1, '434-1715602429.pdf', NULL, '2024-05-13 12:13:49', '2024-05-13 12:13:49'),
(5, NULL, 1, 'BRIHAN MUMBAI MUNICIPAL CORPORATION WATER SUPPLY PROJECTS USoR 2023', 'बृहन मुंबई महानगरपालिका पाणी पुरवठा प्रकल्प USoR 2023', 1, '509-1715602458.pdf', NULL, '2024-05-13 12:14:18', '2024-05-13 12:14:18'),
(6, NULL, 2, 'Thok Jaladara joint to be used for industrial and agricultural projects', 'औद्योगिक व कृषी सिंचन प्रयोजनार्थ वापरल्या जाणाऱ्या पाण्यासाठी ठोक जलदराबाबत', 1, '275-1715602563.pdf', NULL, '2024-05-13 12:16:03', '2024-05-13 12:16:03'),
(7, NULL, 2, 'Maharashtra Civil Service Rules, 1981', 'महाराष्ट्र नागरी सेवा नियम, १९८१', 1, '332-1715602589.pdf', NULL, '2024-05-13 12:16:29', '2024-05-13 12:16:29'),
(8, NULL, 2, 'Maharashtra Water Resources Regulatory Authority', 'महाराष्ट्र जलसंपत्ती नियमन प्राधिकरण', 1, '470-1715602607.pdf', NULL, '2024-05-13 12:16:47', '2024-05-13 12:16:47'),
(9, NULL, 2, 'Institutional Arbitration Policy', 'संस्थात्मक लवाद धोरण', 1, '591-1715602623.pdf', NULL, '2024-05-13 12:17:03', '2024-05-13 12:17:03'),
(10, NULL, NULL, 'Tender publicity, opening of tender envelopes under e-tendering process of Public Works Department and Consolidated Revised Instructions regarding Tender Inspection and Acceptance', 'सार्वजनिक बांधकाम विभागाच्या ई निविदा प्रक्रियेअंतर्गत निविदा प्रसिद्धी, निविदा लिफाफे उघडणे आणि निविदा तपासणी व स्विकृती याबाबत एकत्रित सुधारित सूचना', 1, '943-1715602662.pdf', NULL, '2024-05-13 12:17:42', '2024-05-13 12:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `document_categories`
--

CREATE TABLE `document_categories` (
  `id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_mr` varchar(255) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_categories`
--

INSERT INTO `document_categories` (`id`, `language_id`, `name`, `name_mr`, `slug`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Technical Documents', 'तांत्रिक कागदपत्रे', 'technical-documents-896', 1, NULL, '2024-05-13 09:20:27', '2024-05-13 09:20:27'),
(2, NULL, 'Circulars', 'परिपत्रके', 'circulars-2717', 1, NULL, '2024-05-13 09:20:46', '2024-05-13 09:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `goal_amount` double NOT NULL,
  `min_amount` double NOT NULL,
  `custom_amount` longtext DEFAULT NULL,
  `meta_tags` longtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `lang_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `title`, `slug`, `content`, `goal_amount`, `min_amount`, `custom_amount`, `meta_tags`, `meta_description`, `image`, `lang_id`, `created_at`, `updated_at`) VALUES
(11, 'Child Education', 'Contrary-to-popular-belief,-Lorem-Ipsum', '<div style=\"text-align: justify; line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span></div>', 100000, 500, '500,2000,3000', 'mqta1,meta2', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obsc', '1613805616.jpg', 169, '2021-02-03 18:24:38', '2021-02-19 20:32:36'),
(13, 'Medical Equipments', 'Medical-Equipments', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span><br></p>', 50000, 50, '50,500,2000', 'meta1,meta2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '1613806543.jpg', 169, '2021-02-19 20:36:45', '2021-02-19 20:36:45'),
(14, 'Foods', 'Foods', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span><br></p>', 500000, 50, '50,1000,2000', 'meta1,meta2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '1613806624.jpg', 169, '2021-02-19 20:38:11', '2021-02-19 20:38:11'),
(15, 'Child Education', 'Contrary-to-popular-belief,-Lorem-Ipsum', '<div style=\"text-align: justify; line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span></div>', 100000, 500, '500,2000,3000', 'mqta1,meta2', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obsc', '1613805616.jpg', 169, '2021-02-03 18:24:38', '2021-02-19 20:32:36'),
(16, 'Medical Equipments', 'Medical-Equipments', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span><br></p>', 50000, 50, '50,500,2000', 'meta1,meta2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '1613806543.jpg', 169, '2021-02-19 20:36:45', '2021-02-19 20:36:45'),
(17, 'Foods', 'Foods', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span><br></p>', 500000, 50, '50,1000,2000', 'meta1,meta2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '1613806624.jpg', 169, '2021-02-19 20:38:11', '2021-02-19 20:38:11'),
(18, 'Educação infantil', 'educacao-infantil', '<div style=\"text-align: justify; line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span></div>', 100000, 500, '500,2000,3000', 'mqta1,meta2', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obsc', '1613805616.jpg', 170, '2021-02-03 18:24:38', '2021-02-19 20:32:36'),
(19, 'Equipamentos Médicos', 'equipamentos-medicos', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span><br></p>', 50000, 50, '50,500,2000', 'meta1,meta2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '1613806543.jpg', 170, '2021-02-19 20:36:45', '2021-02-19 20:36:45'),
(20, 'Alimentos', 'Alimentos', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span><br></p>', 500000, 50, '50,1000,2000', 'meta1,meta2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '1613806624.jpg', 170, '2021-02-19 20:38:11', '2021-02-19 20:38:11'),
(24, 'Educação infantil', 'educacao-infantil', '<div style=\"text-align: justify; line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span></div>', 100000, 500, '500,2000,3000', 'mqta1,meta2', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obsc', '1613805616.jpg', 170, '2021-02-03 18:24:38', '2021-02-19 20:32:36'),
(25, 'Equipamentos Médicos', 'equipamentos-medicos', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span><br></p>', 50000, 50, '50,500,2000', 'meta1,meta2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '1613806543.jpg', 170, '2021-02-19 20:36:45', '2021-02-19 20:36:45'),
(26, 'Alimentos', 'Alimentos', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</font></span><br></p>', 500000, 50, '50,1000,2000', 'meta1,meta2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '1613806624.jpg', 170, '2021-02-19 20:38:11', '2021-02-19 20:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `donation_details`
--

CREATE TABLE `donation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT 'anonymous',
  `email` varchar(255) DEFAULT 'anonymous',
  `phone` varchar(255) DEFAULT 'xxxxxxxxxxxx',
  `amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT 'USD Converted Amount',
  `currency` varchar(255) NOT NULL,
  `currency_position` varchar(255) NOT NULL DEFAULT 'right',
  `currency_symbol` varchar(255) NOT NULL,
  `currency_symbol_position` varchar(255) NOT NULL DEFAULT 'left',
  `payment_method` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `receipt` longtext DEFAULT NULL,
  `transaction_details` longtext DEFAULT NULL,
  `bex_details` longtext DEFAULT NULL,
  `donation_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donation_details`
--

INSERT INTO `donation_details` (`id`, `user_id`, `name`, `email`, `phone`, `amount`, `currency`, `currency_position`, `currency_symbol`, `currency_symbol_position`, `payment_method`, `transaction_id`, `status`, `receipt`, `transaction_details`, `bex_details`, `donation_id`, `created_at`, `updated_at`) VALUES
(52, 26, 'John', 'user@gmail.com', '2723724', '2000.00', 'USD', 'right', '$', 'left', 'Mollie Payment', '6083d59b6b990', 'Success', NULL, '{\"resource\":\"payment\",\"id\":\"tr_BqeABc6mSu\",\"mode\":\"test\",\"amount\":{\"value\":\"2000.00\",\"currency\":\"USD\"},\"settlementAmount\":{\"value\":\"1603.68\",\"currency\":\"EUR\"},\"amountRefunded\":{\"value\":\"0.00\",\"currency\":\"USD\"},\"amountRemaining\":{\"value\":\"2000.00\",\"currency\":\"USD\"},\"amountChargedBack\":null,\"description\":\"Making a donation\",\"method\":\"creditcard\",\"status\":\"paid\",\"createdAt\":\"2021-04-24T08:23:47+00:00\",\"paidAt\":\"2021-04-24T08:23:56+00:00\",\"canceledAt\":null,\"expiresAt\":null,\"failedAt\":null,\"dueDate\":null,\"billingEmail\":null,\"profileId\":\"pfl_wWVQgHa2jS\",\"sequenceType\":\"oneoff\",\"redirectUrl\":\"http:\\/\\/localhost\\/plusagency\\/plusagency-3.1\\/cause\\/mollie\\/success\",\"webhookUrl\":null,\"mandateId\":null,\"subscriptionId\":null,\"orderId\":null,\"settlementId\":null,\"locale\":null,\"metadata\":null,\"details\":{\"cardNumber\":\"6787\",\"cardHolder\":\"T. TEST\",\"cardAudience\":\"consumer\",\"cardLabel\":\"Mastercard\",\"cardCountryCode\":\"NL\",\"cardSecurity\":\"normal\",\"feeRegion\":\"other\"},\"restrictPaymentMethodsToCountry\":null,\"_links\":{\"self\":{\"href\":\"https:\\/\\/api.mollie.com\\/v2\\/payments\\/tr_BqeABc6mSu\",\"type\":\"application\\/hal+json\"},\"dashboard\":{\"href\":\"https:\\/\\/www.mollie.com\\/dashboard\\/org_6529881\\/payments\\/tr_BqeABc6mSu\",\"type\":\"text\\/html\"},\"changePaymentState\":{\"href\":\"https:\\/\\/www.mollie.com\\/paymentscreen\\/testmode\\/?method=creditcard&token=2.3xssql\",\"type\":\"text\\/html\"},\"documentation\":{\"href\":\"https:\\/\\/docs.mollie.com\\/reference\\/v2\\/payments-api\\/get-payment\",\"type\":\"text\\/html\"}},\"_embedded\":null,\"isCancelable\":null,\"amountCaptured\":null,\"applicationFee\":null,\"authorizedAt\":null,\"expiredAt\":null,\"customerId\":null,\"countryCode\":\"BD\"}', '{\"id\":1,\"language_id\":169,\"is_shop\":1,\"is_ticket\":1,\"is_user_panel\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"right\",\"base_currency_rate\":\"1.00\",\"tax\":\"5.00\",\"is_facebook_login\":1,\"facebook_app_id\":\"211657824026859\",\"facebook_app_secret\":\"72e2d5c729f4116ae69b37544efcf588\",\"is_google_login\":1,\"google_client_id\":\"81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com\",\"google_client_secret\":\"otutovHmfl4eFj8WZVq0sYNz\",\"product_guest_checkout\":1,\"product_rating_system\":1,\"package_guest_checkout\":0,\"timezone\":\"Europe\\/Andorra\",\"recurring_billing\":1,\"expiration_reminder\":3,\"preloader_status\":0,\"preloader\":\"604da366b8e8e.gif\",\"course_title\":\"Courses\",\"course_subtitle\":\"Choose From Our Amazing Courses\",\"course_details_title\":\"Course Details\",\"is_course\":1,\"knowledgebase_title\":\"Knowledgebase\",\"knowledgebase_subtitle\":\"Find Answers Before Asking\",\"knowledgebase_details_title\":\"Knowledgebase Details\",\"donation_guest_checkout\":1,\"is_donation\":1,\"is_event\":1,\"event_guest_checkout\":1,\"service_category\":1,\"catalog_mode\":0,\"is_course_rating\":1,\"push_notification_icon\":\"605ac7a0f0810.png\",\"contact_addresses\":\"House - 44, Road - 03, Sector - 11, Uttara, Dhaka\\r\\nDhanmondi, Dhaka\\r\\nMohammadpur, Dhaka\",\"contact_numbers\":\"+123 366 892, +991 2336 255, +064 26 622 62\",\"contact_mails\":\"contact@example.com,inquiry@example.com, questions@example.com\",\"latitude\":\"23.8754443686446\",\"longitude\":\"90.39318192382245\",\"map_zoom\":16,\"home_page_pagebuilder\":1,\"custom_page_pagebuilder\":1,\"is_whatsapp\":1,\"whatsapp_number\":\"+12025550147\",\"whatsapp_header_title\":\"Welcome to PlusAgency\",\"whatsapp_popup_message\":\"Admin can also disable WhatsApp Chat\\r\\n& enable Tawk.to chat\\r\\n(Admin can set any message here)\",\"whatsapp_popup\":1,\"client_feedback_title\":\"\",\"client_feedback_subtitle\":\"\",\"faq_category_status\":1,\"gallery_category_status\":1,\"package_category_status\":1}', 11, '2021-04-24 04:23:55', '2021-04-24 04:23:55'),
(53, 26, 'John', 'user@gmail.com', '2723724', '2000.00', 'USD', 'right', '$', 'left', 'Paypal', '6083d5d4c7750', 'Success', NULL, '{\n    \"id\": \"PAYID-MCB5LOA3JE287111D712901G\",\n    \"intent\": \"sale\",\n    \"state\": \"approved\",\n    \"cart\": \"6B693534AL263593X\",\n    \"payer\": {\n        \"payment_method\": \"paypal\",\n        \"status\": \"VERIFIED\",\n        \"payer_info\": {\n            \"email\": \"megasoft.envato@gmail.com\",\n            \"first_name\": \"Samiul Alim\",\n            \"last_name\": \"Pratik\",\n            \"payer_id\": \"8C5NYJ7EZ7QSS\",\n            \"shipping_address\": {\n                \"recipient_name\": \"Samiul Alim Pratik\",\n                \"line1\": \"1 Main St\",\n                \"city\": \"San Jose\",\n                \"state\": \"CA\",\n                \"postal_code\": \"95131\",\n                \"country_code\": \"US\"\n            },\n            \"country_code\": \"US\"\n        }\n    },\n    \"transactions\": [\n        {\n            \"amount\": {\n                \"total\": \"2000.00\",\n                \"currency\": \"USD\",\n                \"details\": {\n                    \"subtotal\": \"2000.00\",\n                    \"shipping\": \"0.00\",\n                    \"insurance\": \"0.00\",\n                    \"handling_fee\": \"0.00\",\n                    \"shipping_discount\": \"0.00\",\n                    \"discount\": \"0.00\"\n                }\n            },\n            \"payee\": {\n                \"merchant_id\": \"BKNWZYE3MAUNU\",\n                \"email\": \"megasoft.envato-facilitator@gmail.com\"\n            },\n            \"description\": \"Making a donation Via Paypal\",\n            \"item_list\": {\n                \"items\": [\n                    {\n                        \"name\": \"Making a donation\",\n                        \"price\": \"2000.00\",\n                        \"currency\": \"USD\",\n                        \"tax\": \"0.00\",\n                        \"quantity\": 1\n                    }\n                ],\n                \"shipping_address\": {\n                    \"recipient_name\": \"Samiul Alim Pratik\",\n                    \"line1\": \"1 Main St\",\n                    \"city\": \"San Jose\",\n                    \"state\": \"CA\",\n                    \"postal_code\": \"95131\",\n                    \"country_code\": \"US\"\n                }\n            },\n            \"related_resources\": [\n                {\n                    \"sale\": {\n                        \"id\": \"94U82531WM0371848\",\n                        \"state\": \"completed\",\n                        \"amount\": {\n                            \"total\": \"2000.00\",\n                            \"currency\": \"USD\",\n                            \"details\": {\n                                \"subtotal\": \"2000.00\",\n                                \"shipping\": \"0.00\",\n                                \"insurance\": \"0.00\",\n                                \"handling_fee\": \"0.00\",\n                                \"shipping_discount\": \"0.00\",\n                                \"discount\": \"0.00\"\n                            }\n                        },\n                        \"payment_mode\": \"INSTANT_TRANSFER\",\n                        \"protection_eligibility\": \"ELIGIBLE\",\n                        \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\n                        \"transaction_fee\": {\n                            \"value\": \"58.30\",\n                            \"currency\": \"USD\"\n                        },\n                        \"parent_payment\": \"PAYID-MCB5LOA3JE287111D712901G\",\n                        \"create_time\": \"2021-04-24T08:24:53Z\",\n                        \"update_time\": \"2021-04-24T08:24:53Z\",\n                        \"links\": [\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/94U82531WM0371848\",\n                                \"rel\": \"self\",\n                                \"method\": \"GET\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/94U82531WM0371848/refund\",\n                                \"rel\": \"refund\",\n                                \"method\": \"POST\"\n                            },\n                            {\n                                \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MCB5LOA3JE287111D712901G\",\n                                \"rel\": \"parent_payment\",\n                                \"method\": \"GET\"\n                            }\n                        ]\n                    }\n                }\n            ]\n        }\n    ],\n    \"redirect_urls\": {\n        \"return_url\": \"http://localhost/plusagency/plusagency-3.1/cause/paypal/payment/success?paymentId=PAYID-MCB5LOA3JE287111D712901G\",\n        \"cancel_url\": \"http://localhost/plusagency/plusagency-3.1/cause/paypal/payment/cancel\"\n    },\n    \"create_time\": \"2021-04-24T08:24:24Z\",\n    \"update_time\": \"2021-04-24T08:24:53Z\",\n    \"links\": [\n        {\n            \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MCB5LOA3JE287111D712901G\",\n            \"rel\": \"self\",\n            \"method\": \"GET\"\n        }\n    ],\n    \"failed_transactions\": []\n}', '{\"id\":1,\"language_id\":169,\"is_shop\":1,\"is_ticket\":1,\"is_user_panel\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"right\",\"base_currency_rate\":\"1.00\",\"tax\":\"5.00\",\"is_facebook_login\":1,\"facebook_app_id\":\"211657824026859\",\"facebook_app_secret\":\"72e2d5c729f4116ae69b37544efcf588\",\"is_google_login\":1,\"google_client_id\":\"81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com\",\"google_client_secret\":\"otutovHmfl4eFj8WZVq0sYNz\",\"product_guest_checkout\":1,\"product_rating_system\":1,\"package_guest_checkout\":0,\"timezone\":\"Europe\\/Andorra\",\"recurring_billing\":1,\"expiration_reminder\":3,\"preloader_status\":0,\"preloader\":\"604da366b8e8e.gif\",\"course_title\":\"Courses\",\"course_subtitle\":\"Choose From Our Amazing Courses\",\"course_details_title\":\"Course Details\",\"is_course\":1,\"knowledgebase_title\":\"Knowledgebase\",\"knowledgebase_subtitle\":\"Find Answers Before Asking\",\"knowledgebase_details_title\":\"Knowledgebase Details\",\"donation_guest_checkout\":1,\"is_donation\":1,\"is_event\":1,\"event_guest_checkout\":1,\"service_category\":1,\"catalog_mode\":0,\"is_course_rating\":1,\"push_notification_icon\":\"605ac7a0f0810.png\",\"contact_addresses\":\"House - 44, Road - 03, Sector - 11, Uttara, Dhaka\\r\\nDhanmondi, Dhaka\\r\\nMohammadpur, Dhaka\",\"contact_numbers\":\"+123 366 892, +991 2336 255, +064 26 622 62\",\"contact_mails\":\"contact@example.com,inquiry@example.com, questions@example.com\",\"latitude\":\"23.8754443686446\",\"longitude\":\"90.39318192382245\",\"map_zoom\":16,\"home_page_pagebuilder\":1,\"custom_page_pagebuilder\":1,\"is_whatsapp\":1,\"whatsapp_number\":\"+12025550147\",\"whatsapp_header_title\":\"Welcome to PlusAgency\",\"whatsapp_popup_message\":\"Admin can also disable WhatsApp Chat\\r\\n& enable Tawk.to chat\\r\\n(Admin can set any message here)\",\"whatsapp_popup\":1,\"client_feedback_title\":\"\",\"client_feedback_subtitle\":\"\",\"faq_category_status\":1,\"gallery_category_status\":1,\"package_category_status\":1}', 13, '2021-04-24 04:24:52', '2021-04-24 04:24:52'),
(54, 26, 'John', 'user@gmail.com', '2723724', '50.00', 'USD', 'right', '$', 'left', 'Stripe', '6083d5faa5f86', 'Success', NULL, '{\"id\":\"ch_1IjgnwJlIV5dN9n7EYv7u5FE\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_1IjgnwJlIV5dN9n7SkYvwVPg\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"Stripe\",\"captured\":true,\"created\":1619252732,\"currency\":\"usd\",\"customer\":null,\"description\":\"Your donation make someone day awesome\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":8,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1IjgnvJlIV5dN9n7IszwgqCR\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":12,\"exp_year\":2023,\"fingerprint\":\"WXDgVUSzrY61Nnm6\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/acct_1Azeo3JlIV5dN9n7\\/ch_1IjgnwJlIV5dN9n7EYv7u5FE\\/rcpt_JMPdPBUUIzEyJDzeu4sS8a0xwG9X6mX\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_1IjgnwJlIV5dN9n7EYv7u5FE\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1IjgnvJlIV5dN9n7IszwgqCR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":12,\"exp_year\":2023,\"fingerprint\":\"WXDgVUSzrY61Nnm6\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', '{\"id\":1,\"language_id\":169,\"is_shop\":1,\"is_ticket\":1,\"is_user_panel\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"right\",\"base_currency_rate\":\"1.00\",\"tax\":\"5.00\",\"is_facebook_login\":1,\"facebook_app_id\":\"211657824026859\",\"facebook_app_secret\":\"72e2d5c729f4116ae69b37544efcf588\",\"is_google_login\":1,\"google_client_id\":\"81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com\",\"google_client_secret\":\"otutovHmfl4eFj8WZVq0sYNz\",\"product_guest_checkout\":1,\"product_rating_system\":1,\"package_guest_checkout\":0,\"timezone\":\"Europe\\/Andorra\",\"recurring_billing\":1,\"expiration_reminder\":3,\"preloader_status\":0,\"preloader\":\"604da366b8e8e.gif\",\"course_title\":\"Courses\",\"course_subtitle\":\"Choose From Our Amazing Courses\",\"course_details_title\":\"Course Details\",\"is_course\":1,\"knowledgebase_title\":\"Knowledgebase\",\"knowledgebase_subtitle\":\"Find Answers Before Asking\",\"knowledgebase_details_title\":\"Knowledgebase Details\",\"donation_guest_checkout\":1,\"is_donation\":1,\"is_event\":1,\"event_guest_checkout\":1,\"service_category\":1,\"catalog_mode\":0,\"is_course_rating\":1,\"push_notification_icon\":\"605ac7a0f0810.png\",\"contact_addresses\":\"House - 44, Road - 03, Sector - 11, Uttara, Dhaka\\r\\nDhanmondi, Dhaka\\r\\nMohammadpur, Dhaka\",\"contact_numbers\":\"+123 366 892, +991 2336 255, +064 26 622 62\",\"contact_mails\":\"contact@example.com,inquiry@example.com, questions@example.com\",\"latitude\":\"23.8754443686446\",\"longitude\":\"90.39318192382245\",\"map_zoom\":16,\"home_page_pagebuilder\":1,\"custom_page_pagebuilder\":1,\"is_whatsapp\":1,\"whatsapp_number\":\"+12025550147\",\"whatsapp_header_title\":\"Welcome to PlusAgency\",\"whatsapp_popup_message\":\"Admin can also disable WhatsApp Chat\\r\\n& enable Tawk.to chat\\r\\n(Admin can set any message here)\",\"whatsapp_popup\":1,\"client_feedback_title\":\"\",\"client_feedback_subtitle\":\"\",\"faq_category_status\":1,\"gallery_category_status\":1,\"package_category_status\":1}', 13, '2021-04-24 04:25:30', '2021-04-24 04:25:30'),
(55, 26, 'John', 'user@gmail.com', '2723724', '500.00', 'USD', 'right', '$', 'left', 'Mollie Payment', '6083d77ca1a2f', 'Success', NULL, '{\"resource\":\"payment\",\"id\":\"tr_52gw3useaj\",\"mode\":\"test\",\"amount\":{\"value\":\"500.00\",\"currency\":\"USD\"},\"settlementAmount\":{\"value\":\"400.92\",\"currency\":\"EUR\"},\"amountRefunded\":{\"value\":\"0.00\",\"currency\":\"USD\"},\"amountRemaining\":{\"value\":\"500.00\",\"currency\":\"USD\"},\"amountChargedBack\":null,\"description\":\"Making a donation\",\"method\":\"creditcard\",\"status\":\"paid\",\"createdAt\":\"2021-04-24T08:31:50+00:00\",\"paidAt\":\"2021-04-24T08:31:57+00:00\",\"canceledAt\":null,\"expiresAt\":null,\"failedAt\":null,\"dueDate\":null,\"billingEmail\":null,\"profileId\":\"pfl_wWVQgHa2jS\",\"sequenceType\":\"oneoff\",\"redirectUrl\":\"http:\\/\\/localhost\\/plusagency\\/plusagency-3.1\\/cause\\/mollie\\/success\",\"webhookUrl\":null,\"mandateId\":null,\"subscriptionId\":null,\"orderId\":null,\"settlementId\":null,\"locale\":null,\"metadata\":null,\"details\":{\"cardNumber\":\"6787\",\"cardHolder\":\"T. TEST\",\"cardAudience\":\"consumer\",\"cardLabel\":\"Mastercard\",\"cardCountryCode\":\"NL\",\"cardSecurity\":\"normal\",\"feeRegion\":\"other\"},\"restrictPaymentMethodsToCountry\":null,\"_links\":{\"self\":{\"href\":\"https:\\/\\/api.mollie.com\\/v2\\/payments\\/tr_52gw3useaj\",\"type\":\"application\\/hal+json\"},\"dashboard\":{\"href\":\"https:\\/\\/www.mollie.com\\/dashboard\\/org_6529881\\/payments\\/tr_52gw3useaj\",\"type\":\"text\\/html\"},\"changePaymentState\":{\"href\":\"https:\\/\\/www.mollie.com\\/paymentscreen\\/testmode\\/?method=creditcard&token=2.z45c6r\",\"type\":\"text\\/html\"},\"documentation\":{\"href\":\"https:\\/\\/docs.mollie.com\\/reference\\/v2\\/payments-api\\/get-payment\",\"type\":\"text\\/html\"}},\"_embedded\":null,\"isCancelable\":null,\"amountCaptured\":null,\"applicationFee\":null,\"authorizedAt\":null,\"expiredAt\":null,\"customerId\":null,\"countryCode\":\"BD\"}', '{\"id\":1,\"language_id\":169,\"is_shop\":1,\"is_ticket\":1,\"is_user_panel\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"right\",\"base_currency_rate\":\"1.00\",\"tax\":\"5.00\",\"is_facebook_login\":1,\"facebook_app_id\":\"211657824026859\",\"facebook_app_secret\":\"72e2d5c729f4116ae69b37544efcf588\",\"is_google_login\":1,\"google_client_id\":\"81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com\",\"google_client_secret\":\"otutovHmfl4eFj8WZVq0sYNz\",\"product_guest_checkout\":1,\"product_rating_system\":1,\"package_guest_checkout\":0,\"timezone\":\"Europe\\/Andorra\",\"recurring_billing\":1,\"expiration_reminder\":3,\"preloader_status\":0,\"preloader\":\"604da366b8e8e.gif\",\"course_title\":\"Courses\",\"course_subtitle\":\"Choose From Our Amazing Courses\",\"course_details_title\":\"Course Details\",\"is_course\":1,\"knowledgebase_title\":\"Knowledgebase\",\"knowledgebase_subtitle\":\"Find Answers Before Asking\",\"knowledgebase_details_title\":\"Knowledgebase Details\",\"donation_guest_checkout\":1,\"is_donation\":1,\"is_event\":1,\"event_guest_checkout\":1,\"service_category\":1,\"catalog_mode\":0,\"is_course_rating\":1,\"push_notification_icon\":\"605ac7a0f0810.png\",\"contact_addresses\":\"House - 44, Road - 03, Sector - 11, Uttara, Dhaka\\r\\nDhanmondi, Dhaka\\r\\nMohammadpur, Dhaka\",\"contact_numbers\":\"+123 366 892, +991 2336 255, +064 26 622 62\",\"contact_mails\":\"contact@example.com,inquiry@example.com, questions@example.com\",\"latitude\":\"23.8754443686446\",\"longitude\":\"90.39318192382245\",\"map_zoom\":16,\"home_page_pagebuilder\":1,\"custom_page_pagebuilder\":1,\"is_whatsapp\":1,\"whatsapp_number\":\"+12025550147\",\"whatsapp_header_title\":\"Welcome to PlusAgency\",\"whatsapp_popup_message\":\"Admin can also disable WhatsApp Chat\\r\\n& enable Tawk.to chat\\r\\n(Admin can set any message here)\",\"whatsapp_popup\":1,\"client_feedback_title\":\"\",\"client_feedback_subtitle\":\"\",\"faq_category_status\":1,\"gallery_category_status\":1,\"package_category_status\":1}', 13, '2021-04-24 04:31:56', '2021-04-24 04:31:56'),
(56, 26, 'anonymous', 'anoymous', 'anoymous', '50.00', 'USD', 'right', '$', 'left', 'Stripe', '6083d82442221', 'Success', NULL, '{\"id\":\"ch_1IjgwrJlIV5dN9n7UHtV7bSo\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_1IjgwrJlIV5dN9n7dtL04Vpj\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"Stripe\",\"captured\":true,\"created\":1619253285,\"currency\":\"usd\",\"customer\":null,\"description\":\"Your donation make someone day awesome\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":10,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1IjgwqJlIV5dN9n7GIqTlSY1\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":12,\"exp_year\":2023,\"fingerprint\":\"WXDgVUSzrY61Nnm6\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/acct_1Azeo3JlIV5dN9n7\\/ch_1IjgwrJlIV5dN9n7UHtV7bSo\\/rcpt_JMPmOwznj43j8btiY37xcFSvgV2xSuT\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_1IjgwrJlIV5dN9n7UHtV7bSo\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1IjgwqJlIV5dN9n7GIqTlSY1\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":12,\"exp_year\":2023,\"fingerprint\":\"WXDgVUSzrY61Nnm6\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', '{\"id\":1,\"language_id\":169,\"is_shop\":1,\"is_ticket\":1,\"is_user_panel\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"right\",\"base_currency_rate\":\"1.00\",\"tax\":\"5.00\",\"is_facebook_login\":1,\"facebook_app_id\":\"211657824026859\",\"facebook_app_secret\":\"72e2d5c729f4116ae69b37544efcf588\",\"is_google_login\":1,\"google_client_id\":\"81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com\",\"google_client_secret\":\"otutovHmfl4eFj8WZVq0sYNz\",\"product_guest_checkout\":1,\"product_rating_system\":1,\"package_guest_checkout\":0,\"timezone\":\"Europe\\/Andorra\",\"recurring_billing\":1,\"expiration_reminder\":3,\"preloader_status\":0,\"preloader\":\"604da366b8e8e.gif\",\"course_title\":\"Courses\",\"course_subtitle\":\"Choose From Our Amazing Courses\",\"course_details_title\":\"Course Details\",\"is_course\":1,\"knowledgebase_title\":\"Knowledgebase\",\"knowledgebase_subtitle\":\"Find Answers Before Asking\",\"knowledgebase_details_title\":\"Knowledgebase Details\",\"donation_guest_checkout\":1,\"is_donation\":1,\"is_event\":1,\"event_guest_checkout\":1,\"service_category\":1,\"catalog_mode\":0,\"is_course_rating\":1,\"push_notification_icon\":\"605ac7a0f0810.png\",\"contact_addresses\":\"House - 44, Road - 03, Sector - 11, Uttara, Dhaka\\r\\nDhanmondi, Dhaka\\r\\nMohammadpur, Dhaka\",\"contact_numbers\":\"+123 366 892, +991 2336 255, +064 26 622 62\",\"contact_mails\":\"contact@example.com,inquiry@example.com, questions@example.com\",\"latitude\":\"23.8754443686446\",\"longitude\":\"90.39318192382245\",\"map_zoom\":16,\"home_page_pagebuilder\":1,\"custom_page_pagebuilder\":1,\"is_whatsapp\":1,\"whatsapp_number\":\"+12025550147\",\"whatsapp_header_title\":\"Welcome to PlusAgency\",\"whatsapp_popup_message\":\"Admin can also disable WhatsApp Chat\\r\\n& enable Tawk.to chat\\r\\n(Admin can set any message here)\",\"whatsapp_popup\":1,\"client_feedback_title\":\"\",\"client_feedback_subtitle\":\"\",\"faq_category_status\":1,\"gallery_category_status\":1,\"package_category_status\":1}', 13, '2021-04-24 04:34:44', '2021-04-24 04:34:44'),
(57, 26, 'John', 'user@gmail.com', '2723724', '50.00', 'USD', 'right', '$', 'left', 'Stripe', '6083d8448d278', 'Success', NULL, '{\"id\":\"ch_1IjgxNJlIV5dN9n7XQGWTgQT\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_1IjgxOJlIV5dN9n7PF0YFydr\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"Stripe\",\"captured\":true,\"created\":1619253317,\"currency\":\"usd\",\"customer\":null,\"description\":\"Your donation make someone day awesome\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":45,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1IjgxNJlIV5dN9n7frEaYhnL\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":12,\"exp_year\":2023,\"fingerprint\":\"WXDgVUSzrY61Nnm6\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/acct_1Azeo3JlIV5dN9n7\\/ch_1IjgxNJlIV5dN9n7XQGWTgQT\\/rcpt_JMPmEoBe0V9L549tgPB1oIFNnGOzQ04\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_1IjgxNJlIV5dN9n7XQGWTgQT\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1IjgxNJlIV5dN9n7frEaYhnL\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":12,\"exp_year\":2023,\"fingerprint\":\"WXDgVUSzrY61Nnm6\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', '{\"id\":1,\"language_id\":169,\"is_shop\":1,\"is_ticket\":1,\"is_user_panel\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"right\",\"base_currency_rate\":\"1.00\",\"tax\":\"5.00\",\"is_facebook_login\":1,\"facebook_app_id\":\"211657824026859\",\"facebook_app_secret\":\"72e2d5c729f4116ae69b37544efcf588\",\"is_google_login\":1,\"google_client_id\":\"81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com\",\"google_client_secret\":\"otutovHmfl4eFj8WZVq0sYNz\",\"product_guest_checkout\":1,\"product_rating_system\":1,\"package_guest_checkout\":0,\"timezone\":\"Europe\\/Andorra\",\"recurring_billing\":1,\"expiration_reminder\":3,\"preloader_status\":0,\"preloader\":\"604da366b8e8e.gif\",\"course_title\":\"Courses\",\"course_subtitle\":\"Choose From Our Amazing Courses\",\"course_details_title\":\"Course Details\",\"is_course\":1,\"knowledgebase_title\":\"Knowledgebase\",\"knowledgebase_subtitle\":\"Find Answers Before Asking\",\"knowledgebase_details_title\":\"Knowledgebase Details\",\"donation_guest_checkout\":1,\"is_donation\":1,\"is_event\":1,\"event_guest_checkout\":1,\"service_category\":1,\"catalog_mode\":0,\"is_course_rating\":1,\"push_notification_icon\":\"605ac7a0f0810.png\",\"contact_addresses\":\"House - 44, Road - 03, Sector - 11, Uttara, Dhaka\\r\\nDhanmondi, Dhaka\\r\\nMohammadpur, Dhaka\",\"contact_numbers\":\"+123 366 892, +991 2336 255, +064 26 622 62\",\"contact_mails\":\"contact@example.com,inquiry@example.com, questions@example.com\",\"latitude\":\"23.8754443686446\",\"longitude\":\"90.39318192382245\",\"map_zoom\":16,\"home_page_pagebuilder\":1,\"custom_page_pagebuilder\":1,\"is_whatsapp\":1,\"whatsapp_number\":\"+12025550147\",\"whatsapp_header_title\":\"Welcome to PlusAgency\",\"whatsapp_popup_message\":\"Admin can also disable WhatsApp Chat\\r\\n& enable Tawk.to chat\\r\\n(Admin can set any message here)\",\"whatsapp_popup\":1,\"client_feedback_title\":\"\",\"client_feedback_subtitle\":\"\",\"faq_category_status\":1,\"gallery_category_status\":1,\"package_category_status\":1}', 13, '2021-04-24 04:35:16', '2021-04-24 04:35:16'),
(58, 26, 'John', 'user@gmail.com', '2723724', '500.00', 'NGN', 'right', '$', 'left', 'Paystack', '618a19b997633', 'Success', NULL, '\"3usgvvzs8p\"', '{\"id\":1,\"language_id\":169,\"is_shop\":1,\"is_ticket\":1,\"is_user_panel\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"NGN\",\"base_currency_text_position\":\"right\",\"base_currency_rate\":\"362.00\",\"tax\":\"5.00\",\"is_facebook_login\":1,\"facebook_app_id\":\"211657824026859\",\"facebook_app_secret\":\"72e2d5c729f4116ae69b37544efcf588\",\"is_google_login\":1,\"google_client_id\":\"81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com\",\"google_client_secret\":\"otutovHmfl4eFj8WZVq0sYNz\",\"product_guest_checkout\":1,\"product_rating_system\":1,\"package_guest_checkout\":0,\"timezone\":\"Europe\\/Andorra\",\"recurring_billing\":1,\"expiration_reminder\":3,\"preloader_status\":1,\"preloader\":\"604da366b8e8e.gif\",\"course_title\":\"Courses\",\"course_subtitle\":\"Choose From Our Amazing Courses\",\"course_details_title\":\"Course Details\",\"is_course\":1,\"knowledgebase_title\":\"Knowledgebase\",\"knowledgebase_subtitle\":\"Find Answers Before Asking\",\"knowledgebase_details_title\":\"Knowledgebase Details\",\"donation_guest_checkout\":0,\"is_donation\":1,\"is_event\":1,\"event_guest_checkout\":1,\"service_category\":1,\"catalog_mode\":0,\"is_course_rating\":1,\"push_notification_icon\":\"605ac7a0f0810.png\",\"contact_addresses\":\"House - 44, Road - 03, Sector - 11, Uttara, Dhaka\\r\\nDhanmondi, Dhaka\\r\\nMohammadpur, Dhaka\",\"contact_numbers\":\"+123 366 892, +991 2336 255, +064 26 622 62\",\"contact_mails\":\"contact@example.com,inquiry@example.com, questions@example.com\",\"latitude\":\"23.8754443686446\",\"longitude\":\"90.39318192382245\",\"map_zoom\":16,\"home_page_pagebuilder\":0,\"custom_page_pagebuilder\":1,\"is_whatsapp\":1,\"whatsapp_number\":\"+12025550147\",\"whatsapp_header_title\":\"Welcome to PlusAgency\",\"whatsapp_popup_message\":\"Admin can also disable WhatsApp Chat\\r\\n& enable Tawk.to chat\\r\\n(Admin can set any message here)\",\"whatsapp_popup\":1,\"client_feedback_title\":\"Client Feedback\",\"client_feedback_subtitle\":\"Feel Free to Leave us Some Suggestions\",\"faq_category_status\":1,\"gallery_category_status\":1,\"package_category_status\":1}', 13, '2021-11-09 01:48:25', '2021-11-09 01:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email_type` varchar(100) DEFAULT NULL,
  `email_subject` text DEFAULT NULL,
  `email_body` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`) VALUES
(1, 'email_verification', 'Verify Your Email', '<p style=\"line-height: 1.6;\">Hello<b> {customer_username}</b>,</p><p style=\"line-height: 1.6;\"><br></p><p style=\"line-height: 1.6;\">Welcome to&nbsp;<span style=\"font-size: medium;\"><b>{website_title}</b>.</span><br>Please click the link below to verify your email.</p><p>{verification_link}</p><p><br></p><p>Best Regards,</p><p>{website_title}</p>'),
(2, 'product_order', 'Order has been placed', '<p style=\"line-height: 1.6;\">Hello {customer_name},</p><p style=\"line-height: 1.6;\"><br>Your order has been placed successfully. We have attached an invoice in this mail.<br>Order Number: #{order_number}</p><p><br>Please click on the below link to see your order details.<br>{order_link}</p><p><br></p><p>Best Regards,<br>{website_title}</p>'),
(3, 'package_subscription', 'Package Subscription Successful', '<p style=\"line-height: 2;\">Hello {customer_name},</p><p style=\"line-height: 1;\">You have successfully subscribed to <b>{package_name} </b>package.</p><p style=\"line-height: 1;\"><b>Activation Date:</b> {activation_date}</p><p style=\"line-height: 1;\"><b>Expire Date:</b> {expire_date}</p><p style=\"line-height: 2;\">We have also attached an invoice with this email.</p><p style=\"line-height: 1.2;\">Best Regards,</p><p style=\"line-height: 1.2;\">{website_title}</p>'),
(4, 'package_order', 'Package Ordered Successfully', '<p style=\"line-height: 3;\">Hello {customer_name},</p><p style=\"line-height: 1.6;\">You have placed order for {package_name}.&nbsp;<br>Order Number: #{order_number}</p><p>{order_link}</p><p>We have also attached an invoice with this mail.</p><p><br></p><p>Best Regards,<br>{website_title}</p>'),
(5, 'course_enroll', 'Enrolled Course Successfully', '<p style=\"line-height: 1.6;\">Hello {customer_name},</p><p style=\"line-height: 1.6;\"><br>You have enrolled successfully to <b>{course_name}</b> course.<br>Order Number: #{order_number}</p><p><br>Please click on the below link to see your order details.<br>{order_link}</p><p><br></p><p>Best Regards,<br>{website_title}</p>'),
(6, 'donation', 'Donated Successfully', '<p style=\"line-height: 1.6;\">Hello,</p><p style=\"line-height: 1.6;\"><br>You have donated successfully for <b>{cause_name}</b></p><p style=\"line-height: 1.6;\">We have also attached an invoice with this mail.</p><p><br></p><p>Best Regards,<br>{website_title}</p>'),
(7, 'event_ticket', 'Ticket Booked Successfully', '<p style=\"line-height: 1.6;\">Hello {customer_name},</p><p style=\"line-height: 1.6;\"><br>Your order has been placed successfully. We have attached the ticket with this mail.</p><p style=\"line-height: 1.6;\"><b>Event Name: {event_name}</b><br>Ticket ID: #{ticket_id}</p><p><br>Please click on the below link to see your order details.<br>{order_link}</p><p><br></p><p>Best Regards,<br>{website_title}</p>'),
(8, 'subscription_expiry_reminder', 'Your Subscription is about to Expire', '<p>Hello {customer_name},<br><br>Your subscription is about to expire.<br>You have only <strong>{remaining_days} days</strong> remaining.<br>Please extend your current package / change to new one.<br><strong>Current Package:</strong> {current_package_name}<br><strong>Expire Date: </strong>{expire_date}<br><br>Best Regards,</p><p>{website_title}</p>'),
(9, 'subscription_expired', 'Your Subscription is expired', '<p>Hello {customer_name},<br><br>Your subscription is expired<br>Please purchase a package to continue the subscription.</p><p>{packages_link}<br><strong>Expired Package:</strong> {expired_package}<br><strong>Expire Date: </strong>{expire_date}<br><br>Best Regards,</p><p>{website_title}</p>');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `cost` double NOT NULL,
  `available_tickets` int(11) NOT NULL,
  `organizer` varchar(255) NOT NULL,
  `organizer_email` varchar(255) DEFAULT NULL,
  `organizer_phone` varchar(255) DEFAULT NULL,
  `organizer_website` text DEFAULT NULL,
  `venue` longtext NOT NULL,
  `venue_location` longtext DEFAULT NULL,
  `venue_phone` varchar(255) DEFAULT NULL,
  `meta_tags` longtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image`)),
  `video` longtext DEFAULT NULL,
  `lang_id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `slug`, `content`, `date`, `time`, `cost`, `available_tickets`, `organizer`, `organizer_email`, `organizer_phone`, `organizer_website`, `venue`, `venue_location`, `venue_phone`, `meta_tags`, `meta_description`, `image`, `video`, `lang_id`, `cat_id`, `created_at`, `updated_at`) VALUES
(8, 'The BOPSers 16th Annual Black History Month Event', 'The-BOPSers-16th-Annual-Black-History-Month-Event', '<p style=\"line-height: 1.6;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><font color=\"#636363\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</font></span><br></p>', '2024-03-27', '12:15:00', 45, 100000, 'Demo Organizer', 'organize@gmail.com', '236237237', 'http://example.com/', 'California', 'California, USA', '3478348233', 'Event,California', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making', '[\"603098e2edb8e.jpg\",\"603098e32f2a4.jpg\",\"6030a370be32f.jpg\",\"6030a37118b3f.jpg\",\"6030a38abf552.jpg\"]', 'event-601e3309793e5.mp4', 169, 10, '2021-02-05 13:11:46', '2021-02-19 12:58:11'),
(24, 'Virtual Royall House and Slave Quarters Tour: Premiere and Discussion', 'Virtual-Royall-House-and-Slave-Quarters-Tour:-Premiere-and-Discussion', '<p style=\"line-height: 1.6;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><font color=\"#636363\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</font></span><br></p>', '2024-03-27', '12:15:00', 40, 99998, 'Demo Organizer', 'organize@gmail.com', '236237237', 'http://example.com/', 'California', 'California, USA', '3478348233', 'Event,California', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making', '[\"603098e32f2a4.jpg\",\"603098e2edb8e.jpg\",\"6030a370be32f.jpg\",\"6030a37118b3f.jpg\",\"6030a38abf552.jpg\"]', 'event-601e3309793e5.mp4', 169, 10, '2021-02-05 13:11:46', '2021-11-09 05:52:14'),
(25, 'Joy & Connection - with Chude Jideonwo', 'Joy-&-Connection---with-Chude-Jideonwo', '<p style=\"line-height: 1.6;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><font color=\"#636363\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</font></span><br></p>', '2024-03-27', '12:15:00', 30, 100000, 'Demo Organizer', 'organize@gmail.com', '236237237', 'http://example.com/', 'California', 'California, USA', '3478348233', 'Event,California', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making', '[\"6030a370be32f.jpg\",\"603098e2edb8e.jpg\",\"603098e32f2a4.jpg\",\"6030a37118b3f.jpg\",\"6030a38abf552.jpg\"]', 'event-601e3309793e5.mp4', 169, 9, '2021-02-05 13:11:46', '2021-02-19 12:56:27'),
(26, 'Virtual Event: Los Angeles A Cappella Festival 2021', 'Virtual-Event:-Los-Angeles-A-Cappella-Festival-2021', '<p style=\"line-height: 1.6;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><font color=\"#636363\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</font></span><br></p>', '2024-03-27', '12:15:00', 50, 99994, 'Demo Organizer', 'organize@gmail.com', '236237237', 'http://example.com/', 'California', 'California, USA', '3478348233', 'Event,California', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making', '[\"6030a38abf552.jpg\",\"603098e2edb8e.jpg\",\"603098e32f2a4.jpg\",\"6030a370be32f.jpg\",\"6030a37118b3f.jpg\"]', 'event-601e3309793e5.mp4', 169, 7, '2021-02-05 13:11:46', '2021-04-26 01:51:07'),
(31, 'The BOPSers 16th Annual Black History Month Event', 'The-BOPSers-16th-Annual-Black-History-Month-Event', '<p style=\"line-height: 1.6;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><font color=\"#636363\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</font></span><br></p>', '2024-03-27', '12:15:00', 45, 99998, 'Demo Organizer', 'organize@gmail.com', '236237237', 'http://example.com/', 'California', 'California, USA', '3478348233', 'Event,California', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making', '[\"603098e2edb8e.jpg\",\"603098e32f2a4.jpg\",\"6030a370be32f.jpg\",\"6030a37118b3f.jpg\",\"6030a38abf552.jpg\"]', 'event-601e3309793e5.mp4', 169, 10, '2021-02-05 13:11:46', '2021-02-19 14:10:25'),
(32, 'Virtual Royall House and Slave Quarters Tour: Premiere and Discussion', 'Virtual-Royall-House-and-Slave-Quarters-Tour:-Premiere-and-Discussion', '<p style=\"line-height: 1.6;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><font color=\"#636363\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</font></span><br></p>', '2024-03-27', '12:15:00', 40, 100000, 'Demo Organizer', 'organize@gmail.com', '236237237', 'http://example.com/', 'California', 'California, USA', '3478348233', 'Event,California', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making', '[\"603098e32f2a4.jpg\",\"603098e2edb8e.jpg\",\"6030a370be32f.jpg\",\"6030a37118b3f.jpg\",\"6030a38abf552.jpg\"]', 'event-601e3309793e5.mp4', 169, 10, '2021-02-05 13:11:46', '2021-02-19 12:57:16'),
(33, 'Joy & Connection - with Chude Jideonwo', 'Joy-&-Connection---with-Chude-Jideonwo', '<p style=\"line-height: 1.6;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><font color=\"#636363\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</font></span><br></p>', '2024-03-27', '12:15:00', 30, 99994, 'Demo Organizer', 'organize@gmail.com', '236237237', 'http://example.com/', 'California', 'California, USA', '3478348233', 'Event,California', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making', '[\"6030a370be32f.jpg\",\"603098e2edb8e.jpg\",\"603098e32f2a4.jpg\",\"6030a37118b3f.jpg\",\"6030a38abf552.jpg\"]', 'event-601e3309793e5.mp4', 169, 9, '2021-02-05 13:11:46', '2021-02-19 14:09:42'),
(34, 'Virtual Event: Los Angeles A Cappella Festival 2021', 'Virtual-Event:-Los-Angeles-A-Cappella-Festival-2021', '<p style=\"line-height: 1.6;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><font color=\"#636363\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</font></span><br></p>', '2024-03-27', '12:15:00', 50, 99998, 'Demo Organizer', 'organize@gmail.com', '236237237', 'http://example.com/', 'California', 'California, USA', '3478348233', 'Event,California', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making', '[\"6030a38abf552.jpg\",\"603098e2edb8e.jpg\",\"603098e32f2a4.jpg\",\"6030a370be32f.jpg\",\"6030a37118b3f.jpg\"]', 'event-601e3309793e5.mp4', 169, 7, '2021-02-05 13:11:46', '2021-03-21 00:12:52'),
(61, 'Joy & Connection - with Chude Jideonwou', 'Joy-&-Connection---with-Chude-Jideonwou', '<p>zdmd</p>', '2021-03-13', '21:59:00', 33, 18, 'Organizer Name', NULL, NULL, NULL, 'California', NULL, NULL, NULL, NULL, '[\"605d70e69e0f0.jpg\",\"605d70e6a4e25.jpg\",\"605d70e6a8875.jpg\"]', 'http://localhost/plusagency/plusagency-3.1/core/storage/app/public/files/shares/videos/Earth.mp4', 169, 9, '2021-03-16 09:55:38', '2021-04-16 05:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `event_categories`
--

CREATE TABLE `event_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `lang_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_categories`
--

INSERT INTO `event_categories` (`id`, `name`, `slug`, `status`, `lang_id`, `created_at`, `updated_at`) VALUES
(7, 'Concert', 'Concert', '1', 169, '2021-02-05 16:57:35', '2021-02-19 19:09:21'),
(9, 'Conference', 'Conference', '1', 169, '2021-02-05 19:10:56', '2021-02-05 19:10:56'),
(10, 'Seminar', 'Seminar', '1', 169, '2021-02-19 18:31:24', '2021-02-19 18:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `event_details`
--

CREATE TABLE `event_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT 'anonymous',
  `email` varchar(255) DEFAULT 'anonymous',
  `phone` varchar(255) DEFAULT 'xxxxxxxxxxxx',
  `amount` double NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `currency` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `receipt` longtext DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `transaction_details` longtext DEFAULT NULL,
  `bex_details` longtext DEFAULT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_details`
--

INSERT INTO `event_details` (`id`, `user_id`, `name`, `email`, `phone`, `amount`, `quantity`, `currency`, `currency_symbol`, `payment_method`, `transaction_id`, `status`, `receipt`, `invoice`, `transaction_details`, `bex_details`, `event_id`, `created_at`, `updated_at`) VALUES
(58, 26, 'Tom', 'user@gmail.com', '47347348', 100, 2, 'USD', '$', 'Mollie Payment', '607d4dc0b3196', 'Success', NULL, 'Event#607d4dc0b3196.pdf', '{\"resource\":\"payment\",\"id\":\"tr_8JTkNPjg9g\",\"mode\":\"test\",\"amount\":{\"value\":\"100.00\",\"currency\":\"USD\"},\"settlementAmount\":{\"value\":\"80.68\",\"currency\":\"EUR\"},\"amountRefunded\":{\"value\":\"0.00\",\"currency\":\"USD\"},\"amountRemaining\":{\"value\":\"100.00\",\"currency\":\"USD\"},\"amountChargedBack\":null,\"description\":\"You are purchasing an event ticket\",\"method\":\"creditcard\",\"status\":\"paid\",\"createdAt\":\"2021-04-19T09:30:31+00:00\",\"paidAt\":\"2021-04-19T09:30:39+00:00\",\"canceledAt\":null,\"expiresAt\":null,\"failedAt\":null,\"dueDate\":null,\"billingEmail\":null,\"profileId\":\"pfl_wWVQgHa2jS\",\"sequenceType\":\"oneoff\",\"redirectUrl\":\"http:\\/\\/localhost\\/plusagency\\/plusagency-3.1\\/cause\\/mollie\\/success\",\"webhookUrl\":null,\"mandateId\":null,\"subscriptionId\":null,\"orderId\":null,\"settlementId\":null,\"locale\":null,\"metadata\":null,\"details\":{\"cardNumber\":\"6787\",\"cardHolder\":\"T. TEST\",\"cardAudience\":\"consumer\",\"cardLabel\":\"Mastercard\",\"cardCountryCode\":\"NL\",\"cardSecurity\":\"normal\",\"feeRegion\":\"other\"},\"restrictPaymentMethodsToCountry\":null,\"_links\":{\"self\":{\"href\":\"https:\\/\\/api.mollie.com\\/v2\\/payments\\/tr_8JTkNPjg9g\",\"type\":\"application\\/hal+json\"},\"dashboard\":{\"href\":\"https:\\/\\/www.mollie.com\\/dashboard\\/org_6529881\\/payments\\/tr_8JTkNPjg9g\",\"type\":\"text\\/html\"},\"changePaymentState\":{\"href\":\"https:\\/\\/www.mollie.com\\/paymentscreen\\/testmode\\/?method=creditcard&token=2.ldmfs4\",\"type\":\"text\\/html\"},\"documentation\":{\"href\":\"https:\\/\\/docs.mollie.com\\/reference\\/v2\\/payments-api\\/get-payment\",\"type\":\"text\\/html\"}},\"_embedded\":null,\"isCancelable\":null,\"amountCaptured\":null,\"applicationFee\":null,\"authorizedAt\":null,\"expiredAt\":null,\"customerId\":null,\"countryCode\":\"BD\"}', '{\"id\":1,\"language_id\":169,\"is_shop\":1,\"is_ticket\":1,\"is_user_panel\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"right\",\"base_currency_rate\":\"1.00\",\"tax\":\"5.00\",\"is_facebook_login\":1,\"facebook_app_id\":\"211657824026859\",\"facebook_app_secret\":\"72e2d5c729f4116ae69b37544efcf588\",\"is_google_login\":1,\"google_client_id\":\"81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com\",\"google_client_secret\":\"otutovHmfl4eFj8WZVq0sYNz\",\"product_guest_checkout\":1,\"product_rating_system\":1,\"package_guest_checkout\":0,\"timezone\":\"Europe\\/Andorra\",\"recurring_billing\":1,\"expiration_reminder\":3,\"preloader_status\":0,\"preloader\":\"604da366b8e8e.gif\",\"course_title\":\"Courses\",\"course_subtitle\":\"Choose From Our Amazing Courses\",\"course_details_title\":\"Course Details\",\"is_course\":1,\"knowledgebase_title\":\"Knowledgebase\",\"knowledgebase_subtitle\":\"Find Answers Before Asking\",\"knowledgebase_details_title\":\"Knowledgebase Details\",\"donation_guest_checkout\":1,\"is_donation\":1,\"is_event\":1,\"event_guest_checkout\":1,\"service_category\":1,\"catalog_mode\":0,\"is_course_rating\":1,\"push_notification_icon\":\"605ac7a0f0810.png\",\"contact_addresses\":\"House - 44, Road - 03, Sector - 11, Uttara, Dhaka\\r\\nDhanmondi, Dhaka\\r\\nMohammadpur, Dhaka\",\"contact_numbers\":\"+123 366 892, +991 2336 255, +064 26 622 62\",\"contact_mails\":\"contact@example.com,inquiry@example.com, questions@example.com\",\"latitude\":\"23.8754443686446\",\"longitude\":\"90.39318192382245\",\"map_zoom\":16,\"home_page_pagebuilder\":0,\"custom_page_pagebuilder\":1,\"is_whatsapp\":1,\"whatsapp_number\":\"+12025550147\",\"whatsapp_header_title\":\"Welcome to PlusAgency\",\"whatsapp_popup_message\":\"Admin can also disable WhatsApp Chat\\r\\n& enable Tawk.to chat\\r\\n(Admin can set any message here)\",\"whatsapp_popup\":1}', 26, '2021-04-19 05:30:40', '2021-04-19 05:30:40'),
(59, 26, 'John', 'user@gmail.com', '2723724', 100, 2, 'USD', '$', 'Mollie Payment', '608654cbec3eb', 'Success', NULL, 'Event#608654cbec3eb.pdf', '{\"resource\":\"payment\",\"id\":\"tr_uWMaxVzADK\",\"mode\":\"test\",\"amount\":{\"value\":\"100.00\",\"currency\":\"USD\"},\"settlementAmount\":{\"value\":\"80.11\",\"currency\":\"EUR\"},\"amountRefunded\":{\"value\":\"0.00\",\"currency\":\"USD\"},\"amountRemaining\":{\"value\":\"100.00\",\"currency\":\"USD\"},\"amountChargedBack\":null,\"description\":\"You are purchasing an event ticket\",\"method\":\"creditcard\",\"status\":\"paid\",\"createdAt\":\"2021-04-26T05:50:42+00:00\",\"paidAt\":\"2021-04-26T05:51:06+00:00\",\"canceledAt\":null,\"expiresAt\":null,\"failedAt\":null,\"dueDate\":null,\"billingEmail\":null,\"profileId\":\"pfl_wWVQgHa2jS\",\"sequenceType\":\"oneoff\",\"redirectUrl\":\"http:\\/\\/localhost\\/plusagency\\/plusagency-3.1\\/cause\\/mollie\\/success\",\"webhookUrl\":null,\"mandateId\":null,\"subscriptionId\":null,\"orderId\":null,\"settlementId\":null,\"locale\":null,\"metadata\":null,\"details\":{\"cardNumber\":\"6787\",\"cardHolder\":\"T. TEST\",\"cardAudience\":\"consumer\",\"cardLabel\":\"Mastercard\",\"cardCountryCode\":\"NL\",\"cardSecurity\":\"normal\",\"feeRegion\":\"other\"},\"restrictPaymentMethodsToCountry\":null,\"_links\":{\"self\":{\"href\":\"https:\\/\\/api.mollie.com\\/v2\\/payments\\/tr_uWMaxVzADK\",\"type\":\"application\\/hal+json\"},\"dashboard\":{\"href\":\"https:\\/\\/www.mollie.com\\/dashboard\\/org_6529881\\/payments\\/tr_uWMaxVzADK\",\"type\":\"text\\/html\"},\"changePaymentState\":{\"href\":\"https:\\/\\/www.mollie.com\\/paymentscreen\\/testmode\\/?method=creditcard&token=2.jbt2w1\",\"type\":\"text\\/html\"},\"documentation\":{\"href\":\"https:\\/\\/docs.mollie.com\\/reference\\/v2\\/payments-api\\/get-payment\",\"type\":\"text\\/html\"}},\"_embedded\":null,\"isCancelable\":null,\"amountCaptured\":null,\"applicationFee\":null,\"authorizedAt\":null,\"expiredAt\":null,\"customerId\":null,\"countryCode\":\"BD\"}', '{\"id\":1,\"language_id\":169,\"is_shop\":1,\"is_ticket\":1,\"is_user_panel\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"USD\",\"base_currency_text_position\":\"right\",\"base_currency_rate\":\"1.00\",\"tax\":\"5.00\",\"is_facebook_login\":1,\"facebook_app_id\":\"211657824026859\",\"facebook_app_secret\":\"72e2d5c729f4116ae69b37544efcf588\",\"is_google_login\":1,\"google_client_id\":\"81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com\",\"google_client_secret\":\"otutovHmfl4eFj8WZVq0sYNz\",\"product_guest_checkout\":1,\"product_rating_system\":1,\"package_guest_checkout\":0,\"timezone\":\"Europe\\/Andorra\",\"recurring_billing\":1,\"expiration_reminder\":3,\"preloader_status\":0,\"preloader\":\"604da366b8e8e.gif\",\"course_title\":\"Courses\",\"course_subtitle\":\"Choose From Our Amazing Courses\",\"course_details_title\":\"Course Details\",\"is_course\":1,\"knowledgebase_title\":\"Knowledgebase\",\"knowledgebase_subtitle\":\"Find Answers Before Asking\",\"knowledgebase_details_title\":\"Knowledgebase Details\",\"donation_guest_checkout\":1,\"is_donation\":1,\"is_event\":1,\"event_guest_checkout\":1,\"service_category\":1,\"catalog_mode\":0,\"is_course_rating\":1,\"push_notification_icon\":\"605ac7a0f0810.png\",\"contact_addresses\":\"House - 44, Road - 03, Sector - 11, Uttara, Dhaka\\r\\nDhanmondi, Dhaka\\r\\nMohammadpur, Dhaka\",\"contact_numbers\":\"+123 366 892, +991 2336 255, +064 26 622 62\",\"contact_mails\":\"contact@example.com,inquiry@example.com, questions@example.com\",\"latitude\":\"23.8754443686446\",\"longitude\":\"90.39318192382245\",\"map_zoom\":16,\"home_page_pagebuilder\":0,\"custom_page_pagebuilder\":1,\"is_whatsapp\":1,\"whatsapp_number\":\"+12025550147\",\"whatsapp_header_title\":\"Welcome to PlusAgency\",\"whatsapp_popup_message\":\"Admin can also disable WhatsApp Chat\\r\\n& enable Tawk.to chat\\r\\n(Admin can set any message here)\",\"whatsapp_popup\":1,\"client_feedback_title\":\"\",\"client_feedback_subtitle\":\"\",\"faq_category_status\":1,\"gallery_category_status\":1,\"package_category_status\":1}', 26, '2021-04-26 01:51:07', '2021-04-26 01:51:08'),
(60, 26, 'John', 'user@gmail.com', '2723724', 80, 2, 'NGN', '$', 'Paystack', '618a52de942f7', 'Success', NULL, 'Event#618a52de942f7.pdf', '\"wi4fwimpuk\"', '{\"id\":1,\"language_id\":169,\"is_shop\":1,\"is_ticket\":1,\"is_user_panel\":1,\"base_currency_symbol\":\"$\",\"base_currency_symbol_position\":\"left\",\"base_currency_text\":\"NGN\",\"base_currency_text_position\":\"right\",\"base_currency_rate\":\"362.00\",\"tax\":\"5.00\",\"is_facebook_login\":1,\"facebook_app_id\":\"211657824026859\",\"facebook_app_secret\":\"72e2d5c729f4116ae69b37544efcf588\",\"is_google_login\":1,\"google_client_id\":\"81856165251-i0o8lgjghadindghpk0bnr9qb6hrqo5r.apps.googleusercontent.com\",\"google_client_secret\":\"otutovHmfl4eFj8WZVq0sYNz\",\"product_guest_checkout\":1,\"product_rating_system\":1,\"package_guest_checkout\":0,\"timezone\":\"Europe\\/Andorra\",\"recurring_billing\":1,\"expiration_reminder\":3,\"preloader_status\":1,\"preloader\":\"604da366b8e8e.gif\",\"course_title\":\"Courses\",\"course_subtitle\":\"Choose From Our Amazing Courses\",\"course_details_title\":\"Course Details\",\"is_course\":1,\"knowledgebase_title\":\"Knowledgebase\",\"knowledgebase_subtitle\":\"Find Answers Before Asking\",\"knowledgebase_details_title\":\"Knowledgebase Details\",\"donation_guest_checkout\":0,\"is_donation\":1,\"is_event\":1,\"event_guest_checkout\":1,\"service_category\":1,\"catalog_mode\":0,\"is_course_rating\":1,\"push_notification_icon\":\"618a40d5b13e6.png\",\"contact_addresses\":\"House - 44, Road - 03, Sector - 11, Uttara, Dhaka\\r\\nDhanmondi, Dhaka\\r\\nMohammadpur, Dhaka\",\"contact_numbers\":\"+123 366 892, +991 2336 255, +064 26 622 62\",\"contact_mails\":\"contact@example.com,inquiry@example.com, questions@example.com\",\"latitude\":\"23.8754443686446\",\"longitude\":\"90.39318192382245\",\"map_zoom\":16,\"home_page_pagebuilder\":0,\"custom_page_pagebuilder\":1,\"is_whatsapp\":1,\"whatsapp_number\":\"+12025550147\",\"whatsapp_header_title\":\"Welcome to PlusAgency\",\"whatsapp_popup_message\":\"Admin can also disable WhatsApp Chat\\r\\n& enable Tawk.to chat\\r\\n(Admin can set any message here)\",\"whatsapp_popup\":1,\"client_feedback_title\":\"Client Feedback\",\"client_feedback_subtitle\":\"Feel Free to Leave us Some Suggestions\",\"faq_category_status\":1,\"gallery_category_status\":1,\"package_category_status\":1}', 24, '2021-11-09 05:52:14', '2021-11-09 05:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `e_governance`
--

CREATE TABLE `e_governance` (
  `id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `deleted_at` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `e_governance`
--

INSERT INTO `e_governance` (`id`, `language_id`, `image`, `title`, `url`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 169, '6641d4bd4aa3b.jpg', 'Asset Management System(AMS)', NULL, 1, NULL, '2024-05-13 08:52:13', '2024-05-13 08:52:13'),
(2, 170, '6641d4d63132a.jpg', 'मालमत्ता व्यवस्थापन प्रणाली (AMS)', NULL, 1, NULL, '2024-05-13 08:52:38', '2024-05-13 08:52:38'),
(3, 169, '6641d4e66647b.jpg', 'Human Resource Management System(HRMS)', NULL, 1, NULL, '2024-05-13 08:52:54', '2024-05-13 08:52:54'),
(4, 170, '6641d4f451005.jpg', 'मानव संसाधन व्यवस्थापन प्रणाली (HRMS)', NULL, 1, NULL, '2024-05-13 08:53:08', '2024-05-13 08:53:08'),
(5, 169, '6641d50652cb7.jpg', 'Letter And File management System(LFMS)', 'https://www.amazon.in/', 1, NULL, '2024-05-13 08:53:26', '2024-05-15 01:44:39'),
(6, 170, '6641d5125a4b3.jpg', 'पत्र आणि फाइल व्यवस्थापन प्रणाली (LFMS)', NULL, 1, NULL, '2024-05-13 08:53:38', '2024-05-13 08:53:38'),
(7, 169, '6641d525deb54.jpg', 'Integrated Infrastructure Management System(IIMS)', 'https://www.amazon.in/', 1, NULL, '2024-05-13 08:53:57', '2024-05-15 01:44:20'),
(8, 170, '6641d532e43bf.jpg', 'इंटिग्रेटेड इन्फ्रास्ट्रक्चर मॅनेजमेंट सिस्टम (IIMS)', NULL, 1, NULL, '2024-05-13 08:54:10', '2024-05-13 08:54:10'),
(9, 169, '6641d5463c25c.jpg', 'Stem-Flow Monitoring System(S-FMS)', 'http://localhost:8001/', 1, NULL, '2024-05-13 08:54:30', '2024-05-15 01:43:25'),
(10, 170, '6641d552ca6e3.jpg', 'स्टेम-फ्लो मॉनिटरिंग सिस्टम (एस-एफएमएस)', NULL, 1, NULL, '2024-05-13 08:54:42', '2024-05-13 08:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `question` varchar(255) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `serial_number` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(255) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `total_numbers` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `language_id`, `icon`, `image`, `title`, `color`, `serial_number`, `total_numbers`) VALUES
(1, 169, NULL, NULL, 'Million litres of water per day', 'FFFFFF', 1, 317),
(2, 169, NULL, NULL, 'Million People Covered', 'FFFFFF', 1, 3.5),
(3, 170, NULL, NULL, 'दररोज लाखो लिटर पाणी', 'FFFFFF', 1, 314),
(4, 170, NULL, NULL, 'दशलक्ष लोक कव्हर', 'FFFFFF', 2, 3),
(5, 169, NULL, NULL, 'Villages Watered', 'FFFFFF', 2, 33),
(6, 170, NULL, NULL, 'गावांना पाणी दिले', 'FFFFFF', 2, 33),
(7, 169, NULL, NULL, 'Seasoned Experiences', 'FFFFFF', 4, 31),
(8, 170, NULL, NULL, 'अनुभवी अनुभव', 'FFFFFF', 4, 32);

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `rating` mediumint(8) UNSIGNED NOT NULL,
  `feedback` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `language_id`, `title`, `image`, `serial_number`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 169, '', '664335d14dc7e.jpg', 1, '2024-05-14 09:58:41', '2024-05-14 09:58:41', 1),
(2, 169, '', '664335f71b961.jpg', 1, '2024-05-14 09:59:19', '2024-05-14 09:59:19', 1),
(3, 169, '', '6643360f53b25.jpg', 1, '2024-05-14 09:59:43', '2024-05-14 09:59:43', 1),
(4, 169, '', '6643366106463.jpg', 1, '2024-05-14 10:01:05', '2024-05-14 10:01:05', 1),
(5, 169, '', '6643368a257ea.jpg', 1, '2024-05-14 10:01:46', '2024-05-14 10:01:46', 1),
(6, 169, '', '664336b2473ab.jpg', 1, '2024-05-14 10:02:26', '2024-05-14 10:02:26', 1),
(7, 169, '', '664336c8178b8.jpg', 1, '2024-05-14 10:02:48', '2024-05-14 10:02:48', 1),
(8, 169, '', '664336e46cb43.jpg', 1, '2024-05-14 10:03:16', '2024-05-14 10:03:16', 1),
(9, 169, '', '664337770dc9d.jpg', 1, '2024-05-14 10:05:43', '2024-05-14 10:05:43', 3),
(10, 169, '', '66433792ec7ac.jpg', 1, '2024-05-14 10:06:11', '2024-05-14 10:06:11', 3),
(11, 169, '', '664337a673498.jpg', 1, '2024-05-14 10:06:30', '2024-05-14 10:06:30', 3),
(12, 169, '', '664337c389c44.jpg', 1, '2024-05-14 10:06:59', '2024-05-14 10:06:59', 3),
(13, 169, '', '664337ef97fa6.jpg', 1, '2024-05-14 10:07:44', '2024-05-14 10:07:44', 3),
(14, 169, '', '6643380ca6277.jpg', 1, '2024-05-14 10:08:13', '2024-05-14 10:08:13', 3),
(15, 169, '', '66433824d5155.jpg', 1, '2024-05-14 10:08:37', '2024-05-14 10:08:37', 3),
(16, 169, '', '6643384e75368.jpg', 1, '2024-05-14 10:09:18', '2024-05-14 10:09:18', 3),
(17, 169, '', '6643387a7e088.jpg', 1, '2024-05-14 10:10:02', '2024-05-14 10:10:02', 3),
(18, 169, '', '6643388f66593.jpg', 1, '2024-05-14 10:10:23', '2024-05-14 10:10:23', 3),
(19, 169, '', '664338ad9e50c.jpg', 1, '2024-05-14 10:10:54', '2024-05-14 10:10:54', 3),
(20, 169, '', '664338c24130f.jpg', 1, '2024-05-14 10:11:14', '2024-05-14 10:11:14', 3),
(21, 169, '', '664338e698886.jpg', 1, '2024-05-14 10:11:51', '2024-05-14 10:11:51', 3),
(22, 169, '', '66433adf1c912.jpg', 1, '2024-05-14 10:20:15', '2024-05-16 07:27:29', 3),
(23, 169, '', '66433b2aa3dd0.jpg', 1, '2024-05-14 10:21:31', '2024-05-14 10:21:31', 3),
(24, 169, '', '66433b5dd4a0b.jpg', 1, '2024-05-14 10:22:22', '2024-05-16 08:27:24', 1),
(28, NULL, '', '6646f9a552a13.jpg', 1, '2024-05-17 06:31:01', '2024-05-17 06:31:01', 2),
(29, NULL, '', '6646f9cbecd51.jpg', 1, '2024-05-17 06:31:40', '2024-05-17 06:31:40', 2),
(30, NULL, '', '6646fad0145a3.jpg', 1, '2024-05-17 06:36:00', '2024-05-17 06:36:00', 2),
(31, NULL, '', '6646fb79f14eb.jpg', 1, '2024-05-17 06:38:50', '2024-05-17 06:38:50', 2),
(32, NULL, '', '6646fc13d8b5f.jpg', 1, '2024-05-17 06:41:24', '2024-05-17 06:41:24', 2),
(33, NULL, '', '6646fc269b9f5.jpg', 1, '2024-05-17 06:41:43', '2024-05-17 06:41:43', 2),
(34, NULL, '', '6646fc4f4048c.jpg', 1, '2024-05-17 06:42:23', '2024-05-17 06:42:23', 2),
(35, NULL, '', '6646fc693c724.jpg', 1, '2024-05-17 06:42:49', '2024-05-17 06:42:49', 2),
(36, NULL, '', '6646fc79ee87d.jpg', 1, '2024-05-17 06:43:06', '2024-05-17 06:43:06', 2),
(37, NULL, '', '6646fd0210032.jpg', 1, '2024-05-17 06:45:22', '2024-05-17 06:45:22', 2),
(38, NULL, '', '6646fd1842489.jpg', 1, '2024-05-17 06:45:44', '2024-05-17 06:45:44', 2),
(39, NULL, '', '6646fd2d7747a.jpg', 1, '2024-05-17 06:46:05', '2024-05-17 06:46:05', 2),
(40, NULL, '', '6646fd430e7e3.jpg', 1, '2024-05-17 06:46:27', '2024-05-17 06:46:27', 2),
(41, NULL, '', '6646fd5529f89.jpg', 1, '2024-05-17 06:46:45', '2024-05-17 06:46:45', 2),
(42, NULL, '', '6646fd6844932.jpg', 1, '2024-05-17 06:47:04', '2024-05-17 06:47:04', 2),
(43, NULL, '', '6646fd7a83d42.jpg', 1, '2024-05-17 06:47:22', '2024-05-17 06:47:22', 2);

-- --------------------------------------------------------

--
-- Table structure for table `gallery_categories`
--

CREATE TABLE `gallery_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `name_mr` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `serial_number` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_categories`
--

INSERT INTO `gallery_categories` (`id`, `language_id`, `name`, `name_mr`, `slug`, `status`, `serial_number`, `created_at`, `updated_at`) VALUES
(1, 169, '13th Foundation Day Celebration', '13 वा स्थापना दिन सोहळा', '13th-foundation-day-celebration-9951', 1, 1, '2024-05-16 08:09:06', '2024-05-16 08:09:06'),
(2, 169, '53th NATIONAL SAFETY WEEK CAMPAIGN', '५३ वा राष्ट्रीय सुरक्षा सप्ताह मोहीम', '53th-national-safety-week-campaign-1985', 1, 1, '2024-05-16 08:09:48', '2024-05-16 08:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `years` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `language_id`, `image`, `years`, `title`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 169, '6641d8d83d495.jpg', '1980', 'Inception to Impact: Our Water Supply Legacy Since 1980', 'Our journey began in 1980 when the Maharashtra Water Supply & Sewerage Board (MWSSB) initiated the Maharashtra Water Supply & Sewerage Project Stage-I. Since then, we have been entrusted with the operation and maintenance of the Shahad Temghar Water Works, serving six towns and 104 villages in the northern zone.', 1, NULL, '2024-05-13 09:09:44', '2024-05-13 09:09:44'),
(2, 170, '6641d90236a46.jpg', '1980', 'प्रभावाची सुरुवात: 1980 पासून आमचा पाणीपुरवठ्याचा वारसा', 'आमचा प्रवास 1980 मध्ये महाराष्ट्र पाणी पुरवठा आणि मलनिस्सारण ​​मंडळाने (MWSSB) महाराष्ट्र पाणीपुरवठा आणि मलनिस्सारण ​​प्रकल्प टप्पा-I सुरू केला तेव्हा सुरू झाला. तेव्हापासून, आमच्याकडे शहाड टेमघर वॉटर वर्क्सचे संचालन आणि देखभाल करण्याची जबाबदारी सोपविण्यात आली आहे, जी उत्तर विभागातील सहा शहरे आणि 104 गावांना सेवा देत आहे.', 1, NULL, '2024-05-13 09:10:26', '2024-05-13 09:10:26'),
(3, 169, '6641d92280a7c.jpg', '2000', 'The Genesis of STEM: Shaping Water Supply History in 2000', 'On March 3, 2000, Thane Municipal Corporation, Bhiwandi Nizampur City (formerly known as Municipal Council), and Mira-Bhayander Municipal Corporation (formerly known as Municipal Council) jointly entered into a Memorandum of Understanding (MoU) to establish the Maharashtra Water Supply and Sewerage Board under Section 32 of the Maharashtra Municipal Corporations Act, 1949. On March 23, 2000, the Maharashtra Jeevan Pradhikaran transferred the existing water supply scheme to Shahad Temghar Water Supply Authority (STEM).', 1, NULL, '2024-05-13 09:10:58', '2024-05-13 09:10:58'),
(4, 170, '6641d93d2b3f4.jpg', '2000', 'द जेनेसिस ऑफ स्टेम: शेपिंग वॉटर सप्लाय हिस्ट्री इन 2000', '3 मार्च 2000 रोजी, ठाणे महानगरपालिका, भिवंडी निजामपूर शहर (पूर्वी नगर परिषद म्हणून ओळखले जाणारे) आणि मीरा-भाईंदर महानगरपालिका (पूर्वी नगर परिषद म्हणून ओळखले जाणारे) यांनी संयुक्तपणे महाराष्ट्र पाणीपुरवठा स्थापन करण्यासाठी सामंजस्य करार (एमओयू) केला. आणि सीवरेज बोर्ड महाराष्ट्र महानगरपालिका अधिनियम, 1949 च्या कलम 32 अंतर्गत. 23 मार्च 2000 रोजी, महाराष्ट्र जीवन प्राधिकरणाने विद्यमान पाणीपुरवठा योजना शहाड टेमघर पाणीपुरवठा प्राधिकरणाकडे (STEM) हस्तांतरित केली.', 1, NULL, '2024-05-13 09:11:25', '2024-05-13 09:11:25'),
(5, 169, '6641d95f485b2.jpg', '2010', 'Crafting Our Licit Governance Framework', 'Our legal status and organizational structure were established through the collective efforts of Thane Municipal Corporation, Thane, Mira-Bhayander Municipal Corporation, Bhayander, Bhiwandi Nizampur City (formerly known as Municipal Council), Bhiwandi, and Thane Zilla Parishad, Thane. A pivotal resolution was passed during their respective general meetings.Following Government Decision No. PAPUYOHA (पापुयो)-2008/PR.CR.28/PAPU-22 on February 27, 2009, and in compliance with the Indian Companies Act, 1956, we obtained authorization to become a private company.We diligently followed the outlined procedures and officially registered the company on December 10, 2010. This marked the beginning of our operational journey, driven by our commitment to serving the community.\"', 1, NULL, '2024-05-13 09:11:59', '2024-05-13 09:13:28'),
(6, 170, '6641d97c182bc.jpg', '2010', 'आमची कायदेशीर गव्हर्नन्स फ्रेमवर्क तयार करणे', 'ठाणे महानगरपालिका, ठाणे, मीरा-भाईंदर महानगरपालिका, भाईंदर, भिवंडी निजामपूर शहर (पूर्वीची नगरपरिषद म्हणून ओळखली जाणारी), भिवंडी, आणि ठाणे जिल्हा परिषद, ठाणे यांच्या एकत्रित प्रयत्नातून आमची कायदेशीर स्थिती आणि संघटनात्मक रचना स्थापन झाली. त्यांच्या संबंधित सर्वसाधारण सभेत महत्त्वपूर्ण ठराव मंजूर करण्यात आला.\r\n\r\n27 फेब्रुवारी 2009 रोजी शासन निर्णय क्रमांक PAPUOHA (पापुयो)-2008/PR.CR.28/PAPU-22 आणि भारतीय कंपनी कायदा, 1956 चे पालन करून, आम्ही खाजगी कंपनी होण्यासाठी अधिकृतता प्राप्त केली.\r\n\r\nआम्ही आउटलाइन केलेल्या प्रक्रियेचे काटेकोरपणे पालन केले आणि 10 डिसेंबर 2010 रोजी कंपनीची अधिकृतपणे नोंदणी केली. यामुळे आमच्या कार्यप्रणालीच्या प्रवासाची सुरुवात झाली, जी समाजाची सेवा करण्याच्या आमच्या वचनबद्धतेमुळे प्रेरित झाली.\"', 1, NULL, '2024-05-13 09:12:28', '2024-05-13 09:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `homes`
--

CREATE TABLE `homes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `html` longtext DEFAULT NULL,
  `css` longtext DEFAULT NULL,
  `components` longtext DEFAULT NULL,
  `styles` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jcategories`
--

CREATE TABLE `jcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jcategory_id` int(11) DEFAULT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `vacancy` int(11) DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `job_responsibilities` blob DEFAULT NULL,
  `employment_status` varchar(255) DEFAULT NULL,
  `educational_requirements` blob DEFAULT NULL,
  `experience_requirements` blob DEFAULT NULL,
  `additional_requirements` blob DEFAULT NULL,
  `job_location` varchar(255) DEFAULT NULL,
  `salary` blob DEFAULT NULL,
  `benefits` blob DEFAULT NULL,
  `read_before_apply` blob DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 1,
  `rtl` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - LTR, 1- RTL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `rtl`, `created_at`, `updated_at`) VALUES
(169, 'English', 'en', 1, 0, '2019-12-20 02:16:35', '2020-10-03 01:34:08'),
(170, 'Marathi', 'mr', 0, 0, '2019-12-20 02:16:43', '2020-10-02 23:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `leadership`
--

CREATE TABLE `leadership` (
  `id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_mr` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `post_mr` varchar(255) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leadership`
--

INSERT INTO `leadership` (`id`, `language_id`, `category_id`, `name`, `name_mr`, `post`, `post_mr`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 2, 'Mr...', 'श्री...', 'Mayor , T.M.C., Chairman', 'महापौर, T.M.C., अध्यक्ष', 1, '66472d089a2d8.jpg', '2024-05-17 04:40:17', '2024-05-17 04:40:17', NULL),
(2, NULL, 2, 'Mr...', 'श्री...', 'Mayor ,M.B.M.C., Co-Chairman', 'महापौर, M.B.M.C., सह-अध्यक्ष', 1, '66472f0a8fe3a.jpg', '2024-05-17 04:48:50', '2024-05-17 04:48:50', NULL),
(3, NULL, 2, 'Mr...', 'श्री...', 'Mayor ,B. N.C.M.C., Co-Chairman', 'महापौर, बी. N.C.M.C., सह-अध्यक्ष', 1, '66472f269318a.jpg', '2024-05-17 04:49:18', '2024-05-17 04:49:18', NULL),
(4, NULL, 2, 'Mr...', 'श्री...', 'President, Zilla Parishad, Thane.', 'अध्यक्ष, जिल्हा परिषद, ठाणे.', 1, '66472f3fbe2b0.jpg', '2024-05-17 04:49:43', '2024-05-17 04:49:43', NULL),
(5, NULL, 2, 'Smt. Varsha Deshmukh', 'श्रीमती. वर्षा देशमुख', 'Principal Secretary , W.S. Dept, Govt. of Maharashtra', 'प्रधान सचिव डब्ल्यू.एस. विभाग, शासन. महाराष्ट्राचा', 1, '66472f714678f.jpg', '2024-05-17 04:50:33', '2024-05-17 04:50:33', NULL),
(6, NULL, 2, 'Mr.Sanjay Mukherjee (IAS)', 'श्री.संजय मुखर्जी (IAS)', 'Metro Commissioner, M.M.R.D.A.', 'मेट्रो आयुक्त, एम.एम.आर.डी.ए.', 1, '664735293eae4.jpg', '2024-05-17 05:14:57', '2024-05-17 05:14:57', NULL),
(7, NULL, 2, 'Mr. Abhijit Bangar (IAS)', 'श्री अभिजित बांगर (IAS)', 'Commissioner , T.M.C., Chairman', 'आयुक्त, T.M.C., अध्यक्ष', 1, '66473589b0c99.jpg', '2024-05-17 05:16:33', '2024-05-17 05:16:33', NULL),
(8, NULL, 2, 'Mr. Sanjay Katkar (IAS)', 'श्री.संजय काटकर (IAS)', 'Commissioner, M.B.M.C', 'आयुक्त, M.B.M.C', 1, '664735d6eb1fd.jpg', '2024-05-17 05:17:51', '2024-05-17 05:17:51', NULL),
(9, NULL, 2, 'Mr. Ajay Vaidya (IAS)', 'श्री. अजय वैद्य (IAS)', 'Commissioner, B.N.C.M.C.', 'आयुक्त, B.N.C.M.C.', 1, '66473664b9386.jpg', '2024-05-17 05:20:12', '2024-05-17 05:20:12', NULL),
(10, NULL, 2, 'Mr.Sanket Mohan Gharat', 'श्री.संकेत मोहन घरत', 'Managing Director', 'व्यवस्थापकीय संचालक', 1, '664736cf19680.jpg', '2024-05-17 05:21:59', '2024-05-17 05:21:59', NULL),
(11, NULL, 1, 'Mr. Abhijit Bangar (IAS)', 'श्री अभिजित बांगर (IAS)', 'Commissioner , T.M.C., Chairman', 'आयुक्त, T.M.C., अध्यक्ष', 1, '664737c68a907.jpg', '2024-05-17 05:26:06', '2024-05-17 05:26:06', NULL),
(12, NULL, 1, 'Mr. Sanjay Katkar (IAS)', 'श्री.संजय काटकर (IAS)', 'Commissioner, M.B.M.C', 'आयुक्त, M.B.M.C', 1, '6647382fb9ee8.jpg', '2024-05-17 05:27:51', '2024-05-17 05:27:51', NULL),
(13, NULL, 1, 'Mr. Ajay Vaidya (IAS)', 'श्री. अजय वैद्य (IAS)', 'Commissioner, B.N.C.M.C.', 'आयुक्त, B.N.C.M.C.', 1, '664738a8c84f6.jpg', '2024-05-17 05:29:52', '2024-05-17 05:29:52', NULL),
(14, NULL, 1, 'Mr. Manuj Jindal (IAS)', 'श्री मनुज जिंदाल (IAS)', 'Chief Executive Officer Zilla Parishad Thane.', 'मुख्य कार्यकारी अधिकारी जिल्हा परिषद ठाणे.', 1, '664738e9105be.jpg', '2024-05-17 05:30:57', '2024-05-17 05:30:57', NULL),
(15, NULL, 1, 'Smt. Varsha Deshmukh', 'श्रीमती. वर्षा देशमुख', 'Nominee officer from Govt. of Maharashtr', 'शासनाकडून नामनिर्देशित अधिकारी. महाराष्ट्राचा', 1, '6647392b470dd.jpg', '2024-05-17 05:32:03', '2024-05-17 05:32:03', NULL),
(16, NULL, 1, 'Mr...', 'श्री...', 'Technical Expert', 'तांत्रिक तज्ञ', 1, '664739772fa59.jpg', '2024-05-17 05:33:19', '2024-05-17 05:33:19', NULL),
(17, NULL, 1, 'Mr...', 'श्री...', 'Expert in Finance and Audit', 'वित्त आणि लेखापरीक्षणातील तज्ञ', 1, '664739b112dbb.jpg', '2024-05-17 05:34:17', '2024-05-17 05:34:17', NULL),
(18, NULL, 1, 'Mr.Sanket Mohan Gharat', 'श्री.संकेत मोहन घरत', 'Managing Director', 'व्यवस्थापकीय संचालक', 1, '664739f6c026b.jpg', '2024-05-17 05:35:26', '2024-05-17 05:35:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_categories`
--

CREATE TABLE `lead_categories` (
  `id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_mr` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_categories`
--

INSERT INTO `lead_categories` (`id`, `language_id`, `name`, `name_mr`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'BOARD OF DIRECTORS', 'संचालक मंडळ', 'board-of-directors-6534', 1, '2024-05-17 04:18:36', '2024-05-17 04:18:36', NULL),
(2, NULL, 'STRUCTURE OF GOVERNING COUNCIL', 'गव्हर्निंग कौन्सिलची रचना', 'structure-of-governing-council-8609', 1, '2024-05-17 04:19:03', '2024-05-17 04:19:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `video_file` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `duration` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `module_id`, `name`, `video_file`, `video_link`, `duration`, `created_at`, `updated_at`) VALUES
(7, 4, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 05:29:25', '2021-02-20 05:29:25'),
(8, 4, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 05:30:09', '2021-02-20 05:30:09'),
(9, 4, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 05:31:04', '2021-02-20 05:31:04'),
(10, 4, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 05:31:41', '2021-02-20 05:31:41'),
(11, 4, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 05:32:06', '2021-02-20 05:32:06'),
(12, 5, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 05:29:25', '2021-02-20 05:29:25'),
(13, 5, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 05:30:09', '2021-02-20 05:30:09'),
(14, 5, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 05:31:04', '2021-02-20 05:31:04'),
(15, 5, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 05:31:41', '2021-02-20 05:31:41'),
(16, 5, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 05:32:06', '2021-02-20 05:32:06'),
(17, 6, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 05:29:25', '2021-02-20 05:29:25'),
(18, 6, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 05:30:09', '2021-02-20 05:30:09'),
(19, 6, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 05:31:04', '2021-02-20 05:31:04'),
(20, 6, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 05:31:41', '2021-02-20 05:31:41'),
(21, 6, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 05:32:06', '2021-02-20 05:32:06'),
(22, 7, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 05:29:25', '2021-02-20 05:29:25'),
(23, 7, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 05:30:09', '2021-02-20 05:30:09'),
(24, 7, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 05:31:04', '2021-02-20 05:31:04'),
(25, 7, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 05:31:41', '2021-02-20 05:31:41'),
(26, 7, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 05:32:06', '2021-02-20 05:32:06'),
(27, 11, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 05:29:25', '2021-02-20 05:29:25'),
(28, 11, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 05:30:09', '2021-02-20 05:30:09'),
(29, 11, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 05:31:04', '2021-02-20 05:31:04'),
(30, 11, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 05:31:41', '2021-02-20 05:31:41'),
(31, 11, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 05:32:06', '2021-02-20 05:32:06'),
(32, 12, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 05:29:25', '2021-02-20 05:29:25'),
(33, 12, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 05:30:09', '2021-02-20 05:30:09'),
(34, 12, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 05:31:04', '2021-02-20 05:31:04'),
(35, 12, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 05:31:41', '2021-02-20 05:31:41'),
(36, 12, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 05:32:06', '2021-02-20 05:32:06'),
(37, 13, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 05:29:25', '2021-02-20 05:29:25'),
(38, 13, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 05:30:09', '2021-02-20 05:30:09'),
(39, 13, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 05:31:04', '2021-02-20 05:31:04'),
(40, 13, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 05:31:41', '2021-02-20 05:31:41'),
(41, 13, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 05:32:06', '2021-02-20 05:32:06'),
(42, 14, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 05:29:25', '2021-02-20 05:29:25'),
(43, 14, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 05:30:09', '2021-02-20 05:30:09'),
(44, 14, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 05:31:04', '2021-02-20 05:31:04'),
(45, 14, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 05:31:41', '2021-02-20 05:31:41'),
(46, 14, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 05:32:06', '2021-02-20 05:32:06'),
(47, 15, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(48, 15, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(49, 15, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(50, 15, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(51, 15, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(52, 16, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(53, 16, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(54, 16, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(55, 16, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(56, 16, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(57, 17, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(58, 17, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(59, 17, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(60, 17, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(61, 17, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(62, 18, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(63, 18, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(64, 18, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(65, 18, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(66, 18, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:47:54', '2021-02-20 06:47:54'),
(67, 19, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(68, 19, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(69, 19, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(70, 19, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(71, 19, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(72, 20, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(73, 20, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(74, 20, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(75, 20, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(76, 20, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(77, 21, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(78, 21, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(79, 21, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(80, 21, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(81, 21, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(82, 22, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(83, 22, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(84, 22, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(85, 22, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(86, 22, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:21', '2021-02-20 06:48:21'),
(87, 23, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(88, 23, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(89, 23, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(90, 23, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(91, 23, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(92, 24, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(93, 24, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(94, 24, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(95, 24, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(96, 24, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(97, 25, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(98, 25, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(99, 25, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(100, 25, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(101, 25, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(102, 26, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(103, 26, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(104, 26, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(105, 26, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(106, 26, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:26', '2021-02-20 06:48:26'),
(107, 27, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '0m 44s', '2021-02-20 06:48:38', '2021-11-13 23:51:49'),
(108, 27, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(109, 27, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(110, 27, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(111, 27, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(112, 28, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(113, 28, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(114, 28, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(115, 28, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(116, 28, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(117, 29, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(118, 29, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(119, 29, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(120, 29, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(121, 29, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(122, 30, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(123, 30, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(124, 30, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(125, 30, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(126, 30, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 06:48:38', '2021-02-20 06:48:38'),
(127, 31, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(128, 31, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(129, 31, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(130, 31, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(131, 31, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(132, 32, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(133, 32, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(134, 32, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(135, 32, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(136, 32, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(137, 33, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(138, 33, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(139, 33, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(140, 33, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(141, 33, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(142, 34, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(143, 34, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(144, 34, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(145, 34, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(146, 34, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:38', '2021-02-20 07:04:38'),
(147, 35, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(148, 35, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(149, 35, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(150, 35, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(151, 35, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(152, 36, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(153, 36, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(154, 36, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(155, 36, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(156, 36, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(157, 37, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(158, 37, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(159, 37, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(160, 37, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(161, 37, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(162, 38, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(163, 38, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(164, 38, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(165, 38, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(166, 38, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:44', '2021-02-20 07:04:44'),
(167, 39, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(168, 39, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(169, 39, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(170, 39, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(171, 39, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(172, 40, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(173, 40, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(174, 40, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(175, 40, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(176, 40, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(177, 41, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(178, 41, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(179, 41, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(180, 41, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(181, 41, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(182, 42, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(183, 42, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(184, 42, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(185, 42, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(186, 42, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:50', '2021-02-20 07:04:50'),
(187, 43, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(188, 43, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(189, 43, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(190, 43, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(191, 43, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(192, 44, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(193, 44, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(194, 44, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(195, 44, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(196, 44, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(197, 45, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(198, 45, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(199, 45, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(200, 45, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(201, 45, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(202, 46, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(203, 46, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(204, 46, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:04:57', '2021-02-20 07:04:57'),
(205, 46, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:04:58', '2021-02-20 07:04:58'),
(206, 46, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:04:58', '2021-02-20 07:04:58'),
(207, 47, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(208, 47, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(209, 47, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(210, 47, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(211, 47, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(212, 48, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(213, 48, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(214, 48, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(215, 48, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(216, 48, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(217, 49, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(218, 49, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(219, 49, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(220, 49, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(221, 49, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(222, 50, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(223, 50, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(224, 50, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(225, 50, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(226, 50, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:05:03', '2021-02-20 07:05:03'),
(227, 51, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(228, 51, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(229, 51, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(230, 51, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(231, 51, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(232, 52, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(233, 52, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(234, 52, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(235, 52, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(236, 52, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(237, 53, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(238, 53, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(239, 53, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(240, 53, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(241, 53, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(242, 54, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(243, 54, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(244, 54, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(245, 54, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(246, 54, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:05:11', '2021-02-20 07:05:11'),
(247, 55, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(248, 55, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(249, 55, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(250, 55, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(251, 55, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(252, 56, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(253, 56, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(254, 56, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(255, 56, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(256, 56, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(257, 57, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(258, 57, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(259, 57, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(260, 57, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(261, 57, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(262, 58, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(263, 58, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(264, 58, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(265, 58, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(266, 58, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:21:43', '2021-02-20 07:21:43'),
(267, 59, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(268, 59, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(269, 59, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(270, 59, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(271, 59, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(272, 60, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(273, 60, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(274, 60, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(275, 60, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(276, 60, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(277, 61, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(278, 61, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(279, 61, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(280, 61, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(281, 61, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(282, 62, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(283, 62, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(284, 62, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(285, 62, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(286, 62, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:21:54', '2021-02-20 07:21:54'),
(287, 63, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(288, 63, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(289, 63, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(290, 63, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(291, 63, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(292, 64, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(293, 64, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(294, 64, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(295, 64, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(296, 64, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(297, 65, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(298, 65, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(299, 65, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(300, 65, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(301, 65, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(302, 66, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(303, 66, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(304, 66, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(305, 66, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(306, 66, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:00', '2021-02-20 07:22:00'),
(307, 67, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(308, 67, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(309, 67, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(310, 67, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(311, 67, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(312, 68, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(313, 68, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(314, 68, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(315, 68, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(316, 68, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(317, 69, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(318, 69, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(319, 69, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(320, 69, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(321, 69, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(322, 70, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(323, 70, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(324, 70, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(325, 70, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(326, 70, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:06', '2021-02-20 07:22:06'),
(327, 71, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(328, 71, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(329, 71, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(330, 71, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(331, 71, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(332, 72, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(333, 72, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(334, 72, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(335, 72, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(336, 72, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(337, 73, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(338, 73, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(339, 73, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(340, 73, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(341, 73, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(342, 74, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(343, 74, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(344, 74, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(345, 74, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(346, 74, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:13', '2021-02-20 07:22:13'),
(347, 75, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(348, 75, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(349, 75, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(350, 75, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(351, 75, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(352, 76, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(353, 76, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(354, 76, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(355, 76, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(356, 76, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(357, 77, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(358, 77, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(359, 77, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(360, 77, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(361, 77, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(362, 78, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(363, 78, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(364, 78, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(365, 78, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(366, 78, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:22:19', '2021-02-20 07:22:19'),
(367, 79, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(368, 79, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(369, 79, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(370, 79, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(371, 79, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(372, 80, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(373, 80, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(374, 80, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(375, 80, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(376, 80, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(377, 81, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(378, 81, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(379, 81, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(380, 81, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(381, 81, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(382, 82, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(383, 82, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(384, 82, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(385, 82, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(386, 82, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:44', '2021-02-20 07:27:44'),
(387, 83, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(388, 83, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(389, 83, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(390, 83, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(391, 83, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(392, 84, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(393, 84, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(394, 84, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(395, 84, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(396, 84, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(397, 85, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(398, 85, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(399, 85, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(400, 85, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(401, 85, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(402, 86, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(403, 86, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(404, 86, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(405, 86, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(406, 86, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:52', '2021-02-20 07:27:52'),
(407, 87, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:59', '2021-02-20 07:27:59');
INSERT INTO `lessons` (`id`, `module_id`, `name`, `video_file`, `video_link`, `duration`, `created_at`, `updated_at`) VALUES
(408, 87, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(409, 87, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(410, 87, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(411, 87, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(412, 88, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(413, 88, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(414, 88, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(415, 88, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(416, 88, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(417, 89, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(418, 89, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(419, 89, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(420, 89, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(421, 89, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(422, 90, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(423, 90, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(424, 90, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(425, 90, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(426, 90, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:27:59', '2021-02-20 07:27:59'),
(427, 91, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(428, 91, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(429, 91, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(430, 91, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(431, 91, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(432, 92, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(433, 92, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(434, 92, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(435, 92, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(436, 92, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(437, 93, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(438, 93, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(439, 93, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(440, 93, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(441, 93, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(442, 94, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(443, 94, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(444, 94, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(445, 94, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(446, 94, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:05', '2021-02-20 07:28:05'),
(447, 95, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(448, 95, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(449, 95, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(450, 95, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(451, 95, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(452, 96, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(453, 96, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(454, 96, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(455, 96, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(456, 96, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(457, 97, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(458, 97, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(459, 97, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(460, 97, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(461, 97, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(462, 98, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(463, 98, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(464, 98, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(465, 98, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(466, 98, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:11', '2021-02-20 07:28:11'),
(467, 99, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(468, 99, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(469, 99, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(470, 99, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(471, 99, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(472, 100, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(473, 100, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(474, 100, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(475, 100, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(476, 100, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(477, 101, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(478, 101, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(479, 101, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(480, 101, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(481, 101, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(482, 102, 'Auto Welcome Message', NULL, 'https://www.youtube.com/embed/QXeEoD0pB3E', '0m 44s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(483, 102, 'Course Introduction', '1613817009.mp4', NULL, '6m 39s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(484, 102, 'Course Curriculum', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '4m 0s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(485, 102, 'Why Python', NULL, 'https://www.youtube.com/embed/hEgO047GxaQ', '5m 18s', '2021-02-20 07:28:17', '2021-02-20 07:28:17'),
(486, 102, 'Course FAQs', '1613817126.mp4', NULL, '2m 33s', '2021-02-20 07:28:17', '2021-02-20 07:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `megamenus`
--

CREATE TABLE `megamenus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `menus` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `category` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - category is active, 0 - category is deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `megamenus`
--

INSERT INTO `megamenus` (`id`, `language_id`, `menus`, `type`, `category`) VALUES
(5, 169, '{\"54\":[131,132,133,134,135,136],\"55\":[137,138,139,140,141,142],\"56\":[143,144,145,146,147],\"57\":[148,149,150,151,152,153],\"58\":[154,155,156,157],\"59\":[158,159,160,161],\"60\":[162,163,164,165],\"61\":[166,167,168,169]}', 'services', 1),
(6, 169, '[\"131\",\"134\",\"135\",\"143\",\"154\",\"162\",\"164\",\"166\"]', 'services', 0),
(7, 169, '{\"1\":[4,10,16,47],\"3\":[5,13,46],\"4\":[6,14],\"7\":[7,15]}', 'products', 1),
(15, 169, '[\"39\",\"40\",\"45\",\"46\"]', 'portfolios', 0),
(16, 169, '{\"1\":[8,11],\"2\":[7,10],\"3\":[9,12]}', 'courses', 1),
(17, 169, '[\"11\",\"13\",\"14\",\"15\",\"16\",\"17\"]', 'causes', 0),
(18, 169, '{\"7\":[26,34],\"9\":[25,33],\"10\":[8,24,31,32]}', 'events', 1),
(19, 169, '{\"27\":[41],\"28\":[42,44],\"30\":[43,45],\"31\":[46]}', 'blogs', 1),
(20, 169, '{\"54\":[39,40,46],\"55\":[44,47,43,42],\"56\":[41,45]}', 'portfolios', 1);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `serial_number` int(11) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `feature` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - will not show in home, 1 - will show in home'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `language_id`, `name`, `rank`, `image`, `url`, `serial_number`, `facebook`, `twitter`, `instagram`, `linkedin`, `feature`) VALUES
(1, 169, 'Mr.Sir', 'Mayor , T.M.C., Chairman', '6643673fc8005.jpg', NULL, 1, NULL, NULL, NULL, NULL, 0),
(2, 169, 'Mr. Saurabh Rao (I.A.S)', 'Commissioner', '66444da6dd4b7.jpg', NULL, 2, NULL, NULL, NULL, NULL, 0),
(3, 169, 'Mr. Sanket Gharat', 'Managing Director', '66444e536e88e.jpg', NULL, 3, NULL, NULL, NULL, NULL, 0),
(4, 169, 'test user', 'Governer', '66444f664b8bd.jpg', NULL, 4, NULL, NULL, NULL, NULL, 0),
(5, 169, 'श्री..सर', 'महापौर, T.M.C., अध्यक्ष', '664451e474bf0.jpg', NULL, 1, NULL, NULL, NULL, NULL, 0),
(6, 170, 'श्री..सर', 'महापौर, T.M.C., अध्यक्ष', '66445280ba359.jpg', NULL, 1, NULL, NULL, NULL, NULL, 0),
(7, 170, 'श्री सौरभ राव (I.A.S)', 'आयुक्त', '66445301902d2.jpg', NULL, 2, NULL, NULL, NULL, NULL, 0),
(8, 170, 'श्री.संकेत घरत', 'व्यवस्थापकीय संचालक', '664453557c2e6.jpg', NULL, 3, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `menus` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `language_id`, `menus`, `created_at`, `updated_at`) VALUES
(262, 170, '[{\"text\":\"\\u092e\\u0941\\u0916\\u094d\\u092f\\u092a\\u0943\\u0937\\u094d\\u0920\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"home\"},{\"text\":\"\\u0906\\u092e\\u091a\\u094d\\u092f\\u093e\\u092c\\u0926\\u094d\\u0926\\u0932\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"\\u0906\\u092e\\u091a\\u094d\\u092f\\u093e\\u092c\\u0926\\u094d\\u0926\\u0932\",\"href\":\"http:\\/\\/localhost:8001\\/\\u0906\\u092e\\u091a\\u094d\\u092f\\u093e\\u092c\\u0926\\u094d\\u0926\\u0932\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"\\u0907\\u0924\\u093f\\u0939\\u093e\\u0938\",\"href\":\"http:\\/\\/localhost:8001\\/history\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"\\u092c\\u091c\\u0947\\u091f \\u0905\\u0939\\u0935\\u093e\\u0932\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"\\u0928\\u092b\\u093e\",\"href\":\"http:\\/\\/localhost:8001\\/budget\\/report\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]},{\"text\":\"\\u0928\\u0947\\u0924\\u0943\\u0924\\u094d\\u0935\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"\\u0917\\u0935\\u094d\\u0939\\u0930\\u094d\\u0928\\u093f\\u0902\\u0917 \\u0915\\u094c\\u0928\\u094d\\u0938\\u093f\\u0932\\u091a\\u0940 \\u0930\\u091a\\u0928\\u093e\",\"href\":\"http:\\/\\/localhost:8001\\/committee\\/structure-of-governing-council-8609\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"\\u0915\\u093e\\u0930\\u094d\\u092f\\u0915\\u093e\\u0930\\u0940 \\u0938\\u092e\\u093f\\u0924\\u0940\",\"href\":\"http:\\/\\/localhost:8001\\/committee\\/board-of-directors-6534\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]},{\"text\":\"\\u0917\\u0945\\u0932\\u0930\\u0940\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"13 \\u0935\\u093e \\u0938\\u094d\\u0925\\u093e\\u092a\\u0928\\u093e \\u0926\\u093f\\u0928 \\u0938\\u094b\\u0939\\u0933\\u093e\",\"href\":\"http:\\/\\/localhost:8001\\/galleries\\/13th-foundation-day-celebration-9951\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"\\u096b\\u0969 \\u0935\\u093e \\u0930\\u093e\\u0937\\u094d\\u091f\\u094d\\u0930\\u0940\\u092f \\u0938\\u0941\\u0930\\u0915\\u094d\\u0937\\u093e \\u0938\\u092a\\u094d\\u0924\\u093e\\u0939 \\u092e\\u094b\\u0939\\u0940\\u092e\",\"href\":\"http:\\/\\/localhost:8001\\/galleries\\/53th-national-safety-week-campaign-1985\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]}]},{\"text\":\"\\u0935\\u093f\\u092d\\u093e\\u0917\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"\\u092a\\u094d\\u0930\\u0936\\u093e\\u0938\\u0928\",\"href\":\"http:\\/\\/localhost:8001\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"\\u0905\\u092d\\u093f\\u092f\\u093e\\u0902\\u0924\\u094d\\u0930\\u093f\\u0915\\u0940\",\"href\":\"http:\\/\\/localhost:8001\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"\\u092a\\u094d\\u0930\\u0915\\u0932\\u094d\\u092a\",\"href\":\"http:\\/\\/localhost:8001\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"\\u0911\\u092a\\u0930\\u0947\\u0936\\u0928\",\"href\":\"http:\\/\\/localhost:8001\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]},{\"text\":\"\\u0935\\u093f\\u0924\\u094d\\u0924 \\u0906\\u0923\\u093f \\u0932\\u0947\\u0916\\u093e\",\"href\":\"http:\\/\\/localhost:8001\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"\\u0924\\u093e\\u0902\\u0924\\u094d\\u0930\\u093f\\u0915 \\u0915\\u093e\\u0917\\u0926\\u092a\\u0924\\u094d\\u0930\\u0947\",\"href\":\"http:\\/\\/localhost:8001\\/documents\\/technical-documents-896\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"\\u092a\\u0930\\u093f\\u092a\\u0924\\u094d\\u0930\\u0915\\u0947\",\"href\":\"http:\\/\\/localhost:8001\\/documents\\/circulars-2717\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"\\u092a\\u093e\\u0923\\u0940 \\u0926\\u0930 \\u0906\\u0923\\u093f \\u0936\\u0941\\u0932\\u094d\\u0915\",\"href\":\"http:\\/\\/localhost:8001\\/water\\/tariff\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]},{\"text\":\"\\u0908-\\u0936\\u093e\\u0938\\u0928\",\"href\":\"http:\\/\\/localhost:8001\\/egovernance\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"\\u0928\\u093f\\u0935\\u093f\\u0926\\u093e \\u0906\\u0923\\u093f \\u091c\\u093e\\u0939\\u093f\\u0930\\u093e\\u0924\",\"href\":\"http:\\/\\/localhost:8001\\/tenders\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]', '2024-05-17 04:47:16', '2024-05-17 04:47:16'),
(263, 169, '[{\"text\":\"Home\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"home\"},{\"text\":\"About Us\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"About Us\",\"href\":\"http:\\/\\/localhost:8001\\/Aboute-Us\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"History\",\"href\":\"http:\\/\\/localhost:8001\\/history\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"Budget Report\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"Profit\",\"href\":\"http:\\/\\/localhost:8001\\/budget\\/report\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]},{\"text\":\"Leadership\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"Structure of Governing Council\",\"href\":\"http:\\/\\/localhost:8001\\/committee\\/structure-of-governing-council-8609\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"Executive Committee\",\"href\":\"http:\\/\\/localhost:8001\\/committee\\/board-of-directors-6534\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]},{\"text\":\"Gallery\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"13th Foundation Day Celebration\",\"href\":\"http:\\/\\/localhost:8001\\/galleries\\/13th-foundation-day-celebration-9951\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"53th NATIONAL SAFETY WEEK CAMPAIGN\",\"href\":\"http:\\/\\/localhost:8001\\/galleries\\/53th-national-safety-week-campaign-1985\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]}]},{\"text\":\"Department\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"Administration\",\"href\":\"http:\\/\\/localhost:8001\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"Engineering\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"Project\",\"href\":\"http:\\/\\/localhost:8001\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"Operation\",\"href\":\"http:\\/\\/localhost:8001\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]},{\"text\":\"Finance and Accounts\",\"href\":\"http:\\/\\/localhost:8001\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"Technical Documents\",\"href\":\"http:\\/\\/localhost:8001\\/documents\\/technical-documents-896\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"Circulars\",\"href\":\"http:\\/\\/localhost:8001\\/documents\\/circulars-2717\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"Water Tariff and Charges\",\"href\":\"http:\\/\\/localhost:8001\\/water\\/tariff\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]},{\"text\":\"e-Governance\",\"href\":\"http:\\/\\/localhost:8001\\/egovernance\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"},{\"text\":\"Tender & Advertisement\",\"href\":\"http:\\/\\/localhost:8001\\/tenders\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\"}]', '2024-05-17 04:47:31', '2024-05-17 04:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_03_14_062240_create_admins_table', 1),
(2, '2020_03_14_064158_create_archives_table', 2),
(3, '2020_03_14_064702_create_backups_table', 3),
(4, '2020_03_14_074020_create_basic_settings_table', 4),
(5, '2020_03_14_082808_add_website_title_to_basic_settings_table', 5),
(6, '2020_03_14_083229_create_basic_settings_extended_table', 6),
(7, '2020_03_14_092331_drop_timestamps_from_basic_settings_table', 7),
(8, '2020_03_14_092610_drop_timestamps_from_basic_settings_extended', 8),
(10, '2020_03_14_093031_create_bcategories_table', 9),
(11, '2020_03_14_094303_create_blogs_table', 10),
(12, '2020_03_14_094806_create_budgets_table', 11),
(13, '2020_03_14_095055_create_calendar_events_table', 12),
(14, '2020_03_14_100801_create_faqs_table', 13),
(16, '2020_03_14_101217_create_features_table', 14),
(17, '2020_03_14_101721_create_galleries_table', 15),
(18, '2020_03_14_134924_create_jcategories_table', 16),
(19, '2020_03_14_135658_create_jobs_table', 17),
(20, '2020_03_14_141017_create_languages_table', 18),
(21, '2020_03_14_141414_create_members_table', 19),
(22, '2020_03_14_142235_create_packages_table', 20),
(23, '2020_03_14_144528_create_package_inputs_table', 21),
(24, '2020_03_14_145133_create_package_input_options', 22),
(25, '2020_03_14_145651_create_package_orders', 23),
(26, '2020_03_14_150220_create_pages_table', 24),
(27, '2020_03_14_151826_create_partners_table', 25),
(28, '2020_03_14_152152_drop_timestamps_from_partners', 26),
(30, '2020_03_14_152922_create_points_table', 27),
(31, '2020_03_14_153317_create_portfolios_table', 28),
(32, '2020_03_14_154707_create_portfolio_images_table', 29),
(33, '2020_03_14_155924_create_quotes_table', 30),
(34, '2020_03_14_172021_create_quote_input_options_table', 31),
(35, '2020_03_14_172603_create_roles_table', 32),
(36, '2020_03_14_174750_create_scategories_table', 33),
(37, '2020_03_14_175054_create_services_table', 34),
(38, '2020_03_14_181443_create_sliders_table', 35),
(39, '2020_03_14_182025_create_socials_table', 36),
(40, '2020_03_14_182248_create_statistics_table', 37),
(42, '2020_03_14_183128_create_subscribers_table', 38),
(43, '2020_03_14_183439_create_testimonials_table', 39),
(44, '2020_03_14_183748_create_ulinks_table', 40),
(48, '2020_03_15_152021_create_quote_inputs_table', 41),
(49, '2020_03_25_192539_create_payment_gateways_table', 42),
(50, '2020_03_27_103050_remove_currency_from_packages', 43),
(51, '2020_03_27_172511_remove_package_currency_from_package_orders', 44),
(53, '2020_03_27_193756_add_method_in_package_orders', 45),
(54, '2020_03_28_174034_create_rss_feeds_table', 46),
(55, '2020_03_28_174830_create_rss_posts_table', 47),
(58, '2020_03_29_161843_add_theme_version_to_basic_settings_extended', 48),
(59, '2020_03_29_164118_set_default_to_theme_version', 48),
(60, '2020_03_30_190620_add_feature_to_services', 49),
(61, '2020_03_31_144619_add_details_page_status_to_services', 50),
(64, '2020_03_31_162008_add_summary_to_services', 51),
(65, '2020_04_01_153442_add_rss_title_to_basic_settings_extended', 52),
(66, '2020_04_01_154346_add_rss_heading_columns_to_basic_settings_extended', 53),
(67, '2020_04_01_160910_add_is_rss_to_basic_settings_extended', 54),
(68, '2020_04_01_165404_add_rss_meta_columns_to_basic_settings_extended', 55),
(69, '2020_04_03_161254_add_overlay_to_basic_settings_extended', 56),
(70, '2020_04_03_174526_add_breadcrumb_overlay_color_to_basic_settings_extended', 57),
(71, '2020_04_03_180227_increase_opacity_col_length', 58),
(72, '2020_04_03_184459_add_order_status_to_packages', 59),
(73, '2020_04_04_161837_add_feature_col_to_portfolios', 60),
(74, '2020_04_04_164347_add_feature_col_to_members', 61),
(75, '2020_04_04_173038_add_feature_to_packages', 62),
(76, '2020_04_04_175705_add_feature_to_scategories', 63),
(77, '2020_04_05_151511_add_order_number_in_package_orders', 64),
(78, '2020_04_06_151644_add_invoice_to_package_orders', 65),
(79, '2020_04_06_155006_create_sitemaps_table', 66),
(80, '2020_04_08_202206_add_auto_update_to_sitemaps', 67),
(81, '2020_04_09_144803_drop_contact_mail_from_basic_settings', 68),
(82, '2020_04_09_151601_add_from_mail_to_basic_settings_extended', 68),
(83, '2020_04_09_154452_mail_from_admin_cols_to_basic_settings_extended', 69),
(84, '2020_04_09_170024_smtp_encryption_to_encryption', 70),
(85, '2020_04_09_183414_rename_order_mail_to_to_mail', 71),
(92, '2020_04_13_145313_create_menus_table', 72),
(93, '2020_04_14_060458_drop_parent_link_name_from_basic_settings', 73),
(94, '2020_04_17_092309_drop_availability_columns_from_basic_settings', 74),
(95, '2020_04_17_093108_drop_availability_columns_from_basic_settings_extended', 75),
(96, '2020_04_17_100928_add_is_quote_to_basic_settings', 76),
(97, '2020_04_21_194915_add_hero_section_bold_text_to_basic_settings_table', 77),
(98, '2020_04_22_173743_add_hero_fonx_size_cols_to_basic_settings_extended', 77),
(99, '2020_04_22_191154_add_font_size_cols_to_sliders', 77),
(100, '2020_04_24_101223_add_statistics_bg_to_basic_settings_extended', 77),
(101, '2020_04_18_141739_create_pcategories_table', 78),
(102, '2020_04_18_162850_create_products_table', 78),
(103, '2020_04_19_101608_create_product_images_table', 78),
(105, '2020_04_25_090543_create_users_table', 78),
(106, '2020_04_26_160234_create_shipping_charges_table', 78),
(107, '2020_04_29_180209_add_package_background_to_basic_settings_extended', 79),
(108, '2020_04_29_101508_create_product_orders_table', 80),
(109, '2020_04_29_102816_create_order_items_table', 80),
(110, '2020_04_29_161315_product_heiding_table', 80),
(111, '2020_05_01_192457_add_intro_and_pricing_overlay_cols', 81),
(112, '2020_05_03_152312_add_hero_section_bold_text_color_to_basic_settings_extended', 82),
(113, '2020_05_03_162704_add_bold_text_color_to_sliders', 83),
(114, '2020_05_03_182229_add_color_to_packages', 84),
(115, '2020_05_03_192125_add_color_to_points', 85),
(116, '2020_05_03_163528_mail_verification_users__table', 86),
(117, '2020_05_06_090943_create_product_reviews_table', 86),
(118, '2020_05_08_103149_rating_field_add', 86),
(119, '2020_05_09_190603_add_intro_bg2_to_basic_settings_extended', 87),
(120, '2020_05_09_160509_create_tickets_table', 88),
(121, '2020_05_10_155934_create_conversations_table', 88),
(122, '2020_05_13_151757_add_image_to_packages_table', 89),
(123, '2020_05_14_163602_invoice_field_add', 90),
(124, '2020_05_14_173049_last_message_field_add', 90),
(125, '2020_04_19_155335_add_shop_settings_cols_t_basic_settings_extended', 91),
(126, '2020_05_19_114332_add_side_image_to_sliders', 92),
(127, '2020_05_19_155055_add_another_button_fields_in_sliders', 93),
(128, '2020_05_20_164842_add_open_hour_to_base_settings_extended', 94),
(130, '2020_05_20_185325_add_image_to_features', 95),
(132, '2020_05_20_205827_add_about_cols_to_basic_settings_extended', 96),
(133, '2020_05_21_075758_add_about_section_to_basic_settings_extended', 97),
(135, '2020_05_21_084732_add_restaurant_section_customization_cols_to_basic_settings_extended', 98),
(136, '2020_06_12_103704_drop_product_details_subtitle_from_basic_settings_extended', 99),
(137, '2020_06_12_104858_make_breadcrumbs_nullable', 100),
(138, '2020_06_13_114122_drop_billing_shipping_username_from_users', 101),
(139, '2020_06_16_104458_add_meta_columns', 102),
(140, '2020_06_16_111322_add_meta_columns_to_products', 103),
(143, '2020_06_21_155024_create_basic_settings_extra', 104),
(144, '2020_06_26_143822_make_previous_price_nullable', 105),
(145, '2020_06_26_175405_drop_auto_update_from_rss_feeds', 106),
(146, '2020_06_26_175820_drop_auto_update_from_sitemaps', 106),
(147, '2020_07_20_094806_change_email_verification_col_in_users', 107),
(155, '2020_07_22_035105_create_offline_gateways', 108),
(156, '2020_07_24_061432_drop_receipt_col_from_offline_gateways', 109),
(157, '2020_07_24_061645_add_receipt_to_product_orders', 110),
(158, '2020_07_24_140620_add_receipt_to_package_orders', 111),
(159, '2020_07_25_061733_add_base_currency_columns_to_basic_settings_extra', 112),
(164, '2020_07_26_044759_rename_status_to_product_checkout_status_in_offline_gateways', 113),
(165, '2020_07_26_045046_modify_status_cols_in_offline_gateways', 114),
(166, '2020_07_27_090238_add_slug_to_bcategories', 115),
(167, '2020_07_28_151739_modify_short_text_in_points_table', 116),
(168, '2020_07_28_154745_modify_short_text_in_scategories', 117),
(169, '2020_07_29_070943_modify_footer_text_in_basic_settings', 118),
(170, '2020_08_02_045153_add_payment_status_to_package_orders', 119),
(171, '2019_11_18_105032_create_pages_table', 120),
(172, '2019_11_18_105615_create_uploads_table', 120),
(173, '2020_04_18_064412_create_page_translations_table', 120),
(174, '2020_04_18_065546_create_settings_table', 120),
(176, '2020_09_16_133334_create_event_categories_table', 121),
(178, '2020_09_21_124242_create_donations_table', 121),
(179, '2020_10_07_091810_add_html_css_cols_to_pages', 122),
(180, '2020_10_01_134839_create_donation_details_table', 123),
(188, '2020_10_25_173619_add_pagebuilder_cols_in_services', 125),
(189, '2020_10_28_081718_add_sidebar_to_services', 125),
(190, '2020_10_28_082032_add_content_drop_html_css_from_services', 126),
(193, '2020_10_28_093420_add_sidebar_col_to_blogs', 127),
(194, '2020_10_28_101437_create_theme_homes_table', 128),
(195, '2020_10_06_121429_create_course_categories_table', 129),
(196, '2020_10_07_061229_create_courses_table', 129),
(197, '2020_10_13_065310_create_modules_table', 129),
(198, '2020_10_14_040234_create_lessons_table', 129),
(199, '2021_01_11_041803_drop_section_customization_cols_from_basic_settings', 130),
(200, '2021_01_11_044249_rename_theme_homes_to_homes', 131),
(201, '2021_01_11_053211_add_cols_to_homes', 132),
(205, '2021_01_11_060318_drop_homes_table', 133),
(206, '2021_01_11_060453_create_homes_table', 133),
(207, '2021_01_11_063030_add_home_version_to_basic_settings', 134),
(208, '2021_01_11_063256_drop_pricing_section_from_basic_settings_extended', 135),
(211, '2021_01_11_065819_add_drop_cols_in_pages', 136),
(212, '2021_01_17_070359_add_digital_product_cols_to_product_orders', 136),
(213, '2021_01_17_094042_drop_cols_from_product_orders', 137),
(214, '2021_01_17_094146_add_digital_product_cols_to_products', 138),
(215, '2021_01_18_152626_make_cols_nullable_in_order_items', 139),
(216, '2021_01_18_154001_add_gateway_type_to_product_orders', 140),
(217, '2021_01_19_060650_change_stock_default_value_in_products', 141),
(218, '2021_01_19_124000_create_coupons_table', 142),
(219, '2021_01_19_144402_add_tax_to_basic_settings_extra', 143),
(221, '2021_01_20_052747_add_tax_discount_to_product_orders', 144),
(223, '2021_01_21_041425_add_shipping_method_to_product_orders', 145),
(225, '2021_01_21_082211_add_facebook_google_login_cols_to_basic_settings_extra', 146),
(226, '2021_01_21_094410_add_provider_cols_to_users', 147),
(227, '2021_01_21_113647_make_user_id_nullable_in_product_orders', 148),
(228, '2021_01_21_120336_add_product_guest_checkout_to_basic_settings_extra', 149),
(229, '2021_01_21_151530_add_product_rating_system', 150),
(230, '2021_01_22_054021_add_package_guest_checkout_to_basic_settings_extra', 151),
(233, '2021_01_22_064712_add_user_package_id_cols_to_package_orders', 152),
(240, '2021_01_22_145809_add_external_link_in_packages', 153),
(241, '2021_01_22_150142_add_order_status', 154),
(242, '2021_01_23_101321_drop_nda_from_package_orders', 155),
(243, '2021_01_23_101510_drop_active_col_from_package_inputs', 156),
(244, '2021_01_23_133912_drop_active_from_quote_inputs', 157),
(245, '2021_01_23_140201_drop_nda_from_quotes', 158),
(249, '2021_01_24_060052_create_timezones_table', 159),
(250, '2021_01_24_062046_add_timezone_to_basic_settings_extra', 160),
(251, '2021_01_24_073829_add_recurring_billing_cols_to_basic_settings_extra', 161),
(252, '2021_01_24_075337_add_expiration_reminder_days_in_basic_settings_extra', 162),
(253, '2021_01_24_093304_drop_package_duration_from_basic_settings_extra', 163),
(254, '2021_01_24_093402_add_duration_to_packages', 164),
(260, '2021_01_24_103608_create_subscriptions_table', 165),
(261, '2021_01_25_071337_add_name_email_to_subscriptions', 166),
(263, '2021_01_25_094403_create_queue_jobs_table', 167),
(270, '2021_01_26_080703_add_gateway_pending_package_cols_to_subscriptions', 168),
(271, '2021_01_27_072255_add_gateway_type_to_subscriptions', 168),
(275, '2021_01_29_161320_add_preloader_cols_to_basic_settings_extra', 169),
(276, '2021_01_29_170622_add_ips_to_basic_settings', 170),
(277, '2020_10_17_115444_add_course_duration_to_courses_table', 171),
(278, '2020_10_17_131101_add_is_featured_to_courses_table', 171),
(279, '2020_10_19_050833_remove_video_file_from_courses', 171),
(280, '2020_10_25_125408_create_course_purchases_table', 171),
(281, '2020_11_05_080538_add_invoice_to_course_purchases_table', 171),
(282, '2020_11_10_100650_create_course_reviews_table', 171),
(283, '2020_11_10_163735_add_average_rating_to_courses_table', 171),
(284, '2021_01_31_092208_add_breadcrumb_heading_to_basic_settings_extra', 172),
(285, '2021_01_31_165050_add_is_course_to_basic_settings_extra', 173),
(286, '2021_02_03_033234_add_course_checkout_migration', 174),
(288, '2021_02_03_050124_add_receipt_to_course_purchases', 175),
(289, '2021_02_03_074559_add_slug_to_courses', 176),
(290, '2020_09_24_121000_create_article_categories_table', 177),
(291, '2020_09_26_084231_create_articles_table', 177),
(292, '2020_10_04_121610_add_knowledgebase_titles_to_basic_settings_extra_table', 177),
(293, '2020_10_04_122248_add_knowledgebase_subtitles_to_basic_settings_extra_table', 177),
(294, '2020_10_04_122805_add_knowledgebase_details_titles_to_basic_settings_extra_table', 177),
(295, '2021_02_03_151505_add_slug_in_articles', 178),
(296, '2020_10_26_102716_add_events_and_causes_to_basic_settings_extended_table', 179),
(297, '2020_10_26_121727_add_events_and_causes_to_basic_settings_table', 179),
(298, '2021_02_04_105849_add_cols_to_donation_details', 180),
(300, '2021_02_04_121040_add_drop_cols_in_donation_details', 181),
(302, '2021_02_05_130302_add_donation_checkout_status', 182),
(303, '2021_02_05_131736_add_donation_settings_cols_to_basic_settings_extra', 183),
(304, '2020_09_18_131535_create_events_table', 184),
(305, '2020_10_16_053710_create_event_details_table', 185),
(306, '2021_02_06_044913_add_on_delete_cascade_on_donation_id', 186),
(307, '2021_02_06_045336_add_on_delete_cascade_to_lang_id', 187),
(309, '2021_02_07_092611_add_event_checkout_status', 188),
(310, '2021_02_07_104127_add_event_cols_to_basic_settings_extra', 189),
(311, '2021_02_07_110645_add_user_id_to_event_details_table', 190),
(312, '2021_02_07_160028_add_invoice_to_event_details', 191),
(313, '2021_03_03_050158_create_megamenus_table', 192),
(316, '2021_03_03_062340_add_service_category_to_basic_settings_extra', 193),
(318, '2021_03_03_072255_add_language_id_to_megamenus', 194),
(319, '2021_03_03_081650_make_cols_megamenus_cols_nullable', 195),
(321, '2021_03_03_144637_add_category_to_megamenus', 196),
(326, '2021_03_18_045056_create_permalinks_table', 197),
(327, '2021_03_19_142614_drop_language_id_from_permalinks', 198),
(329, '2021_03_23_150745_add_catalog_mode_to_basic_settings_extra', 199),
(330, '2021_03_23_175755_add_is_course_rating_to_basic_settings_extra', 200),
(331, '2021_03_24_044736_create_guests_table', 201),
(332, '2021_03_24_054718_add_push_notification_to_basic_settings_extra', 202),
(333, '2021_03_24_064151_create_push_subscriptions_table', 203),
(334, '2021_03_25_045506_drop_contact_page_infos', 204),
(335, '2021_03_25_050147_add_contact_infos_in_basic_settings_extra', 205),
(336, '2021_03_25_050810_drop_lat_lng_from_basic_settings', 206),
(337, '2021_03_25_063450_update_map_cols', 207),
(339, '2021_03_30_122645_add_pagebuilder_to_basic_settings_extra', 208),
(340, '2021_03_31_100022_add_custom_page_pagebuilder_to_basic_settings_extra', 209),
(341, '2021_03_31_103702_add_section_customizations_cols_to_basic_settings', 210),
(342, '2021_03_31_112700_add_pricing_section_to_basic_settings_extended', 211),
(343, '2021_03_31_185244_add_body_to_pages', 212),
(345, '2021_04_06_110735_create_popups_table', 213),
(346, '2021_04_06_172054_add_name_to_popups', 214),
(347, '2021_04_07_074645_add_status_to_popups', 215),
(348, '2021_04_08_095555_drop_announcement_cols_to_basic_settings', 216),
(350, '2021_04_15_123458_create_email_templates', 217),
(351, '2021_04_18_092820_add_whatsapp_chat_cols_to_basic_settings_extra', 218),
(352, '2021_04_04_102049_alter_table_basic_settings_extra', 219),
(353, '2021_04_04_141250_create_feedbacks_table', 219),
(354, '2021_04_05_112153_create_faq_categories_table', 219),
(355, '2021_04_06_085343_add_faq_category_status_column_to_basic_settings_extra_table', 219),
(356, '2021_04_06_094435_add_category_id_column_to_faqs_table', 219),
(357, '2021_04_07_103852_create_gallery_categories_table', 219),
(358, '2021_04_07_104306_add_gallery_category_status_to_basic_settings_extra_table', 219),
(359, '2021_04_08_060033_add_category_id_column_to_galleries_table', 219),
(360, '2021_04_10_052120_add_package_category_status_to_basic_settings_extra_table', 219),
(361, '2021_04_10_061712_create_package_categories_table', 219),
(362, '2021_04_10_094002_add_category_id_column_to_packages_table', 219),
(363, '2021_04_12_104459_add_website_link_column_to_portfolios_table', 219),
(364, '2021_04_24_081952_make_course_purchases_cols_nullable', 220),
(367, '2021_11_14_064526_add_secret_path_drop_ips_from_basic_settings', 221),
(368, '2021_11_14_074511_add_products_in_home_to_pcategories', 222),
(369, '2021_11_14_101342_add_image_in_pcategories_table', 223),
(370, '2021_11_20_070431_add_newsletter_section_in_basic_settings', 224),
(371, '2021_11_20_072800_add_products_section_in_basic_settings_extended', 225),
(372, '2021_11_20_074723_rename_add_products_section', 226);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1),
(2, 'App\\Models\\Admin', 2);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `course_id`, `name`, `duration`, `created_at`, `updated_at`) VALUES
(4, 7, 'Course Overview', '0h 19m', '2021-02-20 05:25:04', '2021-02-20 05:25:04'),
(5, 7, 'Python Setup', '0h 54m', '2021-02-20 05:25:27', '2021-02-20 05:25:27'),
(6, 7, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 05:26:08', '2021-02-20 05:26:08'),
(7, 7, 'Python Comparison Operators', '0h 9m', '2021-02-20 05:26:34', '2021-02-20 05:26:34'),
(11, 8, 'Course Overview', '0h 19m', '2021-02-20 05:25:04', '2021-02-20 05:25:04'),
(12, 8, 'Python Setup', '0h 54m', '2021-02-20 05:25:27', '2021-02-20 05:25:27'),
(13, 8, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 05:26:08', '2021-02-20 05:26:08'),
(14, 8, 'Python Comparison Operators', '0h 9m', '2021-02-20 05:26:34', '2021-02-20 05:26:34'),
(15, 9, 'Course Overview', '0h 19m', '2021-02-20 05:25:04', '2021-02-20 05:25:04'),
(16, 9, 'Python Setup', '0h 54m', '2021-02-20 05:25:27', '2021-02-20 05:25:27'),
(17, 9, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 05:26:08', '2021-02-20 05:26:08'),
(18, 9, 'Python Comparison Operators', '0h 9m', '2021-02-20 05:26:34', '2021-02-20 05:26:34'),
(19, 10, 'Course Overview', '0h 19m', '2021-02-20 05:25:04', '2021-02-20 05:25:04'),
(20, 10, 'Python Setup', '0h 54m', '2021-02-20 05:25:27', '2021-02-20 05:25:27'),
(21, 10, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 05:26:08', '2021-02-20 05:26:08'),
(22, 10, 'Python Comparison Operators', '0h 9m', '2021-02-20 05:26:34', '2021-02-20 05:26:34'),
(23, 11, 'Course Overview', '0h 19m', '2021-02-20 05:25:04', '2021-02-20 05:25:04'),
(24, 11, 'Python Setup', '0h 54m', '2021-02-20 05:25:27', '2021-02-20 05:25:27'),
(25, 11, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 05:26:08', '2021-02-20 05:26:08'),
(26, 11, 'Python Comparison Operators', '0h 9m', '2021-02-20 05:26:34', '2021-02-20 05:26:34'),
(27, 12, 'Course Overview', '0h 19m', '2021-02-20 05:25:04', '2021-02-20 05:25:04'),
(28, 12, 'Python Setup', '0h 54m', '2021-02-20 05:25:27', '2021-02-20 05:25:27'),
(29, 12, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 05:26:08', '2021-02-20 05:26:08'),
(30, 12, 'Python Comparison Operators', '0h 9m', '2021-02-20 05:26:34', '2021-02-20 05:26:34'),
(31, 13, 'Course Overview', '0h 19m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(32, 13, 'Python Setup', '0h 54m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(33, 13, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(34, 13, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(35, 14, 'Course Overview', '0h 19m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(36, 14, 'Python Setup', '0h 54m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(37, 14, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(38, 14, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(39, 15, 'Course Overview', '0h 19m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(40, 15, 'Python Setup', '0h 54m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(41, 15, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(42, 15, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(43, 16, 'Course Overview', '0h 19m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(44, 16, 'Python Setup', '0h 54m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(45, 16, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(46, 16, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(47, 17, 'Course Overview', '0h 19m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(48, 17, 'Python Setup', '0h 54m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(49, 17, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(50, 17, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(51, 18, 'Course Overview', '0h 19m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(52, 18, 'Python Setup', '0h 54m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(53, 18, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(54, 18, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:02:41', '2021-02-20 07:02:41'),
(55, 19, 'Course Overview', '0h 19m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(56, 19, 'Python Setup', '0h 54m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(57, 19, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(58, 19, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(59, 20, 'Course Overview', '0h 19m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(60, 20, 'Python Setup', '0h 54m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(61, 20, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(62, 20, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(63, 21, 'Course Overview', '0h 19m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(64, 21, 'Python Setup', '0h 54m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(65, 21, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(66, 21, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(67, 22, 'Course Overview', '0h 19m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(68, 22, 'Python Setup', '0h 54m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(69, 22, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(70, 22, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(71, 23, 'Course Overview', '0h 19m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(72, 23, 'Python Setup', '0h 54m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(73, 23, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(74, 23, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(75, 24, 'Course Overview', '0h 19m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(76, 24, 'Python Setup', '0h 54m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(77, 24, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(78, 24, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:20:55', '2021-02-20 07:20:55'),
(79, 25, 'Course Overview', '0h 19m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(80, 25, 'Python Setup', '0h 54m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(81, 25, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(82, 25, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(83, 26, 'Course Overview', '0h 19m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(84, 26, 'Python Setup', '0h 54m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(85, 26, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(86, 26, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(87, 27, 'Course Overview', '0h 19m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(88, 27, 'Python Setup', '0h 54m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(89, 27, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(90, 27, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(91, 28, 'Course Overview', '0h 19m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(92, 28, 'Python Setup', '0h 54m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(93, 28, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(94, 28, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(95, 29, 'Course Overview', '0h 19m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(96, 29, 'Python Setup', '0h 54m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(97, 29, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(98, 29, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(99, 30, 'Course Overview', '0h 19m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(100, 30, 'Python Setup', '0h 54m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(101, 30, 'Python Object & Data Structure Basics', '2h 2m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(102, 30, 'Python Comparison Operators', '0h 9m', '2021-02-20 07:26:40', '2021-02-20 07:26:40'),
(103, 33, 'Arabic', '10h 60m', '2021-11-13 23:43:23', '2021-11-13 23:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `language_id`, `created_by`, `image`, `title`, `date`, `created_at`, `updated_at`) VALUES
(1, 169, 1, '6641a143c9de6.jpg', 'Upload Mediclaim Data for year 2017-18', '2024-12-24', '2024-05-07 12:23:30', '2024-05-13 05:12:35'),
(2, 170, 1, '6641a3223f28f.jpg', '2017-18 साठी मेडिक्लेम डेटा अपलोड', '2024-12-24', '2024-05-07 12:24:02', '2024-05-13 05:20:34'),
(3, 169, 1, '6641a16c8d64b.jpg', 'Tree Plantation by STEM in year 2016', '2024-12-12', '2024-05-07 12:24:21', '2024-05-13 05:13:16'),
(4, 170, 1, '6641a333ce8c1.jpg', '2016 मध्ये STEM द्वारे वृक्षारोपण', '2024-12-12', '2024-05-07 12:24:36', '2024-05-13 05:20:51'),
(5, 169, 1, '6641a279bda36.jpg', 'Contributed Rs 11 Lakhs to PM\'s National Relief Fund', '2024-05-04', '2024-05-07 12:25:06', '2024-05-13 05:17:45'),
(6, 170, 1, '6641a33ee0eab.jpg', 'पंतप्रधानांच्या राष्ट्रीय मदत निधीमध्ये 11 लाख रुपयांचे योगदान दिले', '2024-05-04', '2024-05-07 12:25:26', '2024-05-13 05:21:02'),
(7, NULL, 1, '663a1dd947c70.jpg', 'STEM registers a profit of 27 crore in 2015-16s', '2025-07-07', '2024-05-07 12:26:01', '2024-05-07 12:26:01'),
(8, 170, 1, '6641a349214fb.jpg', 'STEM ने 2015-16 मध्ये 27 कोटींचा नफा नोंदवला', '2025-05-07', '2024-05-07 12:26:17', '2024-05-13 05:21:13'),
(9, 169, 1, '6641a2a21c78c.jpg', 'Crisil Ratings', '2025-01-01', '2024-05-07 12:26:34', '2024-05-13 05:18:26'),
(10, 170, 1, '6641a35bdb0ef.jpg', 'क्रिसिल रेटिंग्स', '2025-01-01', '2024-05-07 12:26:48', '2024-05-13 05:21:31');

-- --------------------------------------------------------

--
-- Table structure for table `offline_gateways`
--

CREATE TABLE `offline_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `instructions` blob DEFAULT NULL,
  `product_checkout_status` int(11) NOT NULL DEFAULT 0,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `is_receipt` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `package_order_status` tinyint(4) NOT NULL DEFAULT 0,
  `course_checkout_status` tinyint(4) NOT NULL DEFAULT 1,
  `donation_checkout_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 2 - deactive',
  `event_checkout_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offline_gateways`
--

INSERT INTO `offline_gateways` (`id`, `language_id`, `name`, `short_description`, `instructions`, `product_checkout_status`, `serial_number`, `is_receipt`, `created_at`, `updated_at`, `package_order_status`, `course_checkout_status`, `donation_checkout_status`, `event_checkout_status`) VALUES
(7, 169, 'Bank America', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 0x3c703e3c7370616e207374796c653d22666f6e742d66616d696c793a202671756f743b4f70656e2053616e732671756f743b2c20417269616c2c2073616e732d73657269663b20666f6e742d73697a653a20313470783b20746578742d616c69676e3a206a7573746966793b223e436f6e747261727920746f20706f70756c61722062656c6965662c204c6f72656d20497073756d206973206e6f742073696d706c792072616e646f6d20746578742e2049742068617320726f6f747320696e2061207069656365206f6620636c6173736963616c204c6174696e206c6974657261747572652066726f6d2034352042432c206d616b696e67206974206f7665722032303030207965617273206f6c642e2052696368617264204d63436c696e746f636b3c2f7370616e3e3c62723e3c2f703e, 1, 2, 0, '2021-03-23 11:45:28', '2021-04-25 10:07:11', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `previous_price` decimal(11,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_order_id`, `product_id`, `user_id`, `title`, `sku`, `qty`, `category`, `image`, `summary`, `description`, `price`, `previous_price`, `created_at`, `updated_at`) VALUES
(393, 189, 57, 26, '750ml Empty High Flint Flat Shoulder Excellent Quality Bottle Cork Glass Bottle', NULL, 1, 'Pants', '604a3d1bf15f7.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; line-height: 1.8;\"><span style=\"font-size: 18px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span></p>', '40.00', '50.00', '2021-04-23 02:46:05', NULL),
(394, 189, 56, 26, 'L20-1013 LM Upholstered Modern Recliner Accent Chair For Home Living Room', '4314061', 1, 'Pants', '604a0e345b889.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; line-height: 1.8;\"><span style=\"font-size: 18px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32</span></p>', '21.00', NULL, '2021-04-23 02:46:05', NULL),
(395, 189, 16, 26, 'Brandix Engine Block Z4', '8869946', 2, 'Accessories', '1593864097.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '500.00', '800.00', '2021-04-23 02:46:05', NULL),
(396, 190, 56, 26, 'L20-1013 LM Upholstered Modern Recliner Accent Chair For Home Living Room', '4314061', 1, 'Pants', '604a0e345b889.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; line-height: 1.8;\"><span style=\"font-size: 18px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32</span></p>', '21.00', NULL, '2021-04-23 02:47:24', NULL),
(397, 190, 57, 26, '750ml Empty High Flint Flat Shoulder Excellent Quality Bottle Cork Glass Bottle', NULL, 1, 'Pants', '604a3d1bf15f7.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; line-height: 1.8;\"><span style=\"font-size: 18px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span></p>', '40.00', '50.00', '2021-04-23 02:47:24', NULL),
(398, 190, 47, 26, 'Restaurant Website', NULL, 1, 'Accessories', '1613882000.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><font color=\"#636363\"><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></font><br></p>', '50.00', '85.00', '2021-04-23 02:47:24', NULL),
(399, 191, 57, 26, '750ml Empty High Flint Flat Shoulder Excellent Quality Bottle Cork Glass Bottle', NULL, 1, 'Pants', '604a3d1bf15f7.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; line-height: 1.8;\"><span style=\"font-size: 18px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span></p>', '40.00', '50.00', '2021-04-23 02:47:57', NULL),
(400, 191, 10, 26, 'Brandix Brake Kit BDX-750Z370-S', '7006192', 1, 'Accessories', '1593864049.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px; font-weight: 400;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p></h3><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px; font-weight: 400;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px; font-weight: 400;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p></h3>', '45.00', '60.00', '2021-04-23 02:47:57', NULL),
(401, 192, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 1, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-04-23 02:49:33', NULL),
(402, 193, 46, 26, 'Ecommerce Website', NULL, 1, 'Pants', '1613882080.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</font></span><br></p>', '70.00', NULL, '2021-04-23 02:50:30', NULL),
(403, 193, 13, 26, 'Brandix Brake Kit BDX-750Z370-S', '8866109', 1, 'Pants', '1593864062.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<div class=\"product-tabs__pane product-tabs__pane--active\" id=\"product-tab-description\"><div class=\"typography\"><p>Lorem\n ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, \ndiam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus \nsapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. \nSuspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque \npellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas \nconsectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget \ndolor semper urna malesuada dictum. Duis eleifend pellentesque dui et \nfinibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales \nac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit \npulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4>Etiam lacus lacus mollis in mattis</h4><p>Praesent\n mattis eget augue ac elementum. Maecenas vel ante ut enim mollis \naccumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, \nvulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo \nat porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus \norci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate\n augue, at sollicitudin nisl molestie eget.</p><p>Nunc sollicitudin, \nnunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum \nrisus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in \nnulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est\n tempus urna tincidunt finibus. Integer erat ipsum, tristique ac \nlobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. \nVestibulum ultrices tincidunt turpis, sit amet fringilla odio \nscelerisque non.</p></div></div>', '220.00', NULL, '2021-04-23 02:50:30', NULL),
(404, 194, 4, 26, 'Brandix Driver\'s seat', '345das4f4', 1, 'Accessories', '1593863977.jpg', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantiu wdolorem que laudantium, totam rem aperiam, eaquipsa quae ab illo inventore veritatis et quaarchi tecto beatae vitae dicta sunt explicabo enim ipsam voluptatem', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">Tradução de 1914 por H. Rackham</span></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</span></p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">Secção 1.10.33 do \"de Finibus Bonorum et Malorum\", escrito por Cícero em 45 AC.</span></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</span></p>', '60.00', '70.00', '2021-04-23 06:13:01', NULL),
(405, 195, 56, 26, 'L20-1013 LM Upholstered Modern Recliner Accent Chair For Home Living Room', '4314061', 1, 'Pants', '604a0e345b889.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; line-height: 1.8;\"><span style=\"font-size: 18px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32</span></p>', '21.00', NULL, '2021-04-23 06:57:43', NULL),
(406, 195, 57, 26, '750ml Empty High Flint Flat Shoulder Excellent Quality Bottle Cork Glass Bottle', NULL, 1, 'Pants', '604a3d1bf15f7.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; line-height: 1.8;\"><span style=\"font-size: 18px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span></p>', '40.00', '50.00', '2021-04-23 06:57:43', NULL),
(407, 196, 4, 26, 'Brandix Driver\'s seat', '345das4f4', 3, 'Accessories', '1593863977.jpg', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantiu wdolorem que laudantium, totam rem aperiam, eaquipsa quae ab illo inventore veritatis et quaarchi tecto beatae vitae dicta sunt explicabo enim ipsam voluptatem', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">Tradução de 1914 por H. Rackham</span></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</span></p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">Secção 1.10.33 do \"de Finibus Bonorum et Malorum\", escrito por Cícero em 45 AC.</span></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</span></p>', '60.00', '70.00', '2021-04-25 03:31:48', NULL),
(408, 197, 4, 26, 'Brandix Driver\'s seat', '345das4f4', 3, 'Accessories', '1593863977.jpg', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantiu wdolorem que laudantium, totam rem aperiam, eaquipsa quae ab illo inventore veritatis et quaarchi tecto beatae vitae dicta sunt explicabo enim ipsam voluptatem', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">Tradução de 1914 por H. Rackham</span></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</span></p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">Secção 1.10.33 do \"de Finibus Bonorum et Malorum\", escrito por Cícero em 45 AC.</span></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</span></p>', '60.00', '70.00', '2021-04-25 03:32:19', NULL),
(409, 198, 47, 26, 'Restaurant Website', NULL, 1, 'Accessories', '1613882000.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><font color=\"#636363\"><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></font><br></p>', '50.00', '85.00', '2021-04-26 01:48:03', NULL),
(410, 198, 46, 26, 'Ecommerce Website', NULL, 1, 'Pants', '1613882080.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</font></span><br></p>', '70.00', NULL, '2021-04-26 01:48:03', NULL),
(411, 199, 47, 26, 'Restaurant Website', NULL, 1, 'Accessories', '1613882000.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><font color=\"#636363\"><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></font><br></p>', '50.00', '85.00', '2021-04-26 01:48:03', NULL),
(412, 199, 46, 26, 'Ecommerce Website', NULL, 1, 'Pants', '1613882080.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</font></span><br></p>', '70.00', NULL, '2021-04-26 01:48:04', NULL),
(413, 200, 4, 26, 'Brandix Driver\'s seat', '345das4f4', 1, 'Accessories', '1593863977.jpg', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantiu wdolorem que laudantium, totam rem aperiam, eaquipsa quae ab illo inventore veritatis et quaarchi tecto beatae vitae dicta sunt explicabo enim ipsam voluptatem', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">Tradução de 1914 por H. Rackham</span></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</span></p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">Secção 1.10.33 do \"de Finibus Bonorum et Malorum\", escrito por Cícero em 45 AC.</span></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</span></p>', '60.00', '70.00', '2021-11-09 01:17:06', NULL),
(414, 200, 46, 26, 'Ecommerce Website', NULL, 1, 'Pants', '1613882080.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</font></span><br></p>', '70.00', NULL, '2021-11-09 01:17:06', NULL),
(415, 200, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 1, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-11-09 01:17:06', NULL),
(416, 201, 4, 26, 'Brandix Driver\'s seat', '345das4f4', 1, 'Accessories', '1593863977.jpg', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantiu wdolorem que laudantium, totam rem aperiam, eaquipsa quae ab illo inventore veritatis et quaarchi tecto beatae vitae dicta sunt explicabo enim ipsam voluptatem', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">Tradução de 1914 por H. Rackham</span></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</span></p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">Secção 1.10.33 do \"de Finibus Bonorum et Malorum\", escrito por Cícero em 45 AC.</span></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</span></p>', '60.00', '70.00', '2021-11-09 01:17:38', NULL),
(417, 201, 46, 26, 'Ecommerce Website', NULL, 1, 'Pants', '1613882080.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</font></span><br></p>', '70.00', NULL, '2021-11-09 01:17:38', NULL),
(418, 201, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 1, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-11-09 01:17:38', NULL);
INSERT INTO `order_items` (`id`, `product_order_id`, `product_id`, `user_id`, `title`, `sku`, `qty`, `category`, `image`, `summary`, `description`, `price`, `previous_price`, `created_at`, `updated_at`) VALUES
(420, 203, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 1, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-11-09 01:22:21', NULL),
(421, 204, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 2, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-11-09 01:23:55', NULL),
(422, 204, 13, 26, 'Brandix Brake Kit BDX-750Z370-S', '8866109', 2, 'Pants', '1593864062.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<div class=\"product-tabs__pane product-tabs__pane--active\" id=\"product-tab-description\"><div class=\"typography\"><p>Lorem\n ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, \ndiam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus \nsapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. \nSuspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque \npellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas \nconsectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget \ndolor semper urna malesuada dictum. Duis eleifend pellentesque dui et \nfinibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales \nac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit \npulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4>Etiam lacus lacus mollis in mattis</h4><p>Praesent\n mattis eget augue ac elementum. Maecenas vel ante ut enim mollis \naccumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, \nvulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo \nat porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus \norci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate\n augue, at sollicitudin nisl molestie eget.</p><p>Nunc sollicitudin, \nnunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum \nrisus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in \nnulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est\n tempus urna tincidunt finibus. Integer erat ipsum, tristique ac \nlobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. \nVestibulum ultrices tincidunt turpis, sit amet fringilla odio \nscelerisque non.</p></div></div>', '220.00', NULL, '2021-11-09 01:23:55', NULL),
(423, 204, 46, 26, 'Ecommerce Website', NULL, 1, 'Pants', '1613882080.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</font></span><br></p>', '70.00', NULL, '2021-11-09 01:23:55', NULL),
(424, 205, 7, 26, 'Taillights Brandix Z54', '23hhwh3', 3, 'Shirts', '1593864033.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing.', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span><br></p>', '100.00', '200.00', '2021-11-09 01:25:24', NULL),
(425, 206, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 2, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-11-09 01:28:28', NULL),
(426, 206, 47, 26, 'Restaurant Website', NULL, 2, 'Accessories', '1613882000.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><font color=\"#636363\"><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></font><br></p>', '50.00', '85.00', '2021-11-09 01:28:28', NULL),
(431, 209, 46, 26, 'Ecommerce Website', NULL, 1, 'Pants', '1613882080.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</font></span><br></p>', '70.00', NULL, '2021-11-09 01:38:32', NULL),
(432, 209, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 2, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-11-09 01:38:32', NULL),
(433, 210, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 2, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-11-09 01:39:51', NULL),
(434, 210, 13, 26, 'Brandix Brake Kit BDX-750Z370-S', '8866109', 1, 'Pants', '1593864062.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<div class=\"product-tabs__pane product-tabs__pane--active\" id=\"product-tab-description\"><div class=\"typography\"><p>Lorem\n ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, \ndiam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus \nsapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. \nSuspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque \npellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas \nconsectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget \ndolor semper urna malesuada dictum. Duis eleifend pellentesque dui et \nfinibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales \nac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit \npulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4>Etiam lacus lacus mollis in mattis</h4><p>Praesent\n mattis eget augue ac elementum. Maecenas vel ante ut enim mollis \naccumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, \nvulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo \nat porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus \norci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate\n augue, at sollicitudin nisl molestie eget.</p><p>Nunc sollicitudin, \nnunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum \nrisus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in \nnulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est\n tempus urna tincidunt finibus. Integer erat ipsum, tristique ac \nlobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. \nVestibulum ultrices tincidunt turpis, sit amet fringilla odio \nscelerisque non.</p></div></div>', '220.00', NULL, '2021-11-09 01:39:51', NULL),
(435, 210, 6, 26, 'Set of Four 19 Inch Spiked Tires', '345ds45sas4f4', 1, 'Shoes', '1593864023.jpg', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantiu wdolorem que laudantium, totam rem aperiam, eaquipsa quae ab illo inventore veritatis et quaarchi tecto beatae vitae dicta sunt explicabo enim ipsam voluptatem', '<p class=\"text\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 20px 0px; border: 0px; line-height: 26px; color: rgb(138, 138, 138); font-family: Poppins, sans-serif;\">Sorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur xcepteur sint occaecat cupidatat non proident, sunt.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; line-height: 26px; color: rgb(138, 138, 138); font-family: Poppins, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cdolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudinInteger in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper,</p>', '100.00', '120.00', '2021-11-09 01:39:51', NULL),
(436, 211, 46, 26, 'Ecommerce Website', NULL, 1, 'Pants', '1613882080.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\"><font color=\"#636363\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</font></span><br></p>', '70.00', NULL, '2021-11-09 01:42:00', NULL),
(437, 211, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 1, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-11-09 01:42:00', NULL),
(438, 211, 7, 26, 'Taillights Brandix Z54', '23hhwh3', 1, 'Shirts', '1593864033.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing.', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span><br></p>', '100.00', '200.00', '2021-11-09 01:42:00', NULL),
(440, 213, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 2, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-11-09 01:45:05', NULL),
(441, 214, 14, 26, 'Brandix Manual Five Speed Gearbox', '1125918', 1, 'Shoes', '1593864070.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4 style=\"margin-top: 1.5em; margin-bottom: 0.75em; line-height: 1.2; font-size: 24px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif;\">Etiam lacus lacus mollis in mattis</h4><p style=\"margin-bottom: 1.5em; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Praesent mattis eget augue ac elementum. Maecenas vel ante ut enim mollis accumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, vulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo at porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate augue, at sollicitudin nisl molestie eget.</p><p style=\"margin-bottom: 0px; color: rgb(38, 38, 38); font-family: Roboto, sans-serif; font-size: 16px;\">Nunc sollicitudin, nunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum risus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in nulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est tempus urna tincidunt finibus. Integer erat ipsum, tristique ac lobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. Vestibulum ultrices tincidunt turpis, sit amet fringilla odio scelerisque non.</p>', '120.00', '250.00', '2021-11-09 02:30:10', NULL),
(442, 214, 13, 26, 'Brandix Brake Kit BDX-750Z370-S', '8866109', 2, 'Pants', '1593864062.jpg', 'Many philosophical debates that began in ancient times are still debated today. In one general sense, philosophy is associated with wisdom, intellectual culture and a search for knowledge.', '<div class=\"product-tabs__pane product-tabs__pane--active\" id=\"product-tab-description\"><div class=\"typography\"><p>Lorem\n ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, \ndiam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus \nsapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. \nSuspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque \npellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas \nconsectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget \ndolor semper urna malesuada dictum. Duis eleifend pellentesque dui et \nfinibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales \nac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit \npulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.</p><h4>Etiam lacus lacus mollis in mattis</h4><p>Praesent\n mattis eget augue ac elementum. Maecenas vel ante ut enim mollis \naccumsan. Vestibulum vel eros at mi suscipit feugiat. Sed tortor purus, \nvulputate et eros a, rhoncus laoreet orci. Proin sapien neque, commodo \nat porta in, vehicula eu elit. Vestibulum ante ipsum primis in faucibus \norci luctus et ultrices posuere cubilia Curae; Curabitur porta vulputate\n augue, at sollicitudin nisl molestie eget.</p><p>Nunc sollicitudin, \nnunc id accumsan semper, libero nunc aliquet nulla, nec pretium ipsum \nrisus ac neque. Morbi eu facilisis purus. Quisque mi tortor, cursus in \nnulla ut, laoreet commodo quam. Pellentesque et ornare sapien. In ac est\n tempus urna tincidunt finibus. Integer erat ipsum, tristique ac \nlobortis sit amet, dapibus sit amet purus. Nam sed lorem nisi. \nVestibulum ultrices tincidunt turpis, sit amet fringilla odio \nscelerisque non.</p></div></div>', '220.00', NULL, '2021-11-09 02:30:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `description` blob DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `feature` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - will not show in home, 1 - will show in home',
  `link` text DEFAULT NULL,
  `order_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive, 1 - active, 2 - link',
  `duration` varchar(50) NOT NULL DEFAULT 'monthly',
  `category_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `language_id`, `title`, `price`, `description`, `image`, `serial_number`, `meta_keywords`, `meta_description`, `color`, `created_at`, `updated_at`, `feature`, `link`, `order_status`, `duration`, `category_id`) VALUES
(1, 169, 'Basic Package', '100.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e372048544d4c2050616765733c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3120486f6d6520506167653c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e434d532056657273696f6e204e6f7420417661696c61626c653c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e4c6f676f2044657369676e20496e636c756465643c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e31205265766973696f6e20417661696c61626c653c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e4e6f20537570706f727420417661696c61626c653c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e536f7572636520436f646520496e636c756465643c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f666f6e743e3c2f6469763e, '6062f530aac5d.png', 1, NULL, NULL, 'E4E8F9', '2019-12-21 04:30:50', '2024-04-23 09:35:09', 1, NULL, 1, 'yearly', 1),
(7, 169, 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, '1589386726.png', 2, NULL, NULL, 'F9E4E4', '2019-12-21 04:31:15', '2021-04-26 02:57:48', 1, NULL, 1, 'monthly', 7),
(43, 169, 'Plutinum Package', '350.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3520486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, '1589386733.png', 3, NULL, NULL, 'DAF2DB', '2019-12-21 04:32:37', '2021-04-26 02:59:12', 1, NULL, 1, 'yearly', 8),
(44, 169, 'E-commerce', '700.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e53686f7070696e67204361727420776974682052656163743c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e416476616e636564205365617263682046696c7465723c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e53696e676c652056656e646f723c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e4c6f676f2044657369676e20496e636c756465643c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e32205265766973696f6e20417661696c61626c653c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e537570706f727420417661696c61626c653c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e536f7572636520436f646520496e636c756465643c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f666f6e743e3c2f6469763e, '6078020a1a25c.png', 4, NULL, NULL, NULL, '2019-12-21 04:33:04', '2021-04-26 02:59:12', 1, NULL, 1, 'monthly', 1),
(45, 169, 'Advanced Plutinum', '900.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e35302048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e313020486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 5, NULL, NULL, NULL, '2019-12-21 04:33:43', '2021-04-26 02:59:12', 0, NULL, 1, 'yearly', 7);

-- --------------------------------------------------------

--
-- Table structure for table `package_categories`
--

CREATE TABLE `package_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `serial_number` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_categories`
--

INSERT INTO `package_categories` (`id`, `language_id`, `name`, `status`, `serial_number`, `created_at`, `updated_at`) VALUES
(1, 169, 'Web Development', 1, 1, '2021-04-20 03:35:48', '2021-04-20 03:35:48'),
(7, 169, 'Mobile App', 1, 2, '2021-04-26 02:37:04', '2021-04-26 02:37:04'),
(8, 169, 'Marketting', 1, 3, '2021-04-26 02:37:15', '2021-04-26 02:37:15');

-- --------------------------------------------------------

--
-- Table structure for table `package_inputs`
--

CREATE TABLE `package_inputs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL COMMENT '1-text, 2-select, 3-checkbox, 4-textarea, 5-file',
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `required` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - required, 0 - optional',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_inputs`
--

INSERT INTO `package_inputs` (`id`, `language_id`, `type`, `label`, `name`, `placeholder`, `required`, `created_at`, `updated_at`) VALUES
(58, 169, 1, 'Contact Number', 'contact_number', 'Enter Contact Number', 1, '2019-12-26 05:28:19', '2019-12-26 05:28:19'),
(101, 169, 2, 'Country', 'Country', 'Select a country', 0, '2021-02-21 01:33:46', '2021-02-21 01:33:46'),
(102, 169, 5, 'Document', 'Document', NULL, 0, '2021-02-21 01:34:12', '2021-04-15 13:32:13'),
(103, 169, 3, 'Options', 'Options', NULL, 1, '2021-02-21 01:35:50', '2021-02-21 01:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `package_input_options`
--

CREATE TABLE `package_input_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_input_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_input_options`
--

INSERT INTO `package_input_options` (`id`, `package_input_id`, `name`, `created_at`, `updated_at`) VALUES
(137, 88, 'Service 2', '2020-01-31 03:28:46', '2020-01-31 03:28:46'),
(138, 88, 'Service 2', '2020-01-31 03:28:46', '2020-01-31 03:28:46'),
(148, 101, 'USA', '2021-02-21 01:33:46', '2021-02-21 01:33:46'),
(149, 101, 'Australia', '2021-02-21 01:33:46', '2021-02-21 01:33:46'),
(150, 101, 'Newzealand', '2021-02-21 01:33:46', '2021-02-21 01:33:46'),
(151, 103, 'Option 1', '2021-02-21 01:35:51', '2021-02-21 01:35:51'),
(152, 103, 'Option 2', '2021-02-21 01:35:51', '2021-02-21 01:35:51'),
(153, 103, 'Option 3', '2021-02-21 01:35:51', '2021-02-21 01:35:51'),
(157, 104, 'EUA', '2021-02-21 01:38:12', '2021-02-21 01:38:12'),
(158, 104, 'Austrália', '2021-02-21 01:38:12', '2021-02-21 01:38:12'),
(159, 104, 'Nova Zelândia', '2021-02-21 01:38:12', '2021-02-21 01:38:12'),
(160, 106, 'Option 1', '2021-02-21 01:38:58', '2021-02-21 01:38:58'),
(161, 106, 'Option 2', '2021-02-21 01:38:58', '2021-02-21 01:38:58'),
(162, 106, 'Option 3', '2021-02-21 01:38:58', '2021-02-21 01:38:58'),
(163, 107, 'USA', '2021-02-21 01:39:51', '2021-02-21 01:39:51'),
(164, 107, 'Australia', '2021-02-21 01:39:51', '2021-02-21 01:39:51'),
(165, 107, 'Newzealand', '2021-02-21 01:39:51', '2021-02-21 01:39:51'),
(166, 109, 'seçenek 1', '2021-02-21 01:40:44', '2021-02-21 01:40:44'),
(167, 109, 'seçenek 2', '2021-02-21 01:40:44', '2021-02-21 01:40:44'),
(168, 109, 'seçenek 3', '2021-02-21 01:40:44', '2021-02-21 01:40:44'),
(169, 110, 'USA', '2021-02-21 01:41:34', '2021-02-21 01:41:34'),
(170, 110, 'Australia', '2021-02-21 01:41:34', '2021-02-21 01:41:34'),
(171, 110, 'Newzealand', '2021-02-21 01:41:34', '2021-02-21 01:41:34'),
(172, 112, 'الخيار 1', '2021-02-21 01:42:48', '2021-02-21 01:42:48'),
(173, 112, 'الخيار 2', '2021-02-21 01:42:48', '2021-02-21 01:42:48'),
(174, 112, 'الخيار 3', '2021-02-21 01:42:48', '2021-02-21 01:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `package_orders`
--

CREATE TABLE `package_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `order_number` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fields` text DEFAULT NULL,
  `package_title` varchar(255) DEFAULT NULL,
  `package_price` decimal(11,2) DEFAULT NULL,
  `package_description` blob DEFAULT NULL,
  `invoice` varchar(100) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-pending, 1-prcessing, 2-completed, 3-rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receipt` varchar(100) DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - pending, 1 - completed',
  `gateway_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_orders`
--

INSERT INTO `package_orders` (`id`, `user_id`, `package_id`, `order_number`, `name`, `email`, `fields`, `package_title`, `package_price`, `package_description`, `invoice`, `method`, `status`, `created_at`, `updated_at`, `receipt`, `payment_status`, `gateway_type`) VALUES
(301, NULL, 41, '1000000301', 'tom1', 'megasoft.envato@gmail.com', '{\"contact_number\":{\"value\":\"23632\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, 'dZJm1618553543.pdf', 'Mollie Payment', 0, '2021-04-16 02:12:02', '2021-04-16 02:12:23', NULL, 1, 'online'),
(302, NULL, 45, '1000000302', 'Drake', 'megasoft.envato@gmail.com', '{\"contact_number\":{\"value\":\"23236\",\"type\":1},\"Country\":{\"value\":\"Australia\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Advanced Plutinum', '900.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e35302048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e313020486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, 'dldV1618553677.pdf', 'Mollie Payment', 0, '2021-04-16 02:14:29', '2021-04-16 02:14:37', NULL, 1, 'online'),
(304, 26, 41, '1000000304', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:13:36', '2021-04-24 12:13:36', NULL, 0, 'online'),
(305, 26, 41, '1000000305', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:15:05', '2021-04-24 12:15:05', NULL, 0, 'online'),
(306, 26, 41, '1000000306', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:16:18', '2021-04-24 12:16:18', NULL, 0, 'online'),
(307, 26, 41, '1000000307', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:17:49', '2021-04-24 12:17:49', NULL, 0, 'online'),
(308, 26, 41, '1000000308', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:18:45', '2021-04-24 12:18:45', NULL, 0, 'online'),
(309, 26, 41, '1000000309', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:19:41', '2021-04-24 12:19:41', NULL, 0, 'online'),
(310, 26, 41, '1000000310', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:19:52', '2021-04-24 12:19:52', NULL, 0, 'online'),
(311, 26, 41, '1000000311', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:22:37', '2021-04-24 12:22:37', NULL, 0, 'online'),
(312, 26, 41, '1000000312', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:26:03', '2021-04-24 12:26:03', NULL, 0, 'online'),
(313, 26, 41, '1000000313', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:27:31', '2021-04-24 12:27:31', NULL, 0, 'online'),
(314, 26, 41, '1000000314', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:29:13', '2021-04-24 12:29:13', NULL, 0, 'online'),
(315, 26, 41, '1000000315', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"Newzealand\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:31:12', '2021-04-24 12:31:12', NULL, 0, 'online'),
(316, 26, 41, '1000000316', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:38:47', '2021-04-24 12:38:47', NULL, 0, 'online'),
(317, 26, 41, '1000000317', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:41:57', '2021-04-24 12:41:57', NULL, 0, 'online'),
(318, 26, 41, '1000000318', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"Newzealand\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:43:25', '2021-04-24 12:43:25', NULL, 0, 'online'),
(319, 26, 41, '1000000319', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"23237237\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 3\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-24 12:45:51', '2021-04-24 12:45:51', NULL, 0, 'online'),
(320, 26, 40, '1000000320', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"737\",\"type\":1},\"Country\":{\"value\":\"Australia\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Basic Package', '100.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e372048544d4c2050616765733c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3120486f6d6520506167653c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e434d532056657273696f6e204e6f7420417661696c61626c653c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e4c6f676f2044657369676e20496e636c756465643c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e31205265766973696f6e20417661696c61626c653c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e4e6f20537570706f727420417661696c61626c653c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e536f7572636520436f646520496e636c756465643c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e3c62723e3c2f666f6e743e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c666f6e742073697a653d2233223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f666f6e743e3c2f6469763e, NULL, 'PayUmoney', 0, '2021-04-25 03:36:04', '2021-04-25 03:36:04', NULL, 0, 'online'),
(321, 26, 41, '1000000321', 'John', 'user@gmail.com', '{\"contact_number\":{\"value\":\"737\",\"type\":1},\"Country\":{\"value\":\"USA\",\"type\":2},\"Options\":{\"value\":[\"Option 2\"],\"type\":3}}', 'Golden Package', '180.00', 0x3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e31352048544d4c2050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3320486f6d652050616765733c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e434d532056657273696f6e204e6f7420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4c6f676f2044657369676e20496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e32205265766973696f6e20417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4e6f20537570706f727420417661696c61626c653c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e536f7572636520436f646520496e636c756465643c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e3c62723e3c2f6469763e3c646976207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e6c79204f6e6520446f6d61696e20416c6c6f7765643c2f6469763e, 'rgb81619416182.pdf', 'Mollie Payment', 0, '2021-04-26 01:49:31', '2021-04-26 01:49:42', NULL, 1, 'online');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `components` longtext DEFAULT NULL,
  `styles` longtext DEFAULT NULL,
  `html` longtext DEFAULT NULL,
  `css` longtext DEFAULT NULL,
  `body` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `language_id`, `name`, `title`, `subtitle`, `slug`, `status`, `serial_number`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`, `components`, `styles`, `html`, `css`, `body`) VALUES
(1, 169, 'Aboute Us', 'STEM\'s Water Tale', 'STEM\'s Water Tale', 'Aboute-Us', 1, 1, NULL, NULL, '2024-05-09 04:13:02', '2024-05-14 04:54:12', '[{\"attributes\":{\"id\":\"i7cl\"}},{\"type\":\"custom-code\",\"droppable\":1,\"attributes\":{\"id\":\"i2gu\"},\"components\":[{\"tagName\":\"section\",\"classes\":[\"page-title-section\"],\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\"],\"components\":[{\"classes\":[\"col-xl-12\",\"text-center\"],\"components\":[{\"classes\":[\"page-title-content\"],\"components\":[{\"tagName\":\"h3\",\"type\":\"text\",\"classes\":[\"title\",\"text-white\",\"bud-title\"],\"components\":[{\"type\":\"textnode\",\"content\":\"STEM\'s Water Tale\\n          \"}]},{\"tagName\":\"nav\",\"attributes\":{\"aria-label\":\"breadcrumb\"},\"components\":[{\"tagName\":\"ol\",\"classes\":[\"breadcrumb\"],\"components\":[{\"tagName\":\"li\",\"classes\":[\"breadcrumb-item\"],\"components\":[{\"type\":\"link\",\"attributes\":{\"href\":\"index.html\"},\"components\":[{\"type\":\"textnode\",\"content\":\"Home\"}]}]},{\"tagName\":\"li\",\"type\":\"text\",\"classes\":[\"breadcrumb-item\",\"active\"],\"attributes\":{\"aria-current\":\"page\"},\"components\":[{\"type\":\"textnode\",\"content\":\"STEM\'s Water Tale\\n              \"}]}]}]}]}]}]}]}]},{\"classes\":[\"section-content\"],\"components\":[{\"tagName\":\"section\",\"classes\":[\"project-details-page\",\"pdt-60\",\"pdb-60\"],\"attributes\":{\"data-background\":\"assets/stem/images/abs-bg5.png\"},\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\",\"mrb-60\"],\"components\":[{\"classes\":[\"col-xl-12\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"pdt-20\",\"pdb-20\",\"text-center\",\"stem_tale\"],\"components\":[{\"type\":\"textnode\",\"content\":\"STEM\'s Water Tale\\n          \"}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.\\n          \"}]},{\"classes\":[\"col-xl-12\"],\"components\":[{\"tagName\":\"h3\",\"type\":\"text\",\"classes\":[\"pdt-20\",\"pdb-20\",\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Main Objectives\\n            \"}]}]},{\"classes\":[\"col-xl-12\",\"text-center\"],\"components\":[{\"tagName\":\"p\",\"type\":\"text\",\"components\":[{\"tagName\":\"span\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"1. \"}]},{\"type\":\"textnode\",\"content\":\"Distribute and sell water to municipalities and regions in Maharashtra and beyond.\\n            \"}]},{\"tagName\":\"p\",\"type\":\"text\",\"components\":[{\"tagName\":\"span\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"2. \"}]},{\"type\":\"textnode\",\"content\":\"Engage in water distribution, supply, and related infrastructure projects worldwide.\\n            \"}]},{\"tagName\":\"p\",\"type\":\"text\",\"components\":[{\"tagName\":\"span\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"3. \"}]},{\"type\":\"textnode\",\"content\":\"Provide environmental and infrastructure services to urban areas.\\n            \"}]},{\"tagName\":\"p\",\"type\":\"text\",\"components\":[{\"tagName\":\"span\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"4. \"}]},{\"type\":\"textnode\",\"content\":\"Offer consultancy services in various geographical regions\\n            \"}]},{\"tagName\":\"p\",\"type\":\"text\",\"components\":[{\"tagName\":\"span\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"5. \"}]},{\"type\":\"textnode\",\"content\":\"Undertake projects related to sanitation, health, waste management, and infrastructure development.\\n            \"}]}]}]}]},{\"classes\":[\"row\"],\"components\":[{\"classes\":[\"row\",\"mrb-60\"],\"components\":[{\"classes\":[\"col-xl-6\",\"with-divider\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"pdt-20\",\"pdb-20\",\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Our Insight\\n            \"}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"text-center\",\"pdt-20\",\"pdb-20\"],\"components\":[{\"type\":\"textnode\",\"content\":\"\\\"To be a leading provider of sustainable water distribution and infrastructure solutions, ensuring reliable water supply to our stakeholders and contributing to the well-being and development of the communities we serve.\\\"\\n            \"}]}]},{\"classes\":[\"col-xl-6\",\"with-divider\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"pdt-20\",\"pdb-20\",\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Our Pledge\\n            \"}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"text-center\",\"pdt-20\",\"pdb-20\"],\"components\":[{\"type\":\"textnode\",\"content\":\"\\\"Our mission is to provide reliable, sustainable, and accessible water services to communities, ensuring their well-being and prosperity. We are committed to innovation, responsible resource management, and delivering exceptional customer service.\\\"\\n            \"}]}]}]}]}]}]},{\"tagName\":\"section\",\"classes\":[\"about-section\",\"anim-object\",\"pdt-40\",\"pdb-40\",\"pdb-lg-80\"],\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\",\"align-items-center\"],\"components\":[{\"classes\":[\"col-md-12\",\"col-xl-6\"],\"components\":[{\"classes\":[\"about-image-block\",\"mrb-lg-60\"],\"components\":[{\"type\":\"image\",\"classes\":[\"img-full\"],\"attributes\":{\"src\":\"assets/stem/images/5.png\",\"alt\":\"\",\"loading\":\"lazy\"}}]}]},{\"classes\":[\"col-md-12\",\"col-xl-6\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"mrb-30\",\"text-primary-color\"],\"components\":[{\"type\":\"textnode\",\"content\":\"MD Message\\n          \"}]},{\"type\":\"table\",\"classes\":[\"table\",\"table-bordered\",\"table-striped\",\"table-hover\",\"text-center\"],\"components\":[{\"type\":\"thead\",\"components\":[{\"type\":\"row\",\"components\":[{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"Name\\n                \"}]},{\"type\":\"cell\",\"attributes\":{\"rowspan\":\"1\"},\"components\":[{\"type\":\"textnode\",\"content\":\"Mr.Sanket Mohan Gharat\\n                \"}]}]},{\"type\":\"row\",\"components\":[{\"tagName\":\"th\",\"type\":\"cell\",\"attributes\":{\"id\":\"ih6kk\"},\"components\":[{\"type\":\"textnode\",\"content\":\"Educational Qualification\\n                \"}]},{\"type\":\"cell\",\"components\":[{\"tagName\":\"ul\",\"components\":[{\"tagName\":\"span\",\"components\":[{\"tagName\":\"i\",\"type\":\"text\",\"classes\":[\"fa-solid\",\"fa-caret-right\",\"fa-2xs\"],\"components\":[{\"type\":\"textnode\",\"content\":\"\\n                      \"}]}]},{\"tagName\":\"li\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"M.Tech(pursuing) Urban Studies/Affairs, IIT Bombay\\n                    \"}]},{\"tagName\":\"br\",\"void\":true},{\"tagName\":\"span\",\"components\":[{\"tagName\":\"i\",\"type\":\"text\",\"classes\":[\"fa-solid\",\"fa-caret-right\",\"fa-2xs\"],\"components\":[{\"type\":\"textnode\",\"content\":\"\\n                      \"}]}]},{\"tagName\":\"li\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"MBA (Marketing), Sikkim Manipal University\\n                    \"}]},{\"tagName\":\"br\",\"void\":true},{\"tagName\":\"span\",\"components\":[{\"tagName\":\"i\",\"type\":\"text\",\"classes\":[\"fa-solid\",\"fa-caret-right\",\"fa-2xs\"],\"components\":[{\"type\":\"textnode\",\"content\":\"\\n                      \"}]}]},{\"tagName\":\"li\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"B.E Civil, Datta Meghe College of Engineering\\n                    \"}]}]}]}]}]}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"mrb-40\",\"Msg\"],\"attributes\":{\"id\":\"i0atld\"},\"components\":[{\"type\":\"textnode\",\"content\":\"At STEM, we understand the importance of ensuring sustainable water management and promoting the well-being of the communities we serve. Through our innovative solutions and dedication, we strive to contribute to the development and growth of the regions we operate in.\\n            I encourage collaboration, creativity, and a customer-centric approach within our organization. Together, we will continue to enhance our operational excellence and deliver high-quality services that meet the evolving needs of our customers.\\n            I extend my gratitude to our valued customers and partners for their trust and support. We are committed to exceeding your expectations and being at the forefront of advancements in the water industry.\\n            Thank you for being a part of our journey as we work towards a future of efficient water distribution and infrastructure development.\\n          \"}]},{\"classes\":[\"row\"],\"components\":[{\"classes\":[\"col-lg-6\"],\"components\":[{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"ceomsg\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Sincerely,\\n              \"}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"ceomsg\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Sanket Mohan Gharat.\\n              \"}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"ceomsg\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Managing Director.\\n              \"}]}]}]}]}]}]}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" Page Title End \"},{\"tagName\":\"section\",\"classes\":[\"content\",\"pdt-60\",\"pdb-50\"],\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\",\"mrb-60\"],\"components\":[{\"classes\":[\"col-xl-12\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"dt-20\",\"pdb-20\",\"text-center\",\"stem-info\"],\"components\":[{\"type\":\"textnode\",\"content\":\"STEM Information About Area and Municipal Corporations\\n          \"}]}]}]},{\"classes\":[\"table-responsive\"],\"components\":[{\"type\":\"table\",\"classes\":[\"table\",\"table-bordered\",\"table-striped\",\"table-hover\",\"text-center\"],\"components\":[{\"type\":\"thead\",\"classes\":[\"back_color\"],\"components\":[{\"type\":\"row\",\"components\":[{\"tagName\":\"th\",\"type\":\"cell\",\"attributes\":{\"colspan\":\"2\"},\"components\":[{\"type\":\"textnode\",\"content\":\"Name of Shareholders\\n              \"}]},{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"Shareholder Stake\\n              \"}]},{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"Irrigation Department Water Sanctioned Quota\\n              \"}]}]}]},{\"type\":\"tbody\",\"components\":[{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"1. \\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Thane Municipal Corporation, Thane\\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"49.78℅\\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"119 MLD\\n              \"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"2. \\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Mira Bhayandar Municipal Corporation\\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"32.55℅\\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"86 MLD\\n              \"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"3. \\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Bhiwandi Nizampur City Municipal Corporation, Bhiwandi\\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"14.68℅\\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"71 MLD\\n              \"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"4. \\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"34 VILLAGES in Bhiwandi taluka and Thane Dist\\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"2.99℅\\n              \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"40 MLD\\n              \"}]}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" Add more rows as needed \"}]}]}]}]}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" Footer Area Start \"}]}],\"activeOnRender\":0,\"custom-code-plugin__code\":\"<section class=\\\"page-title-section\\\">\\n  <div class=\\\"container\\\">\\n    <div class=\\\"row\\\">\\n      <div class=\\\"col-xl-12 text-center\\\">\\n        <div class=\\\"page-title-content\\\">\\n          <h3 class=\\\"title text-white bud-title\\\">STEM\'s Water Tale\\n          </h3>\\n          <nav aria-label=\\\"breadcrumb\\\">\\n            <ol class=\\\"breadcrumb\\\">\\n              <li class=\\\"breadcrumb-item\\\">\\n                <a href=\\\"index.html\\\">Home</a>\\n              </li>\\n              <li class=\\\"breadcrumb-item active\\\" aria-current=\\\"page\\\">STEM\'s Water Tale\\n              </li>\\n            </ol>\\n          </nav>\\n        </div>\\n      </div>\\n    </div>\\n  </div>\\n</section>\\n<div class=\\\"section-content\\\">\\n  <section class=\\\"project-details-page pdt-60 pdb-60\\\" data-background=\\\"assets/stem/images/abs-bg5.png\\\">\\n    <div class=\\\"container\\\">\\n      <div class=\\\"row mrb-60\\\">\\n        <div class=\\\"col-xl-12\\\">\\n          <h2 class=\\\" pdt-20 pdb-20 text-center stem_tale\\\">STEM\'s Water Tale\\n          </h2>\\n          <p class=\\\"text-center\\\">STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.\\n          </p>\\n          <div class=\\\"col-xl-12\\\">\\n            <h3 class=\\\" pdt-20 pdb-20 text-center\\\">Main Objectives\\n            </h3>\\n          </div>\\n          <div class=\\\"col-xl-12 text-center\\\">\\n            <p>\\n              <span>1. </span>Distribute and sell water to municipalities and regions in Maharashtra and beyond.\\n            </p>\\n            <p>\\n              <span>2. </span>Engage in water distribution, supply, and related infrastructure projects worldwide.\\n            </p>\\n            <p>\\n              <span>3. </span>Provide environmental and infrastructure services to urban areas.\\n            </p>\\n            <p>\\n              <span>4. </span>Offer consultancy services in various geographical regions\\n            </p>\\n            <p>\\n              <span>5. </span>Undertake projects related to sanitation, health, waste management, and infrastructure development.\\n            </p>\\n          </div>\\n        </div>\\n      </div>\\n      <div class=\\\"row\\\">\\n        <div class=\\\"row mrb-60\\\">\\n          <div class=\\\"col-xl-6 with-divider\\\">\\n            <h2 class=\\\" pdt-20 pdb-20 text-center\\\">Our Insight\\n            </h2>\\n            <p class=\\\"text-center  pdt-20 pdb-20\\\">\\\"To be a leading provider of sustainable water distribution and infrastructure solutions, ensuring reliable water supply to our stakeholders and contributing to the well-being and development of the communities we serve.\\\"\\n            </p>\\n          </div>\\n          <div class=\\\"col-xl-6  with-divider\\\">\\n            <h2 class=\\\" pdt-20 pdb-20 text-center\\\">Our Pledge\\n            </h2>\\n            <p class=\\\"text-center pdt-20 pdb-20\\\">\\\"Our mission is to provide reliable, sustainable, and accessible water services to communities, ensuring their well-being and prosperity. We are committed to innovation, responsible resource management, and delivering exceptional customer service.\\\"\\n            </p>\\n          </div>\\n        </div>\\n      </div>\\n    </div>\\n  </section>\\n  <section class=\\\"about-section anim-object pdt-40 pdb-40 pdb-lg-80\\\">\\n    <div class=\\\"container\\\">\\n      <div class=\\\"row align-items-center\\\">\\n        <div class=\\\"col-md-12 col-xl-6\\\">\\n          <div class=\\\"about-image-block mrb-lg-60\\\">\\n            <img class=\\\"img-full\\\" src=\\\"assets/stem/images/5.png\\\" alt=\\\"\\\" loading=\\\"lazy\\\">\\n          </div>\\n        </div>\\n        <div class=\\\"col-md-12 col-xl-6\\\">\\n          <h2 class=\\\"mrb-30 text-primary-color\\\">MD Message\\n          </h2>\\n          <table  class=\\\"table table-bordered table-striped table-hover text-center\\\">\\n            <thead>\\n              <tr>\\n                <th>Name\\n                </th>\\n                <td rowspan=\\\"1\\\">Mr.Sanket Mohan Gharat\\n                </td>\\n              </tr>\\n              <tr>\\n                <th style=\\\"vertical-align: text-top !important;\\\">Educational Qualification\\n                </th>\\n                <td>\\n                  <ul>\\n                    <span><i class=\\\"fa-solid fa-caret-right fa-2xs\\\">\\n                      </i></span> \\n                    <li>M.Tech(pursuing) Urban Studies/Affairs, IIT Bombay\\n                    </li>\\n                    <br>\\n                    <span><i class=\\\"fa-solid fa-caret-right fa-2xs\\\">\\n                      </i></span> \\n                    <li>MBA (Marketing), Sikkim Manipal University\\n                    </li>\\n                    <br>\\n                    <span><i class=\\\"fa-solid fa-caret-right fa-2xs\\\">\\n                      </i></span> \\n                    <li>B.E Civil, Datta Meghe College of Engineering\\n                    </li>\\n                  </ul>\\n                </td>\\t\\n              </tr>\\n            </thead>\\n          </table>\\n          <p class=\\\"mrb-40 Msg\\\" style=\\\"text-align: justify;\\\">At STEM, we understand the importance of ensuring sustainable water management and promoting the well-being of the communities we serve. Through our innovative solutions and dedication, we strive to contribute to the development and growth of the regions we operate in.\\n            I encourage collaboration, creativity, and a customer-centric approach within our organization. Together, we will continue to enhance our operational excellence and deliver high-quality services that meet the evolving needs of our customers.\\n            I extend my gratitude to our valued customers and partners for their trust and support. We are committed to exceeding your expectations and being at the forefront of advancements in the water industry.\\n            Thank you for being a part of our journey as we work towards a future of efficient water distribution and infrastructure development.\\n          </p>\\n          <div class=\\\"row\\\">\\n            <div class=\\\"col-lg-6\\\">\\n              <p class=\\\"ceomsg\\\">Sincerely,\\n              </p>\\n              <p class=\\\"ceomsg\\\">Sanket Mohan Gharat.\\n              </p>\\n              <p class=\\\"ceomsg\\\">Managing Director.\\n              </p>\\n            </div>\\n          </div>\\n          </div>\\n      </div>\\n    </div>\\n  </section>\\n  <!-- Page Title End -->\\n  <section class=\\\"content pdt-60 pdb-50\\\">\\n    <div class=\\\"container\\\">\\n      <div class=\\\"row mrb-60\\\">\\n        <div class=\\\"col-xl-12\\\">\\n          <h2 class=\\\"dt-20 pdb-20 text-center stem-info\\\">STEM Information About Area and Municipal Corporations\\n          </h2>\\n        </div>\\n      </div>\\n      <div class=\\\"table-responsive\\\">\\n        <table class=\\\"table table-bordered table-striped table-hover text-center\\\">\\n          <thead class=\\\"back_color\\\">\\n            <tr>\\n              <th colspan=\\\"2\\\">Name of Shareholders\\n              </th>\\n              <th>Shareholder Stake\\n              </th>\\n              <th>Irrigation Department Water Sanctioned Quota\\n              </th>\\n            </tr>\\n          </thead>\\n          <tbody>\\n            <tr>\\n              <td class=\\\"text-center\\\">1. \\n              </td>\\n              <td class=\\\"text-center\\\">Thane Municipal Corporation, Thane\\n              </td>\\n              <td class=\\\"text-center\\\">49.78&incare;\\n              </td>\\n              <td class=\\\"text-center\\\">119 MLD\\n              </td>\\n            </tr>\\n            <tr>\\n              <td class=\\\"text-center\\\">2. \\n              </td>\\n              <td class=\\\"text-center\\\">Mira Bhayandar Municipal Corporation\\n              </td>\\n              <td class=\\\"text-center\\\">32.55&incare;\\n              </td>\\n              <td class=\\\"text-center\\\">86 MLD\\n              </td>\\n            </tr>\\n            <tr>\\n              <td class=\\\"text-center\\\">3. \\n              </td>\\n              <td class=\\\"text-center\\\">Bhiwandi Nizampur City Municipal Corporation, Bhiwandi\\n              </td>\\n              <td class=\\\"text-center\\\">14.68&incare;\\n              </td>\\n              <td class=\\\"text-center\\\">71 MLD\\n              </td>\\n            </tr>\\n            <tr>\\n              <td class=\\\"text-center\\\">4. \\n              </td>\\n              <td class=\\\"text-center\\\">34 VILLAGES in Bhiwandi taluka and Thane Dist\\n              </td>\\n              <td class=\\\"text-center\\\">2.99&incare;\\n              </td>\\n              <td class=\\\"text-center\\\">40 MLD\\n              </td>\\n            </tr>\\n            <!-- Add more rows as needed -->\\n          </tbody>\\n        </table>\\n      </div>\\n    </div>\\n  </section>\\n  <!-- Footer Area Start -->\\n</div>\"}]', '[{\"selectors\":[\"#wrapper\"],\"wrapper\":1},{\"selectors\":[\"#i7cl\"]},{\"selectors\":[{\"name\":\"pbrow\",\"private\":1}],\"style\":{\"display\":\"flex\",\"justify-content\":\"flex-start\",\"align-items\":\"stretch\",\"flex-wrap\":\"nowrap\",\"padding\":\"10px\"}},{\"selectors\":[{\"name\":\"pbrow\",\"private\":1}],\"style\":{\"flex-wrap\":\"wrap\"},\"mediaText\":\"(max-width: 768px)\",\"atRuleType\":\"media\"},{\"selectors\":[{\"name\":\"cell\",\"private\":1}],\"style\":{\"min-height\":\"75px\",\"flex-grow\":\"1\",\"flex-basis\":\"100%\"}},{\"selectors\":[\"cell30\"],\"style\":{\"width\":\"30%\"}},{\"selectors\":[\"cell70\"],\"style\":{\"width\":\"70%\"}},{\"selectors\":[\"#i2gu\"]},{\"selectors\":[\"#ivmqp\"]},{\"selectors\":[\"#ia07j8\"]},{\"selectors\":[\"#id96q\"]},{\"selectors\":[\"#iunof\"]},{\"selectors\":[\"#i5ynm\"]},{\"selectors\":[\"#ih6kk\"],\"style\":{\"vertical-align\":\"text-top !important\"}},{\"selectors\":[\"#i0atld\"],\"style\":{\"text-align\":\"justify\"}}]', '<script type=\'text/javascript\' src=\'http://localhost:8002/assets/customeJs/1.js\'></script><div class=\'pagebuilder-content\'><div id=\"i7cl\"></div><div id=\"i2gu\"><section class=\"page-title-section\"><div class=\"container\"><div class=\"row\"><div class=\"col-xl-12 text-center\"><div class=\"page-title-content\"><h3 class=\"title text-white bud-title\">STEM&#039;s Water Tale\r\n          </h3><nav aria-label=\"breadcrumb\"><ol class=\"breadcrumb\"><li class=\"breadcrumb-item\"><a href=\"index.html\">Home</a></li><li aria-current=\"page\" class=\"breadcrumb-item active\">STEM&#039;s Water Tale\r\n              </li></ol></nav></div></div></div></div></section><div class=\"section-content\"><section data-background=\"assets/stem/images/abs-bg5.png\" class=\"project-details-page pdt-60 pdb-60\"><div class=\"container\"><div class=\"row mrb-60\"><div class=\"col-xl-12\"><h2 class=\"pdt-20 pdb-20 text-center stem_tale\">STEM&#039;s Water Tale\r\n          </h2><p class=\"text-center\">STEM Water Distribution &amp; Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.\r\n          </p><div class=\"col-xl-12\"><h3 class=\"pdt-20 pdb-20 text-center\">Main Objectives\r\n            </h3></div><div class=\"col-xl-12 text-center\"><p><span>1. </span>Distribute and sell water to municipalities and regions in Maharashtra and beyond.\r\n            </p><p><span>2. </span>Engage in water distribution, supply, and related infrastructure projects worldwide.\r\n            </p><p><span>3. </span>Provide environmental and infrastructure services to urban areas.\r\n            </p><p><span>4. </span>Offer consultancy services in various geographical regions\r\n            </p><p><span>5. </span>Undertake projects related to sanitation, health, waste management, and infrastructure development.\r\n            </p></div></div></div><div class=\"row\"><div class=\"row mrb-60\"><div class=\"col-xl-6 with-divider\"><h2 class=\"pdt-20 pdb-20 text-center\">Our Insight\r\n            </h2><p class=\"text-center pdt-20 pdb-20\">&quot;To be a leading provider of sustainable water distribution and infrastructure solutions, ensuring reliable water supply to our stakeholders and contributing to the well-being and development of the communities we serve.&quot;\r\n            </p></div><div class=\"col-xl-6 with-divider\"><h2 class=\"pdt-20 pdb-20 text-center\">Our Pledge\r\n            </h2><p class=\"text-center pdt-20 pdb-20\">&quot;Our mission is to provide reliable, sustainable, and accessible water services to communities, ensuring their well-being and prosperity. We are committed to innovation, responsible resource management, and delivering exceptional customer service.&quot;\r\n            </p></div></div></div></div></section><section class=\"about-section anim-object pdt-40 pdb-40 pdb-lg-80\"><div class=\"container\"><div class=\"row align-items-center\"><div class=\"col-md-12 col-xl-6\"><div class=\"about-image-block mrb-lg-60\"><img src=\"assets/stem/images/5.png\" alt=\"\" loading=\"lazy\" class=\"img-full\"/></div></div><div class=\"col-md-12 col-xl-6\"><h2 class=\"mrb-30 text-primary-color\">MD Message\r\n          </h2><table class=\"table table-bordered table-striped table-hover text-center\"><thead><tr><th>Name\r\n                </th><td rowspan=\"1\">Mr.Sanket Mohan Gharat\r\n                </td></tr><tr><th id=\"ih6kk\">Educational Qualification\r\n                </th><td><ul><span><i class=\"fa-solid fa-caret-right fa-2xs\">\r\n                      </i></span><li>M.Tech(pursuing) Urban Studies/Affairs, IIT Bombay\r\n                    </li><br/><span><i class=\"fa-solid fa-caret-right fa-2xs\">\r\n                      </i></span><li>MBA (Marketing), Sikkim Manipal University\r\n                    </li><br/><span><i class=\"fa-solid fa-caret-right fa-2xs\">\r\n                      </i></span><li>B.E Civil, Datta Meghe College of Engineering\r\n                    </li></ul></td></tr></thead></table><p class=\"mrb-40 Msg\" id=\"i0atld\">At STEM, we understand the importance of ensuring sustainable water management and promoting the well-being of the communities we serve. Through our innovative solutions and dedication, we strive to contribute to the development and growth of the regions we operate in.\r\n            I encourage collaboration, creativity, and a customer-centric approach within our organization. Together, we will continue to enhance our operational excellence and deliver high-quality services that meet the evolving needs of our customers.\r\n            I extend my gratitude to our valued customers and partners for their trust and support. We are committed to exceeding your expectations and being at the forefront of advancements in the water industry.\r\n            Thank you for being a part of our journey as we work towards a future of efficient water distribution and infrastructure development.\r\n          </p><div class=\"row\"><div class=\"col-lg-6\"><p class=\"ceomsg\">Sincerely,\r\n              </p><p class=\"ceomsg\">Sanket Mohan Gharat.\r\n              </p><p class=\"ceomsg\">Managing Director.\r\n              </p></div></div></div></div></div></section><!-- Page Title End --><section class=\"content pdt-60 pdb-50\"><div class=\"container\"><div class=\"row mrb-60\"><div class=\"col-xl-12\"><h2 class=\"dt-20 pdb-20 text-center stem-info\">STEM Information About Area and Municipal Corporations\r\n          </h2></div></div><div class=\"table-responsive\"><table class=\"table table-bordered table-striped table-hover text-center\"><thead class=\"back_color\"><tr><th colspan=\"2\">Name of Shareholders\r\n              </th><th>Shareholder Stake\r\n              </th><th>Irrigation Department Water Sanctioned Quota\r\n              </th></tr></thead><tbody><tr><td class=\"text-center\">1. \r\n              </td><td class=\"text-center\">Thane Municipal Corporation, Thane\r\n              </td><td class=\"text-center\">49.78℅\r\n              </td><td class=\"text-center\">119 MLD\r\n              </td></tr><tr><td class=\"text-center\">2. \r\n              </td><td class=\"text-center\">Mira Bhayandar Municipal Corporation\r\n              </td><td class=\"text-center\">32.55℅\r\n              </td><td class=\"text-center\">86 MLD\r\n              </td></tr><tr><td class=\"text-center\">3. \r\n              </td><td class=\"text-center\">Bhiwandi Nizampur City Municipal Corporation, Bhiwandi\r\n              </td><td class=\"text-center\">14.68℅\r\n              </td><td class=\"text-center\">71 MLD\r\n              </td></tr><tr><td class=\"text-center\">4. \r\n              </td><td class=\"text-center\">34 VILLAGES in Bhiwandi taluka and Thane Dist\r\n              </td><td class=\"text-center\">2.99℅\r\n              </td><td class=\"text-center\">40 MLD\r\n              </td></tr><!-- Add more rows as needed --></tbody></table></div></div></section><!-- Footer Area Start --></div></div></div>', '* { box-sizing: border-box; } body {margin: 0;}#ih6kk{vertical-align:text-top !important;}#i0atld{text-align:justify;}', NULL);
INSERT INTO `pages` (`id`, `language_id`, `name`, `title`, `subtitle`, `slug`, `status`, `serial_number`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`, `components`, `styles`, `html`, `css`, `body`) VALUES
(2, 170, 'आमच्याबद्दल', 'STEM च्या पाण्याची कथा', 'STEM च्या पाण्याची कथा', 'आमच्याबद्दल', 1, 0, NULL, NULL, '2024-05-10 01:23:10', '2024-05-10 02:15:25', '[{\"type\":\"custom-code\",\"droppable\":1,\"attributes\":{\"id\":\"i0h6\"},\"components\":[{\"tagName\":\"section\",\"classes\":[\"page-title-section\"],\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\"],\"components\":[{\"classes\":[\"col-xl-12\",\"text-center\"],\"components\":[{\"classes\":[\"page-title-content\"],\"components\":[{\"tagName\":\"h3\",\"type\":\"text\",\"classes\":[\"title\",\"text-white\",\"bud-title\"],\"components\":[{\"type\":\"textnode\",\"content\":\"STEM च्या पाण्याची कथा\"}]},{\"tagName\":\"nav\",\"attributes\":{\"aria-label\":\"breadcrumb\"},\"components\":[{\"tagName\":\"ol\",\"classes\":[\"breadcrumb\"],\"components\":[{\"tagName\":\"li\",\"classes\":[\"breadcrumb-item\"],\"components\":[{\"type\":\"link\",\"attributes\":{\"href\":\"index.html\"},\"components\":[{\"type\":\"textnode\",\"content\":\"मुख्यपृष्ठ\"}]}]},{\"tagName\":\"li\",\"type\":\"text\",\"classes\":[\"breadcrumb-item\",\"active\"],\"attributes\":{\"aria-current\":\"page\"},\"components\":[{\"type\":\"textnode\",\"content\":\"STEM च्या पाण्याची कथा\"}]}]}]}]}]}]}]}]},{\"classes\":[\"section-content\"],\"components\":[{\"tagName\":\"section\",\"classes\":[\"project-details-page\",\"pdt-60\",\"pdb-60\"],\"attributes\":{\"data-background\":\"images/bg/abs-bg5.png\"},\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\",\"mrb-60\"],\"components\":[{\"classes\":[\"col-xl-12\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"pdt-20\",\"pdb-20\",\"text-center\",\"stem_tale\"],\"components\":[{\"type\":\"textnode\",\"content\":\"STEM च्या पाण्याची कथा\"}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"स्टेम वॉटर डिस्ट्रिब्युशन अँड इन्फ्रास्ट्रक्चर कंपनी प्रा. मर्यादित. ठाणे महानगरपालिका, भिवंडी निजामपूर महानगरपालिका, मीरा भाईंदर महानगरपालिका आणि ठाणे जिल्हा परिषद यांच्या संयुक्त मालकीची खाजगी मर्यादित कंपनी आहे. जल क्षेत्रातील अनेक दशकांच्या अनुभवासह, आम्ही आमच्या मौल्यवान लाभार्थ्यांना अखंड पाणीपुरवठा सुनिश्चित करण्यासाठी समर्पित आहोत.\"}]},{\"classes\":[\"col-xl-12\"],\"components\":[{\"tagName\":\"h3\",\"type\":\"text\",\"classes\":[\"pdt-20\",\"pdb-20\",\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"मुख्य उद्दिष्टे\"}]}]},{\"classes\":[\"col-xl-12\",\"text-center\"],\"components\":[{\"tagName\":\"p\",\"type\":\"text\",\"components\":[{\"tagName\":\"span\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"१. \"}]},{\"type\":\"textnode\",\"content\":\"महाराष्ट्रातील आणि बाहेरील नगरपालिका आणि प्रदेशांना पाणी वाटप आणि विकणे.\"}]},{\"tagName\":\"p\",\"type\":\"text\",\"components\":[{\"tagName\":\"span\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"२. \"}]},{\"type\":\"textnode\",\"content\":\"जगभरातील पाणी वितरण, पुरवठा आणि संबंधित पायाभूत सुविधा प्रकल्पांमध्ये व्यस्त रहा.\"}]},{\"tagName\":\"p\",\"type\":\"text\",\"components\":[{\"tagName\":\"span\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"३. \"}]},{\"type\":\"textnode\",\"content\":\"शहरी भागात पर्यावरण आणि पायाभूत सुविधा पुरवणे.\"}]},{\"tagName\":\"p\",\"type\":\"text\",\"components\":[{\"tagName\":\"span\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"४. \"}]},{\"type\":\"textnode\",\"content\":\"विविध भौगोलिक प्रदेशांमध्ये सल्लामसलत सेवा देतात\"}]},{\"tagName\":\"p\",\"type\":\"text\",\"components\":[{\"tagName\":\"span\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"५. \"}]},{\"type\":\"textnode\",\"content\":\"स्वच्छता, आरोग्य, कचरा व्यवस्थापन आणि पायाभूत सुविधांच्या विकासाशी संबंधित प्रकल्प हाती घ्या.\"}]}]}]}]},{\"classes\":[\"row\"],\"components\":[{\"classes\":[\"row\",\"mrb-60\"],\"components\":[{\"classes\":[\"col-xl-6\",\"with-divider\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"pdt-20\",\"pdb-20\",\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"आमची अंतर्दृष्टी\"}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"text-center\",\"pdt-20\",\"pdb-20\"],\"components\":[{\"type\":\"textnode\",\"content\":\"\\\"शाश्वत पाणी वितरण आणि पायाभूत सुविधांचे समाधान देणारे अग्रगण्य प्रदाता बनणे, आमच्या भागधारकांना विश्वासार्ह पाणीपुरवठा सुनिश्चित करणे आणि आम्ही सेवा देत असलेल्या समुदायांच्या कल्याण आणि विकासासाठी योगदान देणे.\\\"\"}]}]},{\"classes\":[\"col-xl-6\",\"with-divider\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"pdt-20\",\"pdb-20\",\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"आमची प्रतिज्ञा\"}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"text-center\",\"pdt-20\",\"pdb-20\"],\"components\":[{\"type\":\"textnode\",\"content\":\"\\\"आमचे ध्येय समुदायांना विश्वासार्ह, शाश्वत आणि प्रवेशयोग्य पाणी सेवा प्रदान करणे, त्यांचे कल्याण आणि समृद्धी सुनिश्चित करणे हे आहे. आम्ही नावीन्य, जबाबदार संसाधन व्यवस्थापन आणि अपवादात्मक ग्राहक सेवा देण्यासाठी वचनबद्ध आहोत.\\\"\"}]}]}]}]}]}]},{\"tagName\":\"section\",\"classes\":[\"about-section\",\"anim-object\",\"pdt-40\",\"pdb-40\",\"pdb-lg-80\"],\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\",\"align-items-center\"],\"components\":[{\"classes\":[\"col-md-12\",\"col-xl-6\"],\"components\":[{\"classes\":[\"about-image-block\",\"mrb-lg-60\"],\"components\":[{\"type\":\"image\",\"classes\":[\"img-full\"],\"attributes\":{\"src\":\"{{asset(\'assets/stem/intro/5.png\')}}\",\"alt\":\"\",\"loading\":\"lazy\"}}]}]},{\"classes\":[\"col-md-12\",\"col-xl-6\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"mrb-30\",\"text-primary-color\"],\"components\":[{\"type\":\"textnode\",\"content\":\"एमडी संदेश\"}]},{\"type\":\"table\",\"classes\":[\"table\",\"table-bordered\",\"table-striped\",\"table-hover\",\"text-center\"],\"components\":[{\"type\":\"thead\",\"components\":[{\"type\":\"row\",\"components\":[{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"नाव\"}]},{\"type\":\"cell\",\"attributes\":{\"rowspan\":\"1\"},\"components\":[{\"type\":\"textnode\",\"content\":\"श्री.संकेत मोहन घरत\"}]}]},{\"type\":\"row\",\"components\":[{\"tagName\":\"th\",\"type\":\"cell\",\"attributes\":{\"id\":\"iiuil\"},\"components\":[{\"type\":\"textnode\",\"content\":\"शैक्षणिक अर्हता\"}]},{\"type\":\"cell\",\"components\":[{\"tagName\":\"ul\",\"components\":[{\"tagName\":\"span\",\"components\":[{\"tagName\":\"i\",\"classes\":[\"fa-solid\",\"fa-caret-right\",\"fa-2xs\"]}]},{\"type\":\"textnode\",\"content\":\" \"},{\"tagName\":\"li\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"एम. टेक (अभ्यास करणे) अर्बन स्टडीज/ अफेयर्स, आयआयटी बॉम्बे\"}]},{\"tagName\":\"br\",\"void\":true},{\"tagName\":\"span\",\"components\":[{\"tagName\":\"i\",\"classes\":[\"fa-solid\",\"fa-caret-right\",\"fa-2xs\"]}]},{\"type\":\"textnode\",\"content\":\" \"},{\"tagName\":\"li\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"एमबीए (मार्केटिंग), सिक्कीम मणिपाल विद्यापीठ\"}]},{\"tagName\":\"br\",\"void\":true},{\"tagName\":\"span\",\"components\":[{\"tagName\":\"i\",\"classes\":[\"fa-solid\",\"fa-caret-right\",\"fa-2xs\"]}]},{\"type\":\"textnode\",\"content\":\" \"},{\"tagName\":\"li\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"बी.ई. सिव्हिल, दत्ता मेघे कॉलेज ऑफ इंजिनीअरिंग\"}]}]}]}]}]}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"mrb-40\",\"Msg\"],\"attributes\":{\"id\":\"iddpi\"},\"components\":[{\"type\":\"textnode\",\"content\":\"STEM मध्ये, आम्ही शाश्वत पाणी व्यवस्थापन सुनिश्चित करणे आणि आम्ही सेवा करत असलेल्या समुदायांच्या कल्याणास प्रोत्साहन देण्याचे महत्त्व समजतो. आमच्या नाविन्यपूर्ण उपाय आणि समर्पणाद्वारे, आम्ही ज्या प्रदेशात काम करतो त्या प्रदेशांच्या विकासात आणि वाढीसाठी आम्ही योगदान देण्याचा प्रयत्न करतो.\\n\\t\\t\\t\\t\\tमी आमच्या संस्थेमध्ये सहयोग, सर्जनशीलता आणि ग्राहक-केंद्रित दृष्टीकोन प्रोत्साहित करतो. एकत्रितपणे, आम्ही आमची ऑपरेशनल उत्कृष्टता वाढवणे आणि आमच्या ग्राहकांच्या विकसित गरजा पूर्ण करणाऱ्या उच्च-गुणवत्तेच्या सेवा प्रदान करणे सुरू ठेवू.\\n\\t\\t\\t\\t\\tमी आमच्या मौल्यवान ग्राहक आणि भागीदारांचा विश्वास आणि समर्थनाबद्दल त्यांचे आभार मानतो. आम्ही तुमच्या अपेक्षा ओलांडण्यासाठी आणि जल उद्योगातील प्रगतीमध्ये आघाडीवर राहण्यासाठी वचनबद्ध आहोत.\\n\\t\\t\\t\\t\\tकार्यक्षम पाणी वितरण आणि पायाभूत सुविधांच्या विकासासाठी आम्ही काम करत असताना आमच्या प्रवासाचा एक भाग असल्याबद्दल धन्यवाद.\"}]},{\"classes\":[\"row\"],\"components\":[{\"classes\":[\"col-lg-6\"],\"components\":[{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"ceomsg\"],\"components\":[{\"type\":\"textnode\",\"content\":\"प्रामाणिकपणे,\"}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"ceomsg\"],\"components\":[{\"type\":\"textnode\",\"content\":\"संकेत मोहन घरत.\"}]},{\"tagName\":\"p\",\"type\":\"text\",\"classes\":[\"ceomsg\"],\"components\":[{\"type\":\"textnode\",\"content\":\"व्यवस्थापकीय संचालक.\"}]}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" <div class=\\\"col-lg-6\\\">\\n\\t\\t\\t\\t\\t\\t\\t\\t<div class=\\\"signature mrb-30\\\"><img src=\\\"images/about/signature.png\\\" alt=\\\"\\\"></div>\\n\\t\\t\\t\\t\\t\\t\\t</div> \"}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" <div class=\\\"signature mrb-30\\\"><img src=\\\"images/about/signature.png\\\" alt=\\\"\\\"></div> \"},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" <a href=\\\"page-about.html\\\" class=\\\"cs-btn-one btn-gradient-color btn-lg\\\">Know more about STEM</a> \"}]}]}]}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" Page Title End \"},{\"tagName\":\"section\",\"classes\":[\"content\",\"pdt-60\",\"pdb-50\"],\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\",\"mrb-60\"],\"components\":[{\"classes\":[\"col-xl-12\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"dt-20\",\"pdb-20\",\"text-center\",\"stem-info\"],\"components\":[{\"type\":\"textnode\",\"content\":\"STEM क्षेत्र आणि महानगरपालिका बद्दल माहिती\"}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" <p class=\\\"text-center\\\">STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.</p> \"}]}]},{\"classes\":[\"table-responsive\"],\"components\":[{\"type\":\"table\",\"classes\":[\"table\",\"table-bordered\",\"table-striped\",\"table-hover\",\"text-center\"],\"components\":[{\"type\":\"thead\",\"classes\":[\"back_color\"],\"components\":[{\"type\":\"row\",\"components\":[{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" <th> Sr. No.</th> \"},{\"tagName\":\"th\",\"type\":\"cell\",\"attributes\":{\"colspan\":\"2\"},\"components\":[{\"type\":\"textnode\",\"content\":\"भागधारकांचे नाव\"}]},{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"शेअरहोल्डर स्टेक\"}]},{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"पाटबंधारे विभागाचा पाणी मंजूर कोटा\"}]}]}]},{\"type\":\"tbody\",\"components\":[{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"१. \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"ठाणे महानगरपालिका, ठाणे.\"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"४९.७८℅\"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"११९ एमएलडी\"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"२. \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"मीरा भाईंदर महानगरपालिका.\"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"३२.५५℅\"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"८६ एमएलडी\"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"३. \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"भिवंडी निजामपूर शहर महानगरपालिका, भिवंडी\"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"१४.६८℅\"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"७१ एमएलडी\"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"४. \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"भिवंडी तालुका आणि ठाणे जिल्ह्यातील ३४ गावे\"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"२.९९℅\"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"४० एमएलडी\"}]}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" Add more rows as needed \"}]}]}]}]}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" Footer Area Start \"}]}],\"activeOnRender\":0,\"custom-code-plugin__code\":\"<section class=\\\"page-title-section\\\">\\n\\t\\t<div class=\\\"container\\\">\\n\\t\\t\\t<div class=\\\"row\\\">\\n\\t\\t\\t\\t<div class=\\\"col-xl-12 text-center\\\">\\n\\t\\t\\t\\t\\t<div class=\\\"page-title-content\\\">\\n\\t\\t\\t\\t\\t\\t<h3 class=\\\"title text-white bud-title\\\">STEM च्या पाण्याची कथा</h3>\\n\\t\\t\\t\\t\\t\\t<nav aria-label=\\\"breadcrumb\\\">\\n\\t\\t\\t\\t\\t\\t\\t<ol class=\\\"breadcrumb\\\">\\n\\t\\t\\t\\t\\t\\t\\t\\t<li class=\\\"breadcrumb-item\\\"><a href=\\\"index.html\\\">मुख्यपृष्ठ</a></li>\\n\\t\\t\\t\\t\\t\\t\\t\\t<li class=\\\"breadcrumb-item active\\\" aria-current=\\\"page\\\">STEM च्या पाण्याची कथा</li>\\n\\t\\t\\t\\t\\t\\t\\t</ol>\\n\\t\\t\\t\\t\\t\\t</nav>\\n\\t\\t\\t\\t\\t</div>\\n\\t\\t\\t\\t</div>\\n\\t\\t\\t</div>\\n\\t\\t</div>\\n\\t</section>\\n<div class=\\\"section-content\\\">\\n<section class=\\\"project-details-page pdt-60 pdb-60\\\" data-background=\\\"images/bg/abs-bg5.png\\\">\\n\\n\\t\\t<div class=\\\"container\\\">\\n\\t\\t\\t<div class=\\\"row mrb-60\\\">\\n\\t\\t\\t\\t <div class=\\\"col-xl-12\\\">\\n\\t\\t\\t\\t\\t<h2 class=\\\" pdt-20 pdb-20 text-center stem_tale\\\">STEM च्या पाण्याची कथा</h2>\\n\\t\\t\\t\\t\\t<p class=\\\"text-center\\\">स्टेम वॉटर डिस्ट्रिब्युशन अँड इन्फ्रास्ट्रक्चर कंपनी प्रा. मर्यादित. ठाणे महानगरपालिका, भिवंडी निजामपूर महानगरपालिका, मीरा भाईंदर महानगरपालिका आणि ठाणे जिल्हा परिषद यांच्या संयुक्त मालकीची खाजगी मर्यादित कंपनी आहे. जल क्षेत्रातील अनेक दशकांच्या अनुभवासह, आम्ही आमच्या मौल्यवान लाभार्थ्यांना अखंड पाणीपुरवठा सुनिश्चित करण्यासाठी समर्पित आहोत.</p>\\n\\t\\t\\t\\t\\t<div class=\\\"col-xl-12\\\">\\n\\t\\t\\t\\t\\t\\t<h3 class=\\\" pdt-20 pdb-20 text-center\\\">मुख्य उद्दिष्टे</h3>\\n\\t\\t\\t\\t\\t</div>\\n\\t\\t\\t\\t\\t<div class=\\\"col-xl-12 text-center\\\">\\n\\t\\t\\n\\t\\t\\t\\t\\t\\t<p><span>१. </span>महाराष्ट्रातील आणि बाहेरील नगरपालिका आणि प्रदेशांना पाणी वाटप आणि विकणे.</p>\\n\\t\\t\\t\\t\\t\\t<p><span>२. </span>जगभरातील पाणी वितरण, पुरवठा आणि संबंधित पायाभूत सुविधा प्रकल्पांमध्ये व्यस्त रहा.</p>\\n\\t\\t\\t\\t\\t\\t<p><span>३. </span>शहरी भागात पर्यावरण आणि पायाभूत सुविधा पुरवणे.</p>\\n\\t\\t\\t\\t\\t\\t<p><span>४. </span>विविध भौगोलिक प्रदेशांमध्ये सल्लामसलत सेवा देतात</p>\\n\\t\\t\\t\\t\\t\\t<p><span>५. </span>स्वच्छता, आरोग्य, कचरा व्यवस्थापन आणि पायाभूत सुविधांच्या विकासाशी संबंधित प्रकल्प हाती घ्या.</p>\\n\\t\\t\\t\\t\\t</div>\\n\\t\\t\\t\\t</div>\\n\\t\\t\\t</div>\\n\\t\\t\\t<div class=\\\"row\\\">\\n\\t\\t\\t\\t<div class=\\\"row mrb-60\\\">\\n\\t\\t\\t\\t\\t<div class=\\\"col-xl-6 with-divider\\\">\\n\\t\\t\\t\\t\\t   <h2 class=\\\" pdt-20 pdb-20 text-center\\\">आमची अंतर्दृष्टी</h2>\\n\\t\\t\\t\\t\\t   <p class=\\\"text-center  pdt-20 pdb-20\\\">\\\"शाश्वत पाणी वितरण आणि पायाभूत सुविधांचे समाधान देणारे अग्रगण्य प्रदाता बनणे, आमच्या भागधारकांना विश्वासार्ह पाणीपुरवठा सुनिश्चित करणे आणि आम्ही सेवा देत असलेल्या समुदायांच्या कल्याण आणि विकासासाठी योगदान देणे.\\\"</p>\\n\\t\\t\\t\\t   </div>\\n\\t\\t\\t\\t\\t<div class=\\\"col-xl-6  with-divider\\\">\\n\\t\\t\\t\\t\\t\\t<h2 class=\\\" pdt-20 pdb-20 text-center\\\">आमची प्रतिज्ञा</h2>\\n\\t\\t\\t\\t\\t\\t<p class=\\\"text-center pdt-20 pdb-20\\\">\\\"आमचे ध्येय समुदायांना विश्वासार्ह, शाश्वत आणि प्रवेशयोग्य पाणी सेवा प्रदान करणे, त्यांचे कल्याण आणि समृद्धी सुनिश्चित करणे हे आहे. आम्ही नावीन्य, जबाबदार संसाधन व्यवस्थापन आणि अपवादात्मक ग्राहक सेवा देण्यासाठी वचनबद्ध आहोत.\\\"</p>\\n\\t\\t\\t\\t\\t</div>\\n\\t\\t\\t   </div>\\n\\t\\t\\t</div>\\n\\t\\t</div>\\n\\t</section>\\n    <section class=\\\"about-section anim-object pdt-40 pdb-40 pdb-lg-80\\\">\\n\\t\\t<div class=\\\"container\\\">\\n\\t\\t\\t\\n\\t\\t\\t<div class=\\\"row align-items-center\\\">\\n\\t\\t\\t\\t<div class=\\\"col-md-12 col-xl-6\\\">\\n\\t\\t\\t\\t\\t<div class=\\\"about-image-block mrb-lg-60\\\">\\n\\t\\t\\t\\t\\t\\t<img class=\\\"img-full\\\" src=\\\"{{asset(\'assets/stem/intro/5.png\')}}\\\" alt=\\\"\\\" loading=\\\"lazy\\\">\\n                      \\n\\t\\t\\t\\t\\t</div>\\n\\t\\t\\t\\t</div>\\n\\t\\t\\t\\t<div class=\\\"col-md-12 col-xl-6\\\">\\n\\t\\t\\t\\t\\t<h2 class=\\\"mrb-30 text-primary-color\\\">एमडी संदेश</h2>\\n\\t\\t\\t\\t\\t<table  class=\\\"table table-bordered table-striped table-hover text-center\\\">\\n\\t\\t\\t\\t\\t\\t<thead>\\n\\t\\t\\t\\t\\t\\t\\t<tr>\\n\\t\\t\\t\\t\\t\\t\\t<th>नाव</th>\\n\\t\\t\\t\\t\\t\\t\\t<td rowspan=\\\"1\\\">श्री.संकेत मोहन घरत</td>\\n\\t\\t\\t\\t\\t\\t\\t</tr>\\n\\t\\t\\t\\t\\t\\t\\t<tr>\\n\\t\\t\\t\\t\\t\\t\\t\\t<th style=\\\"vertical-align: text-top !important;\\\">शैक्षणिक अर्हता</th>\\n\\t\\t\\t\\t\\t\\t\\t<td><ul>\\n\\t\\t\\t\\t\\t\\t\\t\\t<span><i class=\\\"fa-solid fa-caret-right fa-2xs\\\"></i></span> <li>एम. टेक (अभ्यास करणे) अर्बन स्टडीज/ अफेयर्स, आयआयटी बॉम्बे</li>\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t<br>\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t<span><i class=\\\"fa-solid fa-caret-right fa-2xs\\\"></i></span> <li>एमबीए (मार्केटिंग), सिक्कीम मणिपाल विद्यापीठ</li>\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t<br>\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t<span><i class=\\\"fa-solid fa-caret-right fa-2xs\\\"></i></span> <li>बी.ई. सिव्हिल, दत्ता मेघे कॉलेज ऑफ इंजिनीअरिंग</li>\\n\\n\\t\\t\\t\\t\\t\\t\\t</ul>\\n\\t\\t\\t\\t\\t\\t</td>\\t\\n\\t\\t\\t\\t\\t\\t\\t</tr>\\n\\t\\t\\t\\t\\t\\t</thead>\\n\\t\\t\\t\\t\\t</table>\\n\\t\\t\\t\\t\\t<p class=\\\"mrb-40 Msg\\\" style=\\\"text-align: justify;\\\">STEM मध्ये, आम्ही शाश्वत पाणी व्यवस्थापन सुनिश्चित करणे आणि आम्ही सेवा करत असलेल्या समुदायांच्या कल्याणास प्रोत्साहन देण्याचे महत्त्व समजतो. आमच्या नाविन्यपूर्ण उपाय आणि समर्पणाद्वारे, आम्ही ज्या प्रदेशात काम करतो त्या प्रदेशांच्या विकासात आणि वाढीसाठी आम्ही योगदान देण्याचा प्रयत्न करतो.\\n\\t\\t\\t\\t\\tमी आमच्या संस्थेमध्ये सहयोग, सर्जनशीलता आणि ग्राहक-केंद्रित दृष्टीकोन प्रोत्साहित करतो. एकत्रितपणे, आम्ही आमची ऑपरेशनल उत्कृष्टता वाढवणे आणि आमच्या ग्राहकांच्या विकसित गरजा पूर्ण करणाऱ्या उच्च-गुणवत्तेच्या सेवा प्रदान करणे सुरू ठेवू.\\n\\t\\t\\t\\t\\tमी आमच्या मौल्यवान ग्राहक आणि भागीदारांचा विश्वास आणि समर्थनाबद्दल त्यांचे आभार मानतो. आम्ही तुमच्या अपेक्षा ओलांडण्यासाठी आणि जल उद्योगातील प्रगतीमध्ये आघाडीवर राहण्यासाठी वचनबद्ध आहोत.\\n\\t\\t\\t\\t\\tकार्यक्षम पाणी वितरण आणि पायाभूत सुविधांच्या विकासासाठी आम्ही काम करत असताना आमच्या प्रवासाचा एक भाग असल्याबद्दल धन्यवाद.</p>\\n\\t\\t\\t\\t\\t\\t<div class=\\\"row\\\">\\n\\t\\t\\t\\t\\t\\t\\t<div class=\\\"col-lg-6\\\">\\n\\t\\t\\t\\t\\t\\t\\t\\t<p class=\\\"ceomsg\\\">प्रामाणिकपणे,</p>\\n\\t\\t\\t\\t\\t\\t\\t\\t<p class=\\\"ceomsg\\\">संकेत मोहन घरत.</p>\\n\\t\\t\\t\\t\\t\\t\\t\\t<p class=\\\"ceomsg\\\">व्यवस्थापकीय संचालक.</p>\\n\\t\\t\\t\\t\\t\\t\\t</div>\\n\\t\\t\\t\\t\\t\\t\\t<!-- <div class=\\\"col-lg-6\\\">\\n\\t\\t\\t\\t\\t\\t\\t\\t<div class=\\\"signature mrb-30\\\"><img src=\\\"images/about/signature.png\\\" alt=\\\"\\\"></div>\\n\\t\\t\\t\\t\\t\\t\\t</div> -->\\n\\t\\t\\t\\t\\t\\t\\t\\n\\t\\t\\t\\t\\t\\t</div>\\n\\t\\t\\t\\t\\t\\t\\n\\t\\t\\t\\t\\t<!-- <div class=\\\"signature mrb-30\\\"><img src=\\\"images/about/signature.png\\\" alt=\\\"\\\"></div> -->\\n\\t\\t\\t\\t\\t<!-- <a href=\\\"page-about.html\\\" class=\\\"cs-btn-one btn-gradient-color btn-lg\\\">Know more about STEM</a> -->\\n\\t\\t\\t\\t</div>\\n\\t\\t\\t</div>\\n\\t\\t</div>\\n\\t</section>\\n    \\t<!-- Page Title End -->\\n\\t<section class=\\\"content pdt-60 pdb-50\\\">\\n\\t\\t<div class=\\\"container\\\">\\n\\t\\t\\t<div class=\\\"row mrb-60\\\">\\n\\t\\t\\t\\t<div class=\\\"col-xl-12\\\">\\n\\t\\t\\t\\t   <h2 class=\\\"dt-20 pdb-20 text-center stem-info\\\">STEM क्षेत्र आणि महानगरपालिका बद्दल माहिती</h2>\\n\\t\\t\\t\\t   <!-- <p class=\\\"text-center\\\">STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.</p> -->\\n\\t\\t\\t   </div>\\n\\t\\t   </div>\\n\\t\\t\\t<div class=\\\"table-responsive\\\">\\n\\t\\t\\t\\t<table class=\\\"table table-bordered table-striped table-hover text-center\\\">\\n\\t\\t\\t\\t\\t<thead class=\\\"back_color\\\">\\n\\t\\t\\t\\t\\t\\t<tr>\\n\\t\\t\\t\\t\\t\\t\\t<!-- <th> Sr. No.</th> -->\\n\\t\\t\\t\\t\\t\\t\\t<th colspan=\\\"2\\\">भागधारकांचे नाव</th>\\n\\t\\t\\t\\t\\t\\t\\t<th>शेअरहोल्डर स्टेक</th>\\n\\t\\t\\t\\t\\t\\t\\t<th>पाटबंधारे विभागाचा पाणी मंजूर कोटा</th>\\n\\t\\t\\t\\t\\t\\t</tr>\\n\\t\\t\\t\\t\\t</thead>\\n\\t\\t\\t\\t\\t<tbody>\\n\\t\\t\\t\\t\\t\\t<tr>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">१. </td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">ठाणे महानगरपालिका, ठाणे.</td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">४९.७८&incare;</td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">११९ एमएलडी</td>\\n\\t\\t\\t\\t\\t\\t</tr>\\n\\t\\t\\t\\t\\t\\t<tr>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">२. </td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">मीरा भाईंदर महानगरपालिका.</td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">३२.५५&incare;</td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">८६ एमएलडी</td>\\n\\t\\t\\t\\t\\t\\t</tr>\\n\\t\\t\\t\\t\\t\\t<tr>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">३. </td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">भिवंडी निजामपूर शहर महानगरपालिका, भिवंडी</td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">१४.६८&incare;</td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">७१ एमएलडी</td>\\n\\t\\t\\t\\t\\t\\t</tr>\\n\\t\\t\\t\\t\\t\\t<tr>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">४. </td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">भिवंडी तालुका आणि ठाणे जिल्ह्यातील ३४ गावे</td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">२.९९&incare;</td>\\n\\t\\t\\t\\t\\t\\t\\t<td class=\\\"text-center\\\">४० एमएलडी</td>\\n\\t\\t\\t\\t\\t\\t</tr>\\n\\t\\t\\t\\t\\t\\t\\n\\t\\t\\t\\t\\t\\t<!-- Add more rows as needed -->\\n\\t\\t\\t\\t\\t</tbody>\\n\\t\\t\\t\\t</table>\\n\\t\\t\\t</div>\\n\\t\\t</div>\\n\\t</section>\\n\\t<!-- Footer Area Start -->\\n  </div>\"}]', '[{\"selectors\":[\"#i0h6\"]},{\"selectors\":[\"#iiuil\"],\"style\":{\"vertical-align\":\"text-top !important\"}},{\"selectors\":[\"#iddpi\"],\"style\":{\"text-align\":\"justify\"}}]', '<script type=\'text/javascript\' src=\'http://localhost:8001/assets/customeJs/2.js\'></script><div class=\'pagebuilder-content\'><div id=\"i0h6\"><section class=\"page-title-section\"><div class=\"container\"><div class=\"row\"><div class=\"col-xl-12 text-center\"><div class=\"page-title-content\"><h3 class=\"title text-white bud-title\">STEM च्या पाण्याची कथा</h3><nav aria-label=\"breadcrumb\"><ol class=\"breadcrumb\"><li class=\"breadcrumb-item\"><a href=\"index.html\">मुख्यपृष्ठ</a></li><li aria-current=\"page\" class=\"breadcrumb-item active\">STEM च्या पाण्याची कथा</li></ol></nav></div></div></div></div></section><div class=\"section-content\"><section data-background=\"images/bg/abs-bg5.png\" class=\"project-details-page pdt-60 pdb-60\"><div class=\"container\"><div class=\"row mrb-60\"><div class=\"col-xl-12\"><h2 class=\"pdt-20 pdb-20 text-center stem_tale\">STEM च्या पाण्याची कथा</h2><p class=\"text-center\">स्टेम वॉटर डिस्ट्रिब्युशन अँड इन्फ्रास्ट्रक्चर कंपनी प्रा. मर्यादित. ठाणे महानगरपालिका, भिवंडी निजामपूर महानगरपालिका, मीरा भाईंदर महानगरपालिका आणि ठाणे जिल्हा परिषद यांच्या संयुक्त मालकीची खाजगी मर्यादित कंपनी आहे. जल क्षेत्रातील अनेक दशकांच्या अनुभवासह, आम्ही आमच्या मौल्यवान लाभार्थ्यांना अखंड पाणीपुरवठा सुनिश्चित करण्यासाठी समर्पित आहोत.</p><div class=\"col-xl-12\"><h3 class=\"pdt-20 pdb-20 text-center\">मुख्य उद्दिष्टे</h3></div><div class=\"col-xl-12 text-center\"><p><span>१. </span>महाराष्ट्रातील आणि बाहेरील नगरपालिका आणि प्रदेशांना पाणी वाटप आणि विकणे.</p><p><span>२. </span>जगभरातील पाणी वितरण, पुरवठा आणि संबंधित पायाभूत सुविधा प्रकल्पांमध्ये व्यस्त रहा.</p><p><span>३. </span>शहरी भागात पर्यावरण आणि पायाभूत सुविधा पुरवणे.</p><p><span>४. </span>विविध भौगोलिक प्रदेशांमध्ये सल्लामसलत सेवा देतात</p><p><span>५. </span>स्वच्छता, आरोग्य, कचरा व्यवस्थापन आणि पायाभूत सुविधांच्या विकासाशी संबंधित प्रकल्प हाती घ्या.</p></div></div></div><div class=\"row\"><div class=\"row mrb-60\"><div class=\"col-xl-6 with-divider\"><h2 class=\"pdt-20 pdb-20 text-center\">आमची अंतर्दृष्टी</h2><p class=\"text-center pdt-20 pdb-20\">&quot;शाश्वत पाणी वितरण आणि पायाभूत सुविधांचे समाधान देणारे अग्रगण्य प्रदाता बनणे, आमच्या भागधारकांना विश्वासार्ह पाणीपुरवठा सुनिश्चित करणे आणि आम्ही सेवा देत असलेल्या समुदायांच्या कल्याण आणि विकासासाठी योगदान देणे.&quot;</p></div><div class=\"col-xl-6 with-divider\"><h2 class=\"pdt-20 pdb-20 text-center\">आमची प्रतिज्ञा</h2><p class=\"text-center pdt-20 pdb-20\">&quot;आमचे ध्येय समुदायांना विश्वासार्ह, शाश्वत आणि प्रवेशयोग्य पाणी सेवा प्रदान करणे, त्यांचे कल्याण आणि समृद्धी सुनिश्चित करणे हे आहे. आम्ही नावीन्य, जबाबदार संसाधन व्यवस्थापन आणि अपवादात्मक ग्राहक सेवा देण्यासाठी वचनबद्ध आहोत.&quot;</p></div></div></div></div></section><section class=\"about-section anim-object pdt-40 pdb-40 pdb-lg-80\"><div class=\"container\"><div class=\"row align-items-center\"><div class=\"col-md-12 col-xl-6\"><div class=\"about-image-block mrb-lg-60\"><img src=\"{{asset(\'assets/stem/intro/5.png\')}}\" alt=\"\" loading=\"lazy\" class=\"img-full\"/></div></div><div class=\"col-md-12 col-xl-6\"><h2 class=\"mrb-30 text-primary-color\">एमडी संदेश</h2><table class=\"table table-bordered table-striped table-hover text-center\"><thead><tr><th>नाव</th><td rowspan=\"1\">श्री.संकेत मोहन घरत</td></tr><tr><th id=\"iiuil\">शैक्षणिक अर्हता</th><td><ul><span><i class=\"fa-solid fa-caret-right fa-2xs\"></i></span> <li>एम. टेक (अभ्यास करणे) अर्बन स्टडीज/ अफेयर्स, आयआयटी बॉम्बे</li><br/><span><i class=\"fa-solid fa-caret-right fa-2xs\"></i></span> <li>एमबीए (मार्केटिंग), सिक्कीम मणिपाल विद्यापीठ</li><br/><span><i class=\"fa-solid fa-caret-right fa-2xs\"></i></span> <li>बी.ई. सिव्हिल, दत्ता मेघे कॉलेज ऑफ इंजिनीअरिंग</li></ul></td></tr></thead></table><p id=\"iddpi\" class=\"mrb-40 Msg\">STEM मध्ये, आम्ही शाश्वत पाणी व्यवस्थापन सुनिश्चित करणे आणि आम्ही सेवा करत असलेल्या समुदायांच्या कल्याणास प्रोत्साहन देण्याचे महत्त्व समजतो. आमच्या नाविन्यपूर्ण उपाय आणि समर्पणाद्वारे, आम्ही ज्या प्रदेशात काम करतो त्या प्रदेशांच्या विकासात आणि वाढीसाठी आम्ही योगदान देण्याचा प्रयत्न करतो.\r\n					मी आमच्या संस्थेमध्ये सहयोग, सर्जनशीलता आणि ग्राहक-केंद्रित दृष्टीकोन प्रोत्साहित करतो. एकत्रितपणे, आम्ही आमची ऑपरेशनल उत्कृष्टता वाढवणे आणि आमच्या ग्राहकांच्या विकसित गरजा पूर्ण करणाऱ्या उच्च-गुणवत्तेच्या सेवा प्रदान करणे सुरू ठेवू.\r\n					मी आमच्या मौल्यवान ग्राहक आणि भागीदारांचा विश्वास आणि समर्थनाबद्दल त्यांचे आभार मानतो. आम्ही तुमच्या अपेक्षा ओलांडण्यासाठी आणि जल उद्योगातील प्रगतीमध्ये आघाडीवर राहण्यासाठी वचनबद्ध आहोत.\r\n					कार्यक्षम पाणी वितरण आणि पायाभूत सुविधांच्या विकासासाठी आम्ही काम करत असताना आमच्या प्रवासाचा एक भाग असल्याबद्दल धन्यवाद.</p><div class=\"row\"><div class=\"col-lg-6\"><p class=\"ceomsg\">प्रामाणिकपणे,</p><p class=\"ceomsg\">संकेत मोहन घरत.</p><p class=\"ceomsg\">व्यवस्थापकीय संचालक.</p></div><!-- <div class=\"col-lg-6\">\r\n								<div class=\"signature mrb-30\"><img src=\"images/about/signature.png\" alt=\"\"></div>\r\n							</div> --></div><!-- <div class=\"signature mrb-30\"><img src=\"images/about/signature.png\" alt=\"\"></div> --><!-- <a href=\"page-about.html\" class=\"cs-btn-one btn-gradient-color btn-lg\">Know more about STEM</a> --></div></div></div></section><!-- Page Title End --><section class=\"content pdt-60 pdb-50\"><div class=\"container\"><div class=\"row mrb-60\"><div class=\"col-xl-12\"><h2 class=\"dt-20 pdb-20 text-center stem-info\">STEM क्षेत्र आणि महानगरपालिका बद्दल माहिती</h2><!-- <p class=\"text-center\">STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.</p> --></div></div><div class=\"table-responsive\"><table class=\"table table-bordered table-striped table-hover text-center\"><thead class=\"back_color\"><tr><!-- <th> Sr. No.</th> --><th colspan=\"2\">भागधारकांचे नाव</th><th>शेअरहोल्डर स्टेक</th><th>पाटबंधारे विभागाचा पाणी मंजूर कोटा</th></tr></thead><tbody><tr><td class=\"text-center\">१. </td><td class=\"text-center\">ठाणे महानगरपालिका, ठाणे.</td><td class=\"text-center\">४९.७८℅</td><td class=\"text-center\">११९ एमएलडी</td></tr><tr><td class=\"text-center\">२. </td><td class=\"text-center\">मीरा भाईंदर महानगरपालिका.</td><td class=\"text-center\">३२.५५℅</td><td class=\"text-center\">८६ एमएलडी</td></tr><tr><td class=\"text-center\">३. </td><td class=\"text-center\">भिवंडी निजामपूर शहर महानगरपालिका, भिवंडी</td><td class=\"text-center\">१४.६८℅</td><td class=\"text-center\">७१ एमएलडी</td></tr><tr><td class=\"text-center\">४. </td><td class=\"text-center\">भिवंडी तालुका आणि ठाणे जिल्ह्यातील ३४ गावे</td><td class=\"text-center\">२.९९℅</td><td class=\"text-center\">४० एमएलडी</td></tr><!-- Add more rows as needed --></tbody></table></div></div></section><!-- Footer Area Start --></div></div></div>', '* { box-sizing: border-box; } body {margin: 0;}#iiuil{vertical-align:text-top !important;}#iddpi{text-align:justify;}', NULL),
(3, 169, 'Water Tariff And Charges - MR', 'Water Tariff And Charges', NULL, 'Water-Tariff-And-Charges---MR', 1, 0, NULL, NULL, '2024-05-13 12:23:38', '2024-05-13 12:32:31', '[{\"type\":\"custom-code\",\"droppable\":1,\"attributes\":{\"id\":\"itm6\"},\"components\":[{\"tagName\":\"section\",\"classes\":[\"page-title-section_1\"],\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\"],\"components\":[{\"classes\":[\"col-xl-12\",\"text-center\"],\"components\":[{\"classes\":[\"page-title-content\"],\"components\":[{\"tagName\":\"h3\",\"type\":\"text\",\"classes\":[\"title\",\"text-white\",\"water-title\"],\"components\":[{\"type\":\"textnode\",\"content\":\"पाणी दर आणि शुल्क\\n          \"}]},{\"tagName\":\"nav\",\"attributes\":{\"aria-label\":\"breadcrumb\"},\"components\":[{\"tagName\":\"ol\",\"classes\":[\"breadcrumb\"],\"components\":[{\"tagName\":\"li\",\"classes\":[\"breadcrumb-item\"],\"components\":[{\"type\":\"link\",\"attributes\":{\"href\":\"/\"},\"components\":[{\"type\":\"textnode\",\"content\":\"मुख्यपृष्ठ\"}]}]},{\"tagName\":\"li\",\"type\":\"text\",\"classes\":[\"breadcrumb-item\",\"active\"],\"attributes\":{\"aria-current\":\"page\"},\"components\":[{\"type\":\"textnode\",\"content\":\"पाणी दर आणि शुल्क\\n              \"}]}]}]}]}]}]}]}]},{\"tagName\":\"section\",\"classes\":[\"content\",\"pdt-60\",\"pdb-50\"],\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\",\"mrb-60\"],\"components\":[{\"classes\":[\"col-xl-12\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"pdt-20\",\"pdb-20\",\"text-center\",\"table_padding\"],\"components\":[{\"type\":\"textnode\",\"content\":\"पाणी दर आणि शुल्क\\n        \"}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" <p class=\\\"text-center\\\">STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.</p> \"}]}]},{\"classes\":[\"table-responsive\"],\"components\":[{\"type\":\"table\",\"classes\":[\"table\",\"table-bordered\",\"table-striped\",\"table-hover\",\"text-center\"],\"components\":[{\"type\":\"thead\",\"classes\":[\"back_color\"],\"components\":[{\"type\":\"row\",\"components\":[{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" <th> Sr. No.</th> \"},{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"अ.क्र.\\n            \"}]},{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"संस्था\\n            \"}]},{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"पाणी दर (दि. ०१.०४.२०२३ पासून)\\n            \"}]}]}]},{\"type\":\"tbody\",\"components\":[{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"१. \\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-left\"],\"components\":[{\"tagName\":\"b\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"ठाणे महानगरपालिका \\n              \"}]},{\"tagName\":\"br\",\"void\":true},{\"type\":\"textnode\",\"content\":\"\\n              ठाणे एम बी आर \\n              \"},{\"tagName\":\"br\",\"void\":true},{\"type\":\"textnode\",\"content\":\"आझादनगर, डोंगरीपाडा, बीएसयुपी, गायमुख\\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"tagName\":\"br\",\"void\":true},{\"type\":\"textnode\",\"content\":\"११,९००\\n              \"},{\"tagName\":\"br\",\"void\":true},{\"type\":\"textnode\",\"content\":\"\\n              १३,०००\\n            \"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"2. \\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-left\"],\"components\":[{\"type\":\"textnode\",\"content\":\"मिरा भाईंदर महानगरपालिका\\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"१२,६००\\n            \"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"3. \\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-left\"],\"components\":[{\"type\":\"textnode\",\"content\":\" भिवंडी निजामपूर शहर महानगरपालिका\\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"११,९००\\n            \"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"4. \\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-left\"],\"components\":[{\"type\":\"textnode\",\"content\":\" जिल्हा परिषद (३६ ग्रामपंचायती)\\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"९६००\\n            \"}]}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" Add more rows as needed \"}]}]}]}]}]}],\"activeOnRender\":0,\"custom-code-plugin__code\":\"<section class=\\\"page-title-section_1\\\">\\n  <div class=\\\"container\\\">\\n    <div class=\\\"row\\\">\\n      <div class=\\\"col-xl-12 text-center\\\">\\n        <div class=\\\"page-title-content\\\">\\n          <h3 class=\\\"title text-white water-title\\\">पाणी दर आणि शुल्क\\n          </h3>\\n          <nav aria-label=\\\"breadcrumb\\\">\\n            <ol class=\\\"breadcrumb\\\">\\n              <li class=\\\"breadcrumb-item\\\">\\n                <a href=\\\"/\\\">मुख्यपृष्ठ</a>\\n              </li>\\n              <li class=\\\"breadcrumb-item active\\\" aria-current=\\\"page\\\">पाणी दर आणि शुल्क\\n              </li>\\n            </ol>\\n          </nav>\\n        </div>\\n      </div>\\n    </div>\\n  </div>\\n</section>\\n<section class=\\\"content pdt-60 pdb-50\\\">\\n  <div class=\\\"container\\\">\\n    <div class=\\\"row mrb-60\\\">\\n      <div class=\\\"col-xl-12\\\">\\n        <h2 class=\\\" pdt-20 pdb-20 text-center table_padding\\\">पाणी दर आणि शुल्क\\n        </h2>\\n        <!-- <p class=\\\"text-center\\\">STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.</p> -->\\n      </div>\\n    </div>\\n    <div class=\\\"table-responsive\\\">\\n      <table class=\\\"table table-bordered table-striped table-hover text-center\\\">\\n        <thead class=\\\"back_color\\\">\\n          <tr>\\n            <!-- <th> Sr. No.</th> -->\\n            <th>अ.क्र.\\n            </th>\\n            <th>संस्था\\n            </th>\\n            <th>पाणी दर (दि. ०१.०४.२०२३ पासून)\\n            </th>\\n          </tr>\\n        </thead>\\n        <tbody>\\n          <tr>\\n            <td class=\\\"text-center\\\">१. \\n            </td>\\n            <td class=\\\"text-left\\\">\\n              <b>ठाणे महानगरपालिका \\n              </b>\\n              <br>\\n              ठाणे एम बी आर \\n              <br>आझादनगर, डोंगरीपाडा, बीएसयुपी, गायमुख\\n            </td>\\n            <td class=\\\"text-center\\\">\\n              <br>११,९००\\n              <br>\\n              १३,०००\\n            </td>\\n          </tr>\\n          <tr>\\n            <td class=\\\"text-center\\\">2. \\n            </td>\\n            <td class=\\\"text-left\\\">मिरा भाईंदर महानगरपालिका\\n            </td>\\n            <td class=\\\"text-center\\\">१२,६००\\n            </td>\\n          </tr>\\n          <tr>\\n            <td class=\\\"text-center\\\">3. \\n            </td>\\n            <td class=\\\"text-left\\\"> भिवंडी निजामपूर शहर महानगरपालिका\\n            </td>\\n            <td class=\\\"text-center\\\">११,९००\\n            </td>\\n          </tr>\\n          <tr>\\n            <td class=\\\"text-center\\\">4. \\n            </td>\\n            <td class=\\\"text-left\\\"> जिल्हा परिषद (३६ ग्रामपंचायती)\\n            </td>\\n            <td class=\\\"text-center\\\">९६००\\n            </td>\\n          </tr>\\n          <!-- Add more rows as needed -->\\n        </tbody>\\n      </table>\\n    </div>\\n  </div>\\n</section>\"}]', '[{\"selectors\":[\"#itm6\"]}]', '<script type=\'text/javascript\' src=\'http://localhost:8002/assets/customeJs/3.js\'></script><div class=\'pagebuilder-content\'><div id=\"itm6\"><section class=\"page-title-section_1\"><div class=\"container\"><div class=\"row\"><div class=\"col-xl-12 text-center\"><div class=\"page-title-content\"><h3 class=\"title text-white water-title\">पाणी दर आणि शुल्क\r\n          </h3><nav aria-label=\"breadcrumb\"><ol class=\"breadcrumb\"><li class=\"breadcrumb-item\"><a href=\"/\">मुख्यपृष्ठ</a></li><li aria-current=\"page\" class=\"breadcrumb-item active\">पाणी दर आणि शुल्क\r\n              </li></ol></nav></div></div></div></div></section><section class=\"content pdt-60 pdb-50\"><div class=\"container\"><div class=\"row mrb-60\"><div class=\"col-xl-12\"><h2 class=\"pdt-20 pdb-20 text-center table_padding\">पाणी दर आणि शुल्क\r\n        </h2><!-- <p class=\"text-center\">STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.</p> --></div></div><div class=\"table-responsive\"><table class=\"table table-bordered table-striped table-hover text-center\"><thead class=\"back_color\"><tr><!-- <th> Sr. No.</th> --><th>अ.क्र.\r\n            </th><th>संस्था\r\n            </th><th>पाणी दर (दि. ०१.०४.२०२३ पासून)\r\n            </th></tr></thead><tbody><tr><td class=\"text-center\">१. \r\n            </td><td class=\"text-left\"><b>ठाणे महानगरपालिका \r\n              </b><br/>\r\n              ठाणे एम बी आर \r\n              <br/>आझादनगर, डोंगरीपाडा, बीएसयुपी, गायमुख\r\n            </td><td class=\"text-center\"><br/>११,९००\r\n              <br/>\r\n              १३,०००\r\n            </td></tr><tr><td class=\"text-center\">2. \r\n            </td><td class=\"text-left\">मिरा भाईंदर महानगरपालिका\r\n            </td><td class=\"text-center\">१२,६००\r\n            </td></tr><tr><td class=\"text-center\">3. \r\n            </td><td class=\"text-left\"> भिवंडी निजामपूर शहर महानगरपालिका\r\n            </td><td class=\"text-center\">११,९००\r\n            </td></tr><tr><td class=\"text-center\">4. \r\n            </td><td class=\"text-left\"> जिल्हा परिषद (३६ ग्रामपंचायती)\r\n            </td><td class=\"text-center\">९६००\r\n            </td></tr><!-- Add more rows as needed --></tbody></table></div></div></section></div></div>', '* { box-sizing: border-box; } body {margin: 0;}', NULL);
INSERT INTO `pages` (`id`, `language_id`, `name`, `title`, `subtitle`, `slug`, `status`, `serial_number`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`, `components`, `styles`, `html`, `css`, `body`) VALUES
(4, 169, 'Water Tariff And Charges', 'Water Tariff And Charges', NULL, 'Water-Tariff-And-Charges', 1, 0, NULL, NULL, '2024-05-13 12:35:25', '2024-05-13 12:40:17', '[{\"type\":\"custom-code\",\"droppable\":1,\"attributes\":{\"id\":\"ih5z\"},\"components\":[{\"tagName\":\"section\",\"classes\":[\"page-title-section_1\"],\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\"],\"components\":[{\"classes\":[\"col-xl-12\",\"text-center\"],\"components\":[{\"classes\":[\"page-title-content\"],\"components\":[{\"tagName\":\"h3\",\"type\":\"text\",\"classes\":[\"title\",\"text-white\",\"water-title\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Water Tariff And Charges\\n          \"}]},{\"tagName\":\"nav\",\"attributes\":{\"aria-label\":\"breadcrumb\"},\"components\":[{\"tagName\":\"ol\",\"classes\":[\"breadcrumb\"],\"components\":[{\"tagName\":\"li\",\"classes\":[\"breadcrumb-item\"],\"components\":[{\"type\":\"link\",\"attributes\":{\"href\":\"/\"},\"components\":[{\"type\":\"textnode\",\"content\":\"Home\"}]}]},{\"tagName\":\"li\",\"type\":\"text\",\"classes\":[\"breadcrumb-item\",\"active\"],\"attributes\":{\"aria-current\":\"page\"},\"components\":[{\"type\":\"textnode\",\"content\":\"Water Tariff And Charges\\n              \"}]}]}]}]}]}]}]}]},{\"tagName\":\"section\",\"classes\":[\"content\",\"pdt-60\",\"pdb-50\"],\"components\":[{\"classes\":[\"container\"],\"components\":[{\"classes\":[\"row\",\"mrb-60\"],\"components\":[{\"classes\":[\"col-xl-12\"],\"components\":[{\"tagName\":\"h2\",\"type\":\"text\",\"classes\":[\"pdt-20\",\"pdb-20\",\"text-center\",\"table_padding\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Water Tariff And Charges\\n        \"}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" <p class=\\\"text-center\\\">STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.</p> \"}]}]},{\"classes\":[\"table-responsive\"],\"components\":[{\"type\":\"table\",\"classes\":[\"table\",\"table-bordered\",\"table-striped\",\"table-hover\",\"text-center\"],\"components\":[{\"type\":\"thead\",\"classes\":[\"back_color\"],\"components\":[{\"type\":\"row\",\"components\":[{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" <th> Sr. No.</th> \"},{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"Sr.No.\\n            \"}]},{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"Institution\\n            \"}]},{\"tagName\":\"th\",\"type\":\"cell\",\"components\":[{\"type\":\"textnode\",\"content\":\"Water Tariff (from 01.04.2023)\\n            \"}]}]}]},{\"type\":\"tbody\",\"components\":[{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"1. \\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-left\"],\"components\":[{\"tagName\":\"b\",\"type\":\"text\",\"components\":[{\"type\":\"textnode\",\"content\":\"Thane Municipal Corporation\\n              \"}]},{\"tagName\":\"br\",\"void\":true},{\"type\":\"textnode\",\"content\":\"\\n              Thane MB R \\n              \"},{\"tagName\":\"br\",\"void\":true},{\"type\":\"textnode\",\"content\":\"Azadnagar, Dongripada, BSUP, Gaymukh\\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"tagName\":\"br\",\"void\":true},{\"type\":\"textnode\",\"content\":\"11,900\\n              \"},{\"tagName\":\"br\",\"void\":true},{\"type\":\"textnode\",\"content\":\"\\n              13000\\n            \"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"2. \\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-left\"],\"components\":[{\"type\":\"textnode\",\"content\":\"Mira Bhayander Municipal Corporation\\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"12,600\\n            \"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"3. \\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-left\"],\"components\":[{\"type\":\"textnode\",\"content\":\" Bhiwandi Nizampur City Municipal Corporation\\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"11,900\\n            \"}]}]},{\"type\":\"row\",\"components\":[{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"4. \\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-left\"],\"components\":[{\"type\":\"textnode\",\"content\":\" Zilla Parishad (36 Gram Panchayats)\\n            \"}]},{\"type\":\"cell\",\"classes\":[\"text-center\"],\"components\":[{\"type\":\"textnode\",\"content\":\"9600\\n            \"}]}]},{\"tagName\":\"NULL\",\"type\":\"comment\",\"content\":\" Add more rows as needed \"}]}]}]}]}]}],\"activeOnRender\":0,\"custom-code-plugin__code\":\"<section class=\\\"page-title-section_1\\\">\\n  <div class=\\\"container\\\">\\n    <div class=\\\"row\\\">\\n      <div class=\\\"col-xl-12 text-center\\\">\\n        <div class=\\\"page-title-content\\\">\\n          <h3 class=\\\"title text-white water-title\\\">Water Tariff And Charges\\n          </h3>\\n          <nav aria-label=\\\"breadcrumb\\\">\\n            <ol class=\\\"breadcrumb\\\">\\n              <li class=\\\"breadcrumb-item\\\">\\n                <a href=\\\"/\\\">Home</a>\\n              </li>\\n              <li class=\\\"breadcrumb-item active\\\" aria-current=\\\"page\\\">Water Tariff And Charges\\n              </li>\\n            </ol>\\n          </nav>\\n        </div>\\n      </div>\\n    </div>\\n  </div>\\n</section>\\n<section class=\\\"content pdt-60 pdb-50\\\">\\n  <div class=\\\"container\\\">\\n    <div class=\\\"row mrb-60\\\">\\n      <div class=\\\"col-xl-12\\\">\\n        <h2 class=\\\" pdt-20 pdb-20 text-center table_padding\\\">Water Tariff And Charges\\n        </h2>\\n        <!-- <p class=\\\"text-center\\\">STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.</p> -->\\n      </div>\\n    </div>\\n    <div class=\\\"table-responsive\\\">\\n      <table class=\\\"table table-bordered table-striped table-hover text-center\\\">\\n        <thead class=\\\"back_color\\\">\\n          <tr>\\n            <!-- <th> Sr. No.</th> -->\\n            <th>Sr.No.\\n            </th>\\n            <th>Institution\\n            </th>\\n            <th>Water Tariff (from 01.04.2023)\\n            </th>\\n          </tr>\\n        </thead>\\n        <tbody>\\n          <tr>\\n            <td class=\\\"text-center\\\">1. \\n            </td>\\n            <td class=\\\"text-left\\\">\\n              <b>Thane Municipal Corporation\\n              </b>\\n              <br>\\n              Thane MB R \\n              <br>Azadnagar, Dongripada, BSUP, Gaymukh\\n            </td>\\n            <td class=\\\"text-center\\\">\\n              <br>11,900\\n              <br>\\n              13000\\n            </td>\\n          </tr>\\n          <tr>\\n            <td class=\\\"text-center\\\">2. \\n            </td>\\n            <td class=\\\"text-left\\\">Mira Bhayander Municipal Corporation\\n            </td>\\n            <td class=\\\"text-center\\\">12,600\\n            </td>\\n          </tr>\\n          <tr>\\n            <td class=\\\"text-center\\\">3. \\n            </td>\\n            <td class=\\\"text-left\\\"> Bhiwandi Nizampur City Municipal Corporation\\n            </td>\\n            <td class=\\\"text-center\\\">11,900\\n            </td>\\n          </tr>\\n          <tr>\\n            <td class=\\\"text-center\\\">4. \\n            </td>\\n            <td class=\\\"text-left\\\"> Zilla Parishad (36 Gram Panchayats)\\n            </td>\\n            <td class=\\\"text-center\\\">9600\\n            </td>\\n          </tr>\\n          <!-- Add more rows as needed -->\\n        </tbody>\\n      </table>\\n    </div>\\n  </div>\\n</section>\"}]', '[{\"selectors\":[\"#ih5z\"]}]', '<script type=\'text/javascript\' src=\'http://localhost:8002/assets/customeJs/4.js\'></script><div class=\'pagebuilder-content\'><div id=\"ih5z\"><section class=\"page-title-section_1\"><div class=\"container\"><div class=\"row\"><div class=\"col-xl-12 text-center\"><div class=\"page-title-content\"><h3 class=\"title text-white water-title\">Water Tariff And Charges\r\n          </h3><nav aria-label=\"breadcrumb\"><ol class=\"breadcrumb\"><li class=\"breadcrumb-item\"><a href=\"/\">Home</a></li><li aria-current=\"page\" class=\"breadcrumb-item active\">Water Tariff And Charges\r\n              </li></ol></nav></div></div></div></div></section><section class=\"content pdt-60 pdb-50\"><div class=\"container\"><div class=\"row mrb-60\"><div class=\"col-xl-12\"><h2 class=\"pdt-20 pdb-20 text-center table_padding\">Water Tariff And Charges\r\n        </h2><!-- <p class=\"text-center\">STEM Water Distribution & Infrastructure Co. Pvt. Ltd. is a private limited company jointly owned by Thane Municipal Corporation, Bhiwandi Nizampur Municipal Corporation, Mira Bhayander Municipal Corporation, and Thane Zilla Parishad. With decades of experience in the water sector, we are dedicated to ensuring uninterrupted water supply to our valued beneficiaries.</p> --></div></div><div class=\"table-responsive\"><table class=\"table table-bordered table-striped table-hover text-center\"><thead class=\"back_color\"><tr><!-- <th> Sr. No.</th> --><th>Sr.No.\r\n            </th><th>Institution\r\n            </th><th>Water Tariff (from 01.04.2023)\r\n            </th></tr></thead><tbody><tr><td class=\"text-center\">1. \r\n            </td><td class=\"text-left\"><b>Thane Municipal Corporation\r\n              </b><br/>\r\n              Thane MB R \r\n              <br/>Azadnagar, Dongripada, BSUP, Gaymukh\r\n            </td><td class=\"text-center\"><br/>11,900\r\n              <br/>\r\n              13000\r\n            </td></tr><tr><td class=\"text-center\">2. \r\n            </td><td class=\"text-left\">Mira Bhayander Municipal Corporation\r\n            </td><td class=\"text-center\">12,600\r\n            </td></tr><tr><td class=\"text-center\">3. \r\n            </td><td class=\"text-left\"> Bhiwandi Nizampur City Municipal Corporation\r\n            </td><td class=\"text-center\">11,900\r\n            </td></tr><tr><td class=\"text-center\">4. \r\n            </td><td class=\"text-left\"> Zilla Parishad (36 Gram Panchayats)\r\n            </td><td class=\"text-center\">9600\r\n            </td></tr><!-- Add more rows as needed --></tbody></table></div></div></section></div></div>', '* { box-sizing: border-box; } body {margin: 0;}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `language_id`, `image`, `url`, `title`, `serial_number`) VALUES
(1, 169, '6641a120da5d9.png', 'https://stemwater.org/', 'Thane Municipal Corporation, Thane', 1),
(2, 170, '6641a84c37cdd.png', 'https://stemwater.org/', 'ठाणे महानगरपालिका, ठाणे', 1),
(3, 169, '6641a10e61423.png', 'https://stemwater.org/', 'Mira Bhayandar Municipal Corporation', 2),
(4, 170, '6641a86aac647.png', 'https://stemwater.org/', 'मीरा भाईंदर महानगरपालिका', 2),
(5, 169, '6641a0f8f1e44.png', NULL, 'Bhiwandi Nizampur City Municipal Corporation, Bhiwandi', 3),
(6, 169, '6641a0e12dcb7.png', NULL, 'Thane Zilla Parishad, Thane', 4),
(7, 170, '6641a88021ed6.png', NULL, 'भिवंडी निजामपूर शहर महानगरपालिका, भिवंडी', 3),
(8, 170, '6641a8b88188f.png', NULL, 'ठाणे जिल्हा परिषद, ठाणे', 4);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'manual',
  `information` mediumtext DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `subtitle`, `title`, `details`, `name`, `type`, `information`, `keyword`, `status`) VALUES
(6, NULL, NULL, NULL, 'Flutterwave', 'automatic', '{\"public_key\":\"FLWPUBK_TEST-a34940f2f87746abbdd8c117caee81cf-X\",\"secret_key\":\"FLWSECK_TEST-1cb427c96e0b1e6772a04504be3638bd-X\",\"text\":\"Pay via your Flutterwave account.\"}', 'flutterwave', 1),
(9, NULL, NULL, NULL, 'Razorpay', 'automatic', '{\"key\":\"rzp_test_fV9dM9URYbqjm7\",\"secret\":\"nickxZ1du2ojPYVVRTDif2Xr\",\"text\":\"Pay via your Razorpay account.\"}', 'razorpay', 1),
(11, NULL, NULL, NULL, 'Paytm', 'automatic', '{\"merchant\":\"tkogux49985047638244\",\"secret\":\"LhNGUUKE9xCQ9xY8\",\"website\":\"WEBSTAGING\",\"industry\":\"Retail\",\"text\":\"Pay via your paytm account.\"}', 'paytm', 1),
(12, NULL, NULL, NULL, 'Paystack', 'automatic', '{\"key\":\"pk_test_3a92490cb518c1b0d4c5f5273ea5cd67d5b4ea61\",\"secret_key\":\"sk_test_4ac9f2c43514e3cc08ab68f922201549ebda1bfd\",\"email\":\"test@test.com\",\"text\":\"Pay via your Paystack account.\"}', 'paystack', 1),
(13, NULL, NULL, NULL, 'Instamojo', 'automatic', '{\"key\":\"test_172371aa837ae5cad6047dc3052\",\"token\":\"test_4ac5a785e25fc596b67dbc5c267\",\"sandbox_check\":\"1\",\"text\":\"Pay via your Instamojo account.\"}', 'instamojo', 1),
(14, NULL, NULL, NULL, 'Stripe', 'automatic', '{\"key\":\"pk_test_UnU1Coi1p5qFGwtpjZMRMgJM\",\"secret\":\"sk_test_QQcg3vGsKRPlW6T3dXcNJsor\",\"text\":\"Pay via your Credit Card.\"}', 'stripe', 1),
(15, NULL, NULL, NULL, 'Paypal', 'automatic', '{\"client_id\":\"Aal5j466_JNRtBI3Yc-ADcseTX4Cnt25cTeIvvr0aWVvbSBAoFfBe2FnxetYxgId7WGKXyRRM2QHyAKM\",\"client_secret\":\"EO96wJdrs8HfT_cKeXtLmvJNGcau3GkuWr_Pv7RfDYQtjlH0F9Zei5T4_Ehbhl7i14TQPRV8ZzN6U7Wb\",\"sandbox_check\":\"1\",\"text\":\"Pay via your PayPal account.\"}', 'paypal', 1),
(17, NULL, NULL, NULL, 'Mollie Payment', 'automatic', '{\"key\":\"test_5HcWVs9qc5pzy36H9Tu9mwAyats33J\",\"text\":\"Pay via your Mollie Payment account.\"}', 'mollie', 1),
(18, NULL, NULL, NULL, 'PayUmoney', 'automatic', '{\"key\":\"gtKFFx\",\"salt\":\"eCwWELxi\",\"text\":\"Pay via your PayUmoney account.\",\"sandbox_check\":\"1\"}', 'payumoney', 1),
(19, NULL, NULL, NULL, 'Mercado Pago', 'automatic', '{\"token\":\"TEST-705032440135962-041006-ad2e021853f22338fe1a4db9f64d1491-421886156\",\"sandbox_check\":\"1\",\"text\":\"Pay via your Mercado Pago account.\"}', 'mercadopago', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pcategories`
--

CREATE TABLE `pcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_feature` int(11) NOT NULL DEFAULT 0,
  `products_in_home` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - yes, 0 - no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pcategories`
--

INSERT INTO `pcategories` (`id`, `name`, `slug`, `language_id`, `image`, `status`, `is_feature`, `products_in_home`, `created_at`, `updated_at`) VALUES
(1, 'Accessories', 'Accessories', 169, '6190e22c176d4.png', 1, 1, 0, '2020-04-18 03:56:01', '2021-11-14 05:17:16'),
(3, 'Pants', 'Pants', 169, NULL, 1, 0, 1, '2020-04-18 04:21:27', '2021-11-14 02:16:47'),
(4, 'Shoes', 'Shoes', 169, '6190e24c6ede7.png', 1, 1, 0, '2020-05-01 04:05:24', '2021-11-14 05:17:48'),
(7, 'Shirts', 'Shirts', 169, '6190e263bcc1f.png', 1, 1, 1, '2020-05-13 14:22:32', '2021-11-14 05:18:11'),
(25, 'About', 'About', 169, '6190d42bf2b81.jpg', 1, 0, 0, '2021-11-14 04:17:31', '2021-11-14 04:17:31');

-- --------------------------------------------------------

--
-- Table structure for table `permalinks`
--

CREATE TABLE `permalinks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permalink` varchar(50) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `details` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - for details page, 0 - for non-details page'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permalinks`
--

INSERT INTO `permalinks` (`id`, `permalink`, `type`, `details`) VALUES
(1, 'packages', 'packages', 0),
(2, 'package', 'package_order', 1),
(3, 'services', 'services', 0),
(4, 'service', 'service_details', 1),
(5, 'portfolios', 'portfolios', 0),
(6, 'portfolio', 'portfolio_details', 1),
(7, 'products', 'products', 0),
(8, 'product', 'product_details', 1),
(9, 'cart', 'cart', 0),
(10, 'checkout', 'product_checkout', 0),
(11, 'team', 'team', 0),
(12, 'courses', 'courses', 0),
(13, 'course', 'course_details', 1),
(14, 'causes', 'causes', 0),
(15, 'cause', 'cause_details', 1),
(16, 'events', 'events', 0),
(17, 'event', 'event_details', 1),
(18, 'career', 'career', 0),
(19, 'job', 'career_details', 1),
(20, 'event-calendar', 'event_calendar', 0),
(21, 'knowledgebase', 'knowledgebase', 0),
(22, 'article', 'knowledgebase_details', 1),
(23, 'gallery', 'gallery', 0),
(24, 'faq', 'faq', 0),
(25, 'blogs', 'blogs', 0),
(26, 'blog', 'blog_details', 1),
(27, 'rss', 'rss', 0),
(28, 'rss', 'rss_details', 1),
(29, 'contact', 'contact', 0),
(30, 'quote', 'quote', 0),
(31, 'login', 'login', 0),
(32, 'register', 'register', 0),
(33, 'forget-password', 'forget_password', 0),
(67, 'admin', 'admin_login', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `basic` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `status`, `basic`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'admin', 'dashboard', 1, 0, '2024-04-19 09:15:25', '2024-04-19 09:15:25'),
(2, 'theme-setting', 'admin', 'theme_management', 1, 0, '2024-04-19 09:15:25', '2024-04-19 09:15:25'),
(3, 'mega-menus', 'admin', 'website_menu_builder_management', 1, 0, '2024-04-19 09:15:25', '2024-04-19 09:15:25'),
(4, 'main-menus', 'admin', 'website_menu_builder_management', 1, 0, '2024-04-19 09:15:25', '2024-04-19 09:15:25'),
(5, 'permalinks', 'admin', 'website_menu_builder_management', 1, 0, '2024-04-19 09:15:25', '2024-04-19 09:15:25'),
(6, 'hero-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:25', '2024-04-19 09:15:25'),
(7, 'features', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:25', '2024-04-19 09:15:25'),
(8, 'intro-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(9, 'service-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(10, 'approach-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(11, 'statistics-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(12, 'call-to-action-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(13, 'portfolio-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(14, 'testimonials-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(15, 'team-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(16, 'blog-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(17, 'shareholder-section', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(18, 'sections-customization', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(19, 'portfolios', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(20, 'logo-text', 'admin', 'footer_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(21, 'useful-links', 'admin', 'footer_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(22, 'settings-services', 'admin', 'services_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(23, 'category-services', 'admin', 'services_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(24, 'services', 'admin', 'services_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(25, 'category-blog', 'admin', 'blog_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(26, 'blogs', 'admin', 'blog_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(27, 'archives', 'admin', 'blog_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(28, 'settings-gallery', 'admin', 'gallery_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(29, 'categories-gallery', 'admin', 'gallery_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(30, 'galleries', 'admin', 'gallery_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(31, 'settings-faq', 'admin', 'faq_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(32, 'categories-faq', 'admin', 'faq_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(33, 'faqs', 'admin', 'faq_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(34, 'categories-career', 'admin', 'career_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(35, 'post-job', 'admin', 'career_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(36, 'job-management', 'admin', 'career_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(37, 'settings-page', 'admin', 'custome_page_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(38, 'create-page', 'admin', 'custome_page_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(39, 'pages', 'admin', 'custome_page_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(40, 'news', 'admin', 'news_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(41, 'settings-package', 'admin', 'package_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(42, 'categories-package', 'admin', 'package_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(43, 'form-builder-package', 'admin', 'package_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(44, 'packages', 'admin', 'package_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(45, 'subscriptions', 'admin', 'subscription_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(46, 'subscription-request', 'admin', 'subscription_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(47, 'visibility', 'admin', 'quote_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(48, 'form-builder-quote', 'admin', 'quote_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(49, 'all-quotes', 'admin', 'quote_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(50, 'pending-quotes', 'admin', 'quote_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(51, 'processing-quotes', 'admin', 'quote_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(52, 'completed-quotes', 'admin', 'quote_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(53, 'rejected-quotes', 'admin', 'quote_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(54, 'settings-shop', 'admin', 'shop_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(55, 'popular-tags', 'admin', 'shop_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(56, 'shipping-charges', 'admin', 'shop_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(57, 'coupons', 'admin', 'shop_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(58, 'category-product', 'admin', 'product_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(59, 'products', 'admin', 'product_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(60, 'all-orders', 'admin', 'order_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(61, 'pending-orders', 'admin', 'order_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(62, 'processing-orders', 'admin', 'order_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(63, 'completed-orders', 'admin', 'order_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(64, 'rejected-orders', 'admin', 'order_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(65, 'report-order', 'admin', 'order_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(66, 'settings-course', 'admin', 'course_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(67, 'categories-course', 'admin', 'course_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(68, 'courses', 'admin', 'course_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(69, 'enrolls', 'admin', 'course_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(70, 'report-course', 'admin', 'course_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(71, 'settings-event', 'admin', 'event_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(72, 'categories-event', 'admin', 'event_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(73, 'all-events', 'admin', 'event_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(74, 'booking', 'admin', 'event_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(75, 'report-event', 'admin', 'event_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(76, 'settings-donation', 'admin', 'donation_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(77, 'all-cause', 'admin', 'donation_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(78, 'donations', 'admin', 'donation_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(79, 'report-donation', 'admin', 'donation_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(80, 'categories-acknowledged', 'admin', 'acknowledged_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(81, 'articles', 'admin', 'acknowledged_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(82, 'settings-tickets', 'admin', 'support_tickets_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(83, 'all-tickets', 'admin', 'support_tickets_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(84, 'pending-tickets', 'admin', 'support_tickets_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(85, 'open-tickets', 'admin', 'support_tickets_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(86, 'close-tickets', 'admin', 'support_tickets_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(87, 'import-rss', 'admin', 'rss_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(88, 'rss-feeds', 'admin', 'rss_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(89, 'rss-posts', 'admin', 'rss_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(90, 'register-users', 'admin', 'users_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(91, 'push-notification', 'admin', 'users_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(92, 'subscribers', 'admin', 'users_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(93, 'popups', 'admin', 'announcement_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(94, 'general-settings', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(95, 'email-settings', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(96, 'file-manager', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(97, 'logo-text-header', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(98, 'preloader', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(99, 'preferences', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(100, 'support-information', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(101, 'social-links', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(102, 'page-headings', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(103, 'payment-gateways', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(104, 'language', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(105, 'plugins', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(106, 'seo-information', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(107, 'maintenance-mode', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(108, 'cookies-alert', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(109, 'misc', 'admin', 'settings', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(110, 'profile', 'admin', 'profile_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(111, 'change-password', 'admin', 'profile_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(112, 'roles', 'admin', 'admin_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(113, 'admins', 'admin', 'admin_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(114, 'client-feedback', 'admin', 'feedbacks_management', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(116, 'audit-trail', 'admin', 'audit_trail', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(117, 'contact', 'admin', 'contact', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(118, 'package-background', 'admin', 'home_page_section_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(119, 'about-us-links', 'admin', 'footer_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(120, 'department-links', 'admin', 'footer_management', 1, 0, '2024-04-19 09:15:26', '2024-04-19 09:15:26'),
(121, 'tenders', 'admin', 'tenders', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(122, 'categories-tender', 'admin', 'tenders', 0, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(123, 'categories-document', 'admin', 'documents', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(124, 'documents', 'admin', 'documents', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(125, 'e-governance', 'admin', 'e-governance', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(126, 'categories-leadership', 'admin', 'leadership', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(127, 'leadership', 'admin', 'leadership', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(128, 'history', 'admin', 'history', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(130, 'profit-budget-chart', 'admin', 'profit-budget-chart', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(131, 'water-teriff-charges', 'admin', 'water-teriff-charges', 1, 0, '2024-04-19 09:15:27', '2024-04-19 09:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(20) NOT NULL DEFAULT '39498a',
  `title` varchar(255) DEFAULT NULL,
  `short_text` text DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popups`
--

CREATE TABLE `popups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `background_image` varchar(100) DEFAULT NULL,
  `background_color` varchar(100) DEFAULT NULL,
  `background_opacity` decimal(8,2) NOT NULL DEFAULT 1.00,
  `title` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `button_color` varchar(20) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `delay` int(11) NOT NULL DEFAULT 1000 COMMENT 'in milisconds',
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `submission_date` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `content` blob DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `feature` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - will not show in home, 1 - will show in home',
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `website_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_images`
--

CREATE TABLE `portfolio_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) DEFAULT 0,
  `sku` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `feature_image` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `current_price` decimal(8,2) DEFAULT 0.00,
  `previous_price` decimal(8,2) DEFAULT 0.00,
  `is_feature` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rating` decimal(11,2) NOT NULL DEFAULT 0.00,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL COMMENT 'digital - digital product, physical - physical product',
  `download_file` varchar(100) DEFAULT NULL,
  `download_link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(19, 7, '5f006ffd15442.jpg', '2020-05-01 04:06:03', '2020-07-04 06:07:17'),
(20, 7, '5f006ffd18542.jpg', '2020-05-01 04:06:03', '2020-07-04 06:07:17'),
(21, 7, '5f006ffd7884b.jpg', '2020-05-01 04:06:03', '2020-07-04 06:07:17'),
(79, 13, '5f006ffd7884b.jpg', '2020-06-25 06:10:25', '2020-07-04 06:07:17'),
(80, 13, '5f006ffd79b1c.jpg', '2020-06-25 06:10:25', '2020-07-04 06:07:17'),
(81, 13, '5f006ffde2622.jpg', '2020-06-25 06:34:21', '2020-07-04 06:07:17'),
(82, 13, '5f006ffde7ce0.jpg', '2020-06-25 06:34:23', '2020-07-04 06:07:17'),
(83, 13, '5f006ffd15442.jpg', '2020-06-25 06:34:26', '2020-07-04 06:07:17'),
(84, 13, '5f006ffd18542.jpg', '2020-06-25 06:34:45', '2020-07-04 06:07:17'),
(85, 10, '5f006ffd7884b.jpg', '2020-06-25 08:16:28', '2020-07-04 06:07:17'),
(86, 10, '5f006ffd79b1c.jpg', '2020-06-25 08:16:28', '2020-07-04 06:07:17'),
(88, 10, '5f006ffde2622.jpg', '2020-06-25 08:16:28', '2020-07-04 06:07:17'),
(89, 10, '5f006ffde7ce0.jpg', '2020-06-25 08:16:29', '2020-07-04 06:07:17'),
(90, 10, '5f006ffd15442.jpg', '2020-06-25 08:16:29', '2020-07-04 06:07:17'),
(91, 10, '5f006ffd18542.jpg', '2020-06-25 08:18:32', '2020-07-04 06:07:17'),
(92, 7, '5f006ffd7884b.jpg', '2020-06-25 08:22:48', '2020-07-04 06:07:17'),
(93, 7, '5f006ffd79b1c.jpg', '2020-06-25 08:22:48', '2020-07-04 06:07:17'),
(94, 7, '5f006ffde2622.jpg', '2020-06-25 08:22:48', '2020-07-04 06:07:17'),
(95, 6, '5f006ffde7ce0.jpg', '2020-06-25 08:25:08', '2020-07-04 06:07:17'),
(96, 6, '5f006ffd15442.jpg', '2020-06-25 08:25:08', '2020-07-04 06:07:17'),
(97, 6, '5f006ffd18542.jpg', '2020-06-25 08:25:09', '2020-07-04 06:07:17'),
(98, 6, '5f006ffd7884b.jpg', '2020-06-25 08:25:09', '2020-07-04 06:07:17'),
(99, 6, '5f006ffd79b1c.jpg', '2020-06-25 08:25:10', '2020-07-04 06:07:17'),
(100, 6, '5f006ffde2622.jpg', '2020-06-25 08:25:10', '2020-07-04 06:07:17'),
(101, 5, '5f006ffde7ce0.jpg', '2020-06-25 08:27:08', '2020-07-04 06:07:17'),
(102, 5, '5f006ffd15442.jpg', '2020-06-25 08:27:08', '2020-07-04 06:07:17'),
(103, 5, '5f006ffd18542.jpg', '2020-06-25 08:27:09', '2020-07-04 06:07:17'),
(104, 5, '5f006ffd7884b.jpg', '2020-06-25 08:27:09', '2020-07-04 06:07:17'),
(105, 5, '5f006ffd79b1c.jpg', '2020-06-25 08:27:09', '2020-07-04 06:07:17'),
(106, 5, '5f006ffde2622.jpg', '2020-06-25 08:27:09', '2020-07-04 06:07:17'),
(113, 14, '5f006ffde7ce0.jpg', '2020-06-25 08:45:50', '2020-07-04 06:07:17'),
(114, 14, '5f006ffd15442.jpg', '2020-06-25 08:45:50', '2020-07-04 06:07:17'),
(115, 14, '5f006ffd18542.jpg', '2020-06-25 08:45:50', '2020-07-04 06:07:17'),
(116, 14, '5f006ffd7884b.jpg', '2020-06-25 08:45:50', '2020-07-04 06:07:17'),
(117, 14, '5f006ffd79b1c.jpg', '2020-06-25 08:45:50', '2020-07-04 06:07:17'),
(118, 14, '5f006ffde2622.jpg', '2020-06-25 08:45:50', '2020-07-04 06:07:17'),
(119, 15, '5f006ffde7ce0.jpg', '2020-06-25 08:48:42', '2020-07-04 06:07:17'),
(120, 15, '5f006ffd15442.jpg', '2020-06-25 08:48:42', '2020-07-04 06:07:17'),
(121, 15, '5f006ffd18542.jpg', '2020-06-25 08:48:43', '2020-07-04 06:07:17'),
(122, 15, '5f006ffd7884b.jpg', '2020-06-25 08:48:43', '2020-07-04 06:07:17'),
(123, 15, '5f006ffd79b1c.jpg', '2020-06-25 08:48:43', '2020-07-04 06:07:17'),
(124, 15, '5f006ffde2622.jpg', '2020-06-25 08:48:43', '2020-07-04 06:07:17'),
(125, 16, '5f006ffde7ce0.jpg', '2020-06-25 08:51:00', '2020-07-04 06:07:17'),
(126, 16, '5f006ffd15442.jpg', '2020-06-25 08:51:00', '2020-07-04 06:07:17'),
(127, 16, '5f006ffd18542.jpg', '2020-06-25 08:51:00', '2020-07-04 06:07:17'),
(128, 16, '5f006ffd7884b.jpg', '2020-06-25 08:51:00', '2020-07-04 06:07:17'),
(129, 16, '5f006ffd79b1c.jpg', '2020-06-25 08:51:01', '2020-07-04 06:07:17'),
(130, 16, '5f006ffde2622.jpg', '2020-06-25 08:51:01', '2020-07-04 06:07:17'),
(131, 17, '5f006ffde7ce0.jpg', '2020-06-25 09:00:45', '2020-07-04 06:07:17'),
(132, 17, '5f006ffd15442.jpg', '2020-06-25 09:00:45', '2020-07-04 06:07:17'),
(133, 17, '5f006ffd18542.jpg', '2020-06-25 09:00:45', '2020-07-04 06:07:17'),
(134, 17, '5f006ffd7884b.jpg', '2020-06-25 09:00:46', '2020-07-04 06:07:17'),
(135, 17, '5f006ffd79b1c.jpg', '2020-06-25 09:00:46', '2020-07-04 06:07:17'),
(136, 17, '5f006ffde2622.jpg', '2020-06-25 09:00:56', '2020-07-04 06:07:17'),
(143, 18, '5f006ffde7ce0.jpg', '2020-06-25 11:19:12', '2020-07-04 06:07:17'),
(144, 18, '5f006ffd15442.jpg', '2020-06-25 11:19:12', '2020-07-04 06:07:17'),
(145, 18, '5f006ffd18542.jpg', '2020-06-25 11:19:13', '2020-07-04 06:07:17'),
(146, 18, '5f006ffd7884b.jpg', '2020-06-25 11:19:13', '2020-07-04 06:07:17'),
(147, 18, '5f006ffd79b1c.jpg', '2020-06-25 11:19:13', '2020-07-04 06:07:17'),
(148, 18, '5f006ffde2622.jpg', '2020-06-25 11:19:17', '2020-07-04 06:07:17'),
(149, 19, '5f006ffde7ce0.jpg', '2020-06-25 11:20:25', '2020-07-04 06:07:17'),
(150, 19, '5f006ffd15442.jpg', '2020-06-25 11:20:25', '2020-07-04 06:07:17'),
(151, 19, '5f006ffd18542.jpg', '2020-06-25 11:20:26', '2020-07-04 06:07:17'),
(152, 19, '5f006ffd7884b.jpg', '2020-06-25 11:20:26', '2020-07-04 06:07:17'),
(153, 19, '5f006ffd79b1c.jpg', '2020-06-25 11:20:26', '2020-07-04 06:07:17'),
(155, 19, '5f006ffde2622.jpg', '2020-06-25 11:20:37', '2020-07-04 06:07:17'),
(156, 20, '5f006ffde7ce0.jpg', '2020-06-25 11:23:26', '2020-07-04 06:07:17'),
(157, 20, '5f006ffd15442.jpg', '2020-06-25 11:23:26', '2020-07-04 06:07:17'),
(158, 20, '5f006ffd18542.jpg', '2020-06-25 11:23:26', '2020-07-04 06:07:17'),
(159, 20, '5f006ffd7884b.jpg', '2020-06-25 11:23:26', '2020-07-04 06:07:17'),
(160, 20, '5f006ffd79b1c.jpg', '2020-06-25 11:23:27', '2020-07-04 06:07:17'),
(161, 20, '5f006ffde2622.jpg', '2020-06-25 11:23:27', '2020-07-04 06:07:17'),
(162, 21, '5f006ffde7ce0.jpg', '2020-06-25 11:30:49', '2020-07-04 06:07:17'),
(163, 21, '5f006ffd15442.jpg', '2020-06-25 11:30:49', '2020-07-04 06:07:17'),
(164, 21, '5f006ffd18542.jpg', '2020-06-25 11:30:49', '2020-07-04 06:07:17'),
(165, 21, '5f006ffd7884b.jpg', '2020-06-25 11:30:49', '2020-07-04 06:07:17'),
(166, 21, '5f006ffd79b1c.jpg', '2020-06-25 11:30:50', '2020-07-04 06:07:17'),
(167, 21, '5f006ffde2622.jpg', '2020-06-25 11:30:50', '2020-07-04 06:07:17'),
(168, 22, '5f006ffde7ce0.jpg', '2020-06-25 11:34:00', '2020-07-04 06:07:17'),
(169, 22, '5f006ffd15442.jpg', '2020-06-25 11:34:00', '2020-07-04 06:07:17'),
(170, 22, '5f006ffd18542.jpg', '2020-06-25 11:34:00', '2020-07-04 06:07:17'),
(171, 22, '5f006ffd7884b.jpg', '2020-06-25 11:34:00', '2020-07-04 06:07:17'),
(172, 22, '5f006ffd79b1c.jpg', '2020-06-25 11:34:01', '2020-07-04 06:07:17'),
(173, 22, '5f006ffde2622.jpg', '2020-06-25 11:34:01', '2020-07-04 06:07:17'),
(174, 23, '5f006ffde7ce0.jpg', '2020-06-25 21:36:22', '2020-07-04 06:07:17'),
(175, 23, '5f006ffd15442.jpg', '2020-06-25 21:36:22', '2020-07-04 06:07:17'),
(176, 23, '5f006ffd18542.jpg', '2020-06-25 21:36:22', '2020-07-04 06:07:17'),
(177, 23, '5f006ffd7884b.jpg', '2020-06-25 21:36:22', '2020-07-04 06:07:17'),
(178, 23, '5f006ffd79b1c.jpg', '2020-06-25 21:36:22', '2020-07-04 06:07:17'),
(179, 23, '5f006ffde2622.jpg', '2020-06-25 21:36:22', '2020-07-04 06:07:17'),
(180, 24, '5f006ffde7ce0.jpg', '2020-06-25 22:36:13', '2020-07-04 06:07:17'),
(181, 24, '5f006ffd15442.jpg', '2020-06-25 22:36:13', '2020-07-04 06:07:17'),
(182, 24, '5f006ffd18542.jpg', '2020-06-25 22:36:14', '2020-07-04 06:07:17'),
(183, 24, '5f006ffd7884b.jpg', '2020-06-25 22:36:14', '2020-07-04 06:07:17'),
(184, 24, '5f006ffd79b1c.jpg', '2020-06-25 22:36:14', '2020-07-04 06:07:17'),
(185, 24, '5f006ffde2622.jpg', '2020-06-25 22:36:15', '2020-07-04 06:07:17'),
(186, 25, '5f006ffde7ce0.jpg', '2020-06-25 22:39:13', '2020-07-04 06:07:17'),
(187, 25, '5f006ffd15442.jpg', '2020-06-25 22:39:13', '2020-07-04 06:07:17'),
(188, 25, '5f006ffd18542.jpg', '2020-06-25 22:39:14', '2020-07-04 06:07:17'),
(189, 25, '5f006ffd7884b.jpg', '2020-06-25 22:39:14', '2020-07-04 06:07:17'),
(190, 25, '5f006ffd79b1c.jpg', '2020-06-25 22:39:34', '2020-07-04 06:07:17'),
(191, 25, '5f006ffde2622.jpg', '2020-06-25 22:39:34', '2020-07-04 06:07:17'),
(192, 26, '5f006ffde7ce0.jpg', '2020-06-26 01:01:07', '2020-07-04 06:07:17'),
(193, 26, '5f006ffd15442.jpg', '2020-06-26 01:01:07', '2020-07-04 06:07:17'),
(194, 26, '5f006ffd18542.jpg', '2020-06-26 01:01:07', '2020-07-04 06:07:17'),
(195, 26, '5f006ffd7884b.jpg', '2020-06-26 01:01:08', '2020-07-04 06:07:17'),
(196, 26, '5f006ffd79b1c.jpg', '2020-06-26 01:01:08', '2020-07-04 06:07:17'),
(197, 26, '5f006ffde2622.jpg', '2020-06-26 01:01:08', '2020-07-04 06:07:17'),
(198, 27, '5f006ffde7ce0.jpg', '2020-06-26 01:19:02', '2020-07-04 06:07:17'),
(199, 27, '5f006ffd15442.jpg', '2020-06-26 01:19:02', '2020-07-04 06:07:17'),
(200, 27, '5f006ffd18542.jpg', '2020-06-26 01:19:03', '2020-07-04 06:07:17'),
(201, 27, '5f006ffd7884b.jpg', '2020-06-26 01:19:03', '2020-07-04 06:07:17'),
(202, 27, '5f006ffd79b1c.jpg', '2020-06-26 01:19:03', '2020-07-04 06:07:17'),
(203, 27, '5f006ffde2622.jpg', '2020-06-26 01:19:03', '2020-07-04 06:07:17'),
(204, 28, '5f006ffde7ce0.jpg', '2020-06-26 01:22:11', '2020-07-04 06:07:17'),
(205, 28, '5f006ffd15442.jpg', '2020-06-26 01:22:11', '2020-07-04 06:07:17'),
(206, 28, '5f006ffd18542.jpg', '2020-06-26 01:22:12', '2020-07-04 06:07:17'),
(207, 28, '5f006ffd7884b.jpg', '2020-06-26 01:22:12', '2020-07-04 06:07:17'),
(208, 28, '5f006ffd79b1c.jpg', '2020-06-26 01:22:12', '2020-07-04 06:07:17'),
(209, 28, '5f006ffde2622.jpg', '2020-06-26 01:22:12', '2020-07-04 06:07:17'),
(210, 29, '5f006ffde7ce0.jpg', '2020-06-26 01:27:27', '2020-07-04 06:07:17'),
(211, 29, '5f006ffd15442.jpg', '2020-06-26 01:27:27', '2020-07-04 06:07:17'),
(212, 29, '5f006ffd18542.jpg', '2020-06-26 01:27:27', '2020-07-04 06:07:17'),
(213, 29, '5f006ffd7884b.jpg', '2020-06-26 01:27:27', '2020-07-04 06:07:17'),
(214, 29, '5f006ffd79b1c.jpg', '2020-06-26 01:27:27', '2020-07-04 06:07:17'),
(215, 29, '5f006ffde2622.jpg', '2020-06-26 01:27:27', '2020-07-04 06:07:17'),
(216, 30, '5f006ffde7ce0.jpg', '2020-06-26 01:36:15', '2020-07-04 06:07:17'),
(217, 30, '5f006ffd15442.jpg', '2020-06-26 01:36:15', '2020-07-04 06:07:17'),
(218, 30, '5f006ffd18542.jpg', '2020-06-26 01:36:15', '2020-07-04 06:07:17'),
(219, 30, '5f006ffd7884b.jpg', '2020-06-26 01:36:15', '2020-07-04 06:07:17'),
(220, 30, '5f006ffd79b1c.jpg', '2020-06-26 01:36:16', '2020-07-04 06:07:17'),
(221, 30, '5f006ffde2622.jpg', '2020-06-26 01:36:16', '2020-07-04 06:07:17'),
(222, 31, '5f006ffde7ce0.jpg', '2020-06-26 01:40:39', '2020-07-04 06:07:17'),
(223, 31, '5f006ffd15442.jpg', '2020-06-26 01:40:39', '2020-07-04 06:07:17'),
(224, 31, '5f006ffd18542.jpg', '2020-06-26 01:40:39', '2020-07-04 06:07:17'),
(225, 31, '5f006ffd7884b.jpg', '2020-06-26 01:40:39', '2020-07-04 06:07:17'),
(226, 31, '5f006ffd79b1c.jpg', '2020-06-26 01:40:40', '2020-07-04 06:07:17'),
(227, 31, '5f006ffde2622.jpg', '2020-06-26 01:40:40', '2020-07-04 06:07:17'),
(228, 32, '5f006ffde7ce0.jpg', '2020-06-26 01:42:40', '2020-07-04 06:07:17'),
(229, 32, '5f006ffd15442.jpg', '2020-06-26 01:42:40', '2020-07-04 06:07:17'),
(230, 32, '5f006ffd18542.jpg', '2020-06-26 01:42:40', '2020-07-04 06:07:17'),
(231, 32, '5f006ffd7884b.jpg', '2020-06-26 01:42:40', '2020-07-04 06:07:17'),
(232, 32, '5f006ffd79b1c.jpg', '2020-06-26 01:42:41', '2020-07-04 06:07:17'),
(233, 32, '5f006ffde2622.jpg', '2020-06-26 01:42:41', '2020-07-04 06:07:17'),
(234, 33, '5f006ffde7ce0.jpg', '2020-06-26 01:45:30', '2020-07-04 06:07:17'),
(235, 33, '5f006ffd15442.jpg', '2020-06-26 01:45:30', '2020-07-04 06:07:17'),
(236, 33, '5f006ffd18542.jpg', '2020-06-26 01:45:31', '2020-07-04 06:07:17'),
(237, 33, '5f006ffd7884b.jpg', '2020-06-26 01:45:31', '2020-07-04 06:07:17'),
(238, 33, '5f006ffd79b1c.jpg', '2020-06-26 01:45:31', '2020-07-04 06:07:17'),
(239, 33, '5f006ffde2622.jpg', '2020-06-26 01:45:31', '2020-07-04 06:07:17'),
(240, NULL, '5f006ffde7ce0.jpg', '2020-06-26 01:47:09', '2020-07-04 06:07:17'),
(241, NULL, '5f006ffd15442.jpg', '2020-06-26 01:47:09', '2020-07-04 06:07:17'),
(242, NULL, '5f006ffd18542.jpg', '2020-06-26 01:47:10', '2020-07-04 06:07:17'),
(243, NULL, '5f006ffd7884b.jpg', '2020-06-26 01:47:10', '2020-07-04 06:07:17'),
(244, NULL, '5f006ffd79b1c.jpg', '2020-06-26 01:47:10', '2020-07-04 06:07:17'),
(245, NULL, '5f006ffde2622.jpg', '2020-06-26 01:47:10', '2020-07-04 06:07:17'),
(246, 34, '5f006ffde7ce0.jpg', '2020-06-26 04:41:01', '2020-07-04 06:07:17'),
(247, 34, '5f006ffd15442.jpg', '2020-06-26 04:41:01', '2020-07-04 06:07:17'),
(248, 34, '5f006ffd18542.jpg', '2020-06-26 04:41:02', '2020-07-04 06:07:17'),
(249, 34, '5f006ffd7884b.jpg', '2020-06-26 04:41:02', '2020-07-04 06:07:17'),
(250, 34, '5f006ffd79b1c.jpg', '2020-06-26 04:41:02', '2020-07-04 06:07:17'),
(251, 34, '5f006ffde2622.jpg', '2020-06-26 04:41:03', '2020-07-04 06:07:17'),
(252, NULL, '5f006ffde7ce0.jpg', '2020-06-26 04:52:38', '2020-07-04 06:07:17'),
(253, NULL, '5f006ffd15442.jpg', '2020-06-26 04:52:38', '2020-07-04 06:07:17'),
(254, NULL, '5f006ffd18542.jpg', '2020-06-26 04:52:39', '2020-07-04 06:07:17'),
(255, NULL, '5f006ffd7884b.jpg', '2020-06-26 04:52:39', '2020-07-04 06:07:17'),
(256, NULL, '5f006ffd79b1c.jpg', '2020-06-26 04:52:39', '2020-07-04 06:07:17'),
(257, NULL, '5f006ffde2622.jpg', '2020-06-26 04:52:46', '2020-07-04 06:07:17'),
(258, 35, '5f006ffde7ce0.jpg', '2020-06-26 05:05:06', '2020-07-04 06:07:17'),
(259, 35, '5f006ffd15442.jpg', '2020-06-26 05:05:07', '2020-07-04 06:07:17'),
(260, 35, '5f006ffd18542.jpg', '2020-06-26 05:05:07', '2020-07-04 06:07:18'),
(261, 35, '5f006ffd7884b.jpg', '2020-06-26 05:05:07', '2020-07-04 06:07:18'),
(262, 35, '5f006ffd79b1c.jpg', '2020-06-26 05:05:07', '2020-07-04 06:07:18'),
(263, 35, '5f006ffde2622.jpg', '2020-06-26 05:05:13', '2020-07-04 06:07:18'),
(264, 36, '5f006ffde7ce0.jpg', '2020-06-26 05:11:00', '2020-07-04 06:07:18'),
(265, 36, '5f006ffd15442.jpg', '2020-06-26 05:11:00', '2020-07-04 06:07:18'),
(266, 36, '5f006ffd18542.jpg', '2020-06-26 05:11:00', '2020-07-04 06:07:18'),
(267, 36, '5f006ffd7884b.jpg', '2020-06-26 05:11:00', '2020-07-04 06:07:18'),
(268, 36, '5f006ffd79b1c.jpg', '2020-06-26 05:11:01', '2020-07-04 06:07:18'),
(269, 36, '5f006ffde2622.jpg', '2020-06-26 05:11:01', '2020-07-04 06:07:18'),
(270, 37, '5f006ffde7ce0.jpg', '2020-06-26 05:18:56', '2020-07-04 06:07:18'),
(271, 37, '5f006ffd15442.jpg', '2020-06-26 05:18:56', '2020-07-04 06:07:18'),
(272, 37, '5f006ffd18542.jpg', '2020-06-26 05:18:56', '2020-07-04 06:07:18'),
(273, 37, '5f006ffd7884b.jpg', '2020-06-26 05:18:56', '2020-07-04 06:07:18'),
(274, 37, '5f006ffd79b1c.jpg', '2020-06-26 05:18:57', '2020-07-04 06:07:18'),
(275, 37, '5f006ffde2622.jpg', '2020-06-26 05:18:57', '2020-07-04 06:07:18'),
(276, 38, '5f006ffde7ce0.jpg', '2020-06-26 05:22:26', '2020-07-04 06:07:18'),
(277, 38, '5f006ffd15442.jpg', '2020-06-26 05:22:26', '2020-07-04 06:07:18'),
(278, 38, '5f006ffd18542.jpg', '2020-06-26 05:22:26', '2020-07-04 06:07:18'),
(279, 38, '5f006ffd7884b.jpg', '2020-06-26 05:22:26', '2020-07-04 06:07:18'),
(280, 38, '5f006ffd79b1c.jpg', '2020-06-26 05:22:27', '2020-07-04 06:07:18'),
(281, 38, '5f006ffde2622.jpg', '2020-06-26 05:22:27', '2020-07-04 06:07:18'),
(282, 39, '5f006ffde7ce0.jpg', '2020-06-26 05:26:44', '2020-07-04 06:07:18'),
(283, 39, '5f006ffd15442.jpg', '2020-06-26 05:26:44', '2020-07-04 06:07:18'),
(284, 39, '5f006ffd18542.jpg', '2020-06-26 05:26:44', '2020-07-04 06:07:18'),
(285, 39, '5f006ffd7884b.jpg', '2020-06-26 05:26:44', '2020-07-04 06:07:18'),
(286, 39, '5f006ffd79b1c.jpg', '2020-06-26 05:26:45', '2020-07-04 06:07:18'),
(287, 39, '5f006ffde2622.jpg', '2020-06-26 05:26:45', '2020-07-04 06:07:18'),
(288, 40, '5f006ffde7ce0.jpg', '2020-06-26 05:29:55', '2020-07-04 06:07:18'),
(289, 40, '5f006ffd15442.jpg', '2020-06-26 05:29:55', '2020-07-04 06:07:18'),
(290, 40, '5f006ffd18542.jpg', '2020-06-26 05:29:55', '2020-07-04 06:07:18'),
(291, 40, '5f006ffd7884b.jpg', '2020-06-26 05:29:55', '2020-07-04 06:07:18'),
(292, 40, '5f006ffd79b1c.jpg', '2020-06-26 05:29:55', '2020-07-04 06:07:18'),
(293, 40, '5f006ffde2622.jpg', '2020-06-26 05:29:55', '2020-07-04 06:07:18'),
(294, 41, '5f006ffde7ce0.jpg', '2020-06-26 05:34:55', '2020-07-04 06:07:18'),
(295, 41, '5f006ffd15442.jpg', '2020-06-26 05:34:55', '2020-07-04 06:07:18'),
(296, 41, '5f006ffd18542.jpg', '2020-06-26 05:34:56', '2020-07-04 06:07:18'),
(297, 41, '5f006ffd7884b.jpg', '2020-06-26 05:34:56', '2020-07-04 06:07:18'),
(298, 41, '5f006ffd79b1c.jpg', '2020-06-26 05:34:56', '2020-07-04 06:07:18'),
(299, 41, '5f006ffde2622.jpg', '2020-06-26 05:34:56', '2020-07-04 06:07:18'),
(300, 42, '5f006ffde7ce0.jpg', '2020-06-26 05:38:55', '2020-07-04 06:07:18'),
(301, 42, '5f006ffd15442.jpg', '2020-06-26 05:38:55', '2020-07-04 06:07:18'),
(302, 42, '5f006ffd18542.jpg', '2020-06-26 05:38:56', '2020-07-04 06:07:18'),
(303, 42, '5f006ffd7884b.jpg', '2020-06-26 05:38:56', '2020-07-04 06:07:18'),
(304, 42, '5f006ffd79b1c.jpg', '2020-06-26 05:38:56', '2020-07-04 06:07:18'),
(305, 42, '5f006ffde2622.jpg', '2020-06-26 05:38:56', '2020-07-04 06:07:18'),
(306, 43, '5f006ffde7ce0.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(307, 43, '5f006ffd15442.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(308, 43, '5f006ffd18542.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(309, 43, '5f006ffd7884b.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(311, 43, '5f006ffd79b1c.jpg', '2020-06-26 05:40:24', '2020-07-04 06:07:18'),
(312, 43, '5f006ffde2622.jpg', '2020-06-26 05:40:24', '2020-07-04 06:07:18'),
(313, 4, '5f006ffde7ce0.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(314, 4, '5f006ffd15442.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(315, 4, '5f006ffd18542.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(316, 4, '5f006ffd7884b.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(317, 4, '5f006ffd79b1c.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(318, 4, '5f006ffde2622.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(332, 46, '5f006ffde7ce0.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(333, 46, '5f006ffd15442.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(334, 46, '5f006ffd18542.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(335, 46, '5f006ffd7884b.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(336, 46, '5f006ffd79b1c.jpg', '2020-06-26 05:40:24', '2020-07-04 06:07:18'),
(337, 46, '5f006ffde2622.jpg', '2020-06-26 05:40:24', '2020-07-04 06:07:18'),
(338, 47, '5f006ffde7ce0.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(339, 47, '5f006ffd15442.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(340, 47, '5f006ffd18542.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(341, 47, '5f006ffd7884b.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(342, 47, '5f006ffd79b1c.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(343, 47, '5f006ffde2622.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(344, 49, '5f006ffde7ce0.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(345, 49, '5f006ffd15442.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(346, 49, '5f006ffd18542.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(347, 49, '5f006ffd7884b.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(348, 49, '5f006ffd79b1c.jpg', '2020-06-26 05:40:24', '2020-07-04 06:07:18'),
(349, 49, '5f006ffde2622.jpg', '2020-06-26 05:40:24', '2020-07-04 06:07:18'),
(350, 50, '5f006ffde7ce0.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(351, 50, '5f006ffd15442.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(352, 50, '5f006ffd18542.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(353, 50, '5f006ffd7884b.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(354, 50, '5f006ffd79b1c.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(355, 50, '5f006ffde2622.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(356, 51, '5f006ffde7ce0.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(357, 51, '5f006ffd15442.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(358, 51, '5f006ffd18542.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(359, 49, '5f006ffd7884b.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(360, 51, '5f006ffd79b1c.jpg', '2020-06-26 05:40:24', '2020-07-04 06:07:18'),
(361, 51, '5f006ffde2622.jpg', '2020-06-26 05:40:24', '2020-07-04 06:07:18'),
(362, 52, '5f006ffde7ce0.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(363, 52, '5f006ffd15442.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(364, 52, '5f006ffd18542.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(365, 52, '5f006ffd7884b.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(366, 53, '5f006ffde7ce0.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(367, 53, '5f006ffd15442.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(368, 53, '5f006ffd18542.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(369, 53, '5f006ffd7884b.jpg', '2020-06-26 05:40:23', '2020-07-04 06:07:18'),
(370, 53, '5f006ffd79b1c.jpg', '2020-06-26 05:40:24', '2020-07-04 06:07:18'),
(371, 53, '5f006ffde2622.jpg', '2020-06-26 05:40:24', '2020-07-04 06:07:18'),
(372, 54, '5f006ffde7ce0.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(373, 54, '5f006ffd15442.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(374, 54, '5f006ffd18542.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18'),
(375, 54, '5f006ffd7884b.jpg', '2020-07-04 06:03:09', '2020-07-04 06:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `billing_country` varchar(255) NOT NULL,
  `billing_fname` varchar(255) NOT NULL,
  `billing_lname` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `billing_city` varchar(255) NOT NULL,
  `billing_email` varchar(255) NOT NULL,
  `billing_number` varchar(255) NOT NULL,
  `shpping_country` varchar(255) NOT NULL,
  `shpping_fname` varchar(255) NOT NULL,
  `shpping_lname` varchar(255) NOT NULL,
  `shpping_address` varchar(255) NOT NULL,
  `shpping_city` varchar(255) NOT NULL,
  `shpping_email` varchar(255) NOT NULL,
  `shpping_number` varchar(255) NOT NULL,
  `cart_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total` decimal(11,2) DEFAULT NULL,
  `method` varchar(255) NOT NULL,
  `gateway_type` varchar(50) DEFAULT NULL,
  `currency_code` varchar(255) NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `shipping_charge` decimal(11,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL DEFAULT 'pending',
  `txnid` varchar(255) NOT NULL,
  `charge_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `receipt` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `user_id`, `billing_country`, `billing_fname`, `billing_lname`, `billing_address`, `billing_city`, `billing_email`, `billing_number`, `shpping_country`, `shpping_fname`, `shpping_lname`, `shpping_address`, `shpping_city`, `shpping_email`, `shpping_number`, `cart_total`, `discount`, `tax`, `total`, `method`, `gateway_type`, `currency_code`, `order_number`, `shipping_method`, `shipping_charge`, `payment_status`, `order_status`, `txnid`, `charge_id`, `created_at`, `updated_at`, `invoice_number`, `receipt`) VALUES
(189, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '1061.00', '0.00', '53.05', '1114.05', 'mollie', 'online', 'USD', 'vhWX1619160365', NULL, '0.00', 'Completed', 'pending', 'txn_3aBckhcF1619160365', 'ch_icP8PV9fE1619160365', '2021-04-23 02:46:05', '2021-04-23 02:46:22', 'Zi1W1619160377.pdf', NULL),
(190, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '111.00', '0.00', '5.55', '116.55', 'Concert', 'offline', 'USD', 'vT5p1619160444', NULL, '0.00', 'Pending', 'pending', 'txn_gxYtPBDg1619160444', 'ch_vCEZ3zSqa1619160444', '2021-04-23 02:47:24', '2021-04-23 02:47:29', 'iOrI1619160444.pdf', '60826d7cc0936.jpg'),
(191, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '85.00', '0.00', '4.25', '89.25', 'mollie', 'online', 'USD', '2si01619160477', NULL, '0.00', 'Completed', 'pending', 'txn_09wXOWlP1619160477', 'ch_kYikzeoI21619160477', '2021-04-23 02:47:57', '2021-04-23 02:48:12', 'fgLs1619160486.pdf', NULL),
(192, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '120.00', '0.00', '6.00', '126.00', 'paypal', 'online', 'USD', 'x4ac1619160573', NULL, '0.00', 'Completed', 'pending', '92H316910D389741X', 'PAYID-MCBG3XY8C758321J3613780H', '2021-04-23 02:49:33', '2021-04-23 02:49:39', 'Pa4W1619160573.pdf', NULL),
(193, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '290.00', '0.00', '14.50', '304.50', 'stripe', 'online', 'USD', 'TkRk1619160630', NULL, '0.00', 'Completed', 'pending', 'txn_1IjIqSJlIV5dN9n7MV1IayJ4', 'ch_1IjIqSJlIV5dN9n7ljeXVRmr', '2021-04-23 02:50:30', '2021-04-23 02:50:34', 'kRZJ1619160630.pdf', NULL),
(194, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '60.00', '0.00', '3.00', '63.00', 'mollie', 'online', 'USD', 'D1GF1619172781', NULL, '0.00', 'Completed', 'pending', 'txn_p3EIoFmu1619172781', 'ch_hK2qKA4N61619172781', '2021-04-23 06:13:01', '2021-04-23 06:13:17', '02oL1619172792.pdf', NULL),
(195, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '61.00', '0.00', '3.05', '74.05', 'paypal', 'online', 'USD', 'qG1L1619175463', 'Same Day Shipping', '10.00', 'Completed', 'pending', '30R54466LG0826941', 'PAYID-MCBKPUA5TN241911N973805S', '2021-04-23 06:57:43', '2021-04-23 06:57:47', 'bj4x1619175463.pdf', NULL),
(196, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '180.00', '0.00', '9.00', '199.00', 'payumoney', 'online', 'INR', 'n56O1619335908', 'Same Day Shipping', '10.00', 'Pending', 'pending', 'txn_fKN8deHV1619335908', 'ch_oU0NoXRRe1619335908', '2021-04-25 03:31:48', '2021-04-25 03:31:48', NULL, NULL),
(197, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '180.00', '0.00', '9.00', '199.00', 'payumoney', 'online', 'INR', 'tbHx1619335939', 'Same Day Shipping', '10.00', 'Pending', 'pending', 'txn_3bevh7bN1619335939', 'ch_mGh4u6NeM1619335939', '2021-04-25 03:32:19', '2021-04-25 03:32:19', NULL, NULL),
(198, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '120.00', '0.00', '6.00', '126.00', 'mollie', 'online', 'USD', 'XIA01619416083', NULL, '0.00', 'Pending', 'pending', 'txn_hmfxNyzj1619416083', 'ch_mOz1pvVKE1619416083', '2021-04-26 01:48:03', '2021-04-26 01:48:03', NULL, NULL),
(199, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '120.00', '0.00', '6.00', '126.00', 'mollie', 'online', 'USD', 'QZuh1619416083', NULL, '0.00', 'Completed', 'pending', 'txn_s1DhmRGo1619416083', 'ch_6xQZWhZds1619416083', '2021-04-26 01:48:03', '2021-04-26 01:48:19', 'Oxnn1619416094.pdf', NULL),
(200, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '250.00', '0.00', '12.50', '272.50', 'paypal', 'online', 'USD', 'qcsA1636438626', 'Same Day Shipping', '10.00', 'Completed', 'pending', '712625416F6173031', 'PAYID-MGFBDJY6TT42096YG706011S', '2021-11-09 01:17:06', '2021-11-09 01:17:06', NULL, NULL),
(201, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '250.00', '0.00', '12.50', '272.50', 'paypal', 'online', 'USD', '4MFs1636438658', 'Same Day Shipping', '10.00', 'Completed', 'pending', '712625416F6173031', 'PAYID-MGFBDJY6TT42096YG706011S', '2021-11-09 01:17:38', '2021-11-09 01:17:43', 'xRyU1636438658.pdf', NULL),
(203, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '120.00', '0.00', '6.00', '136.00', 'stripe', 'online', 'USD', 'oAJW1636438941', 'Same Day Shipping', '10.00', 'Completed', 'pending', 'txn_3JtnirJlIV5dN9n71LQPzE07', 'ch_3JtnirJlIV5dN9n71QpNIN2E', '2021-11-09 01:22:21', '2021-11-09 01:22:25', 'OPjH1636438941.pdf', NULL),
(204, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '750.00', '0.00', '37.50', '797.50', 'mollie', 'online', 'USD', 'Zlnn1636439035', 'Same Day Shipping', '10.00', 'Completed', 'pending', 'txn_oRn8eQCI1636439035', 'ch_SKnFf9Jn01636439035', '2021-11-09 01:23:55', '2021-11-09 01:24:11', 'Sgz71636439046.pdf', NULL),
(205, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '300.00', '0.00', '15.00', '325.00', 'Bank America', 'offline', 'USD', 'nAEo1636439124', 'Same Day Shipping', '10.00', 'Pending', 'pending', 'txn_1fhwFoMv1636439124', 'ch_jpiIe0Mbl1636439124', '2021-11-09 01:25:24', '2021-11-09 01:25:28', 'TBUJ1636439124.pdf', NULL),
(206, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '340.00', '0.00', '17.00', '367.00', 'Paystack', 'online', 'NGN', 'UH4T1636439308', 'Same Day Shipping', '10.00', 'Completed', 'pending', 'txn_kJkMpyfS1636439308', 'ch_irnzOXoXs1636439308', '2021-11-09 01:28:28', '2021-11-09 01:28:33', '3Kl21636439308.pdf', NULL),
(209, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '310.00', '0.00', '15.50', '335.50', 'paytm', 'online', 'INR', 'ZYTk1636439912', 'Same Day Shipping', '10.00', 'Completed', 'pending', 'txn_7kFSIn6R1636439912', 'ch_Z5rt92fYe1636439912', '2021-11-09 01:38:32', '2021-11-09 01:39:01', '18kc1636439936.pdf', NULL),
(210, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '560.00', '0.00', '28.00', '598.00', 'Instamojo', 'online', 'INR', 'SDcd1636439991', 'Same Day Shipping', '10.00', 'Completed', 'pending', 'txn_eHbI1a711636439991', 'ch_ct1LcPdUD1636439991', '2021-11-09 01:39:51', '2021-11-09 01:41:06', 'Idhi1636440056.pdf', NULL),
(211, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '290.00', '0.00', '14.50', '314.50', 'Razorpay', 'online', 'INR', 'tY391636440119', 'Same Day Shipping', '10.00', 'Completed', 'pending', 'txn_plrPBcKN1636440119', 'ch_EO2HDJ5SK1636440119', '2021-11-09 01:41:59', '2021-11-09 01:42:33', 'KNG51636440148.pdf', NULL),
(213, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '240.00', '0.00', '12.00', '262.00', 'mercadopago', 'online', 'BRL', 'oM0Y1636440305', 'Same Day Shipping', '10.00', 'Pending', 'pending', 'txn_qNPaFrrx1636440305', 'ch_GpBEjWiWg1636440305', '2021-11-09 01:45:05', '2021-11-09 01:45:05', NULL, NULL),
(214, 26, 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '262332', 'Australia', 'John', 'Doe', 'Melbourne, Australia', 'Melbourne', 'geniustest11@gmail.com', '3636237', '560.00', '0.00', '28.00', '598.00', 'stripe', 'online', 'NGN', 'OWdC1636443010', 'Same Day Shipping', '10.00', 'Completed', 'pending', 'txn_3JtomUJlIV5dN9n70jU3H2fH', 'ch_3JtomUJlIV5dN9n70EY1qI8L', '2021-11-09 02:30:10', '2021-11-09 02:30:15', 'GQuW1636443010.pdf', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `review` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `review`, `comment`, `created_at`, `updated_at`) VALUES
(25, 26, 47, 5, 'Great product with great features', '2021-04-27 11:23:39', '2021-04-27 11:23:39'),
(26, 26, 46, 4, 'Needs more improvement', '2021-04-27 11:24:22', '2021-04-27 11:24:22'),
(27, 26, 16, 3, 'Slow Delivery', '2021-04-27 11:29:17', '2021-04-27 11:29:17'),
(28, 26, 14, 5, 'Awesome Product Quality', '2021-04-27 11:30:01', '2021-04-27 11:30:01'),
(29, 26, 10, 5, 'Loved this', '2021-04-27 11:30:21', '2021-04-27 11:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `profit_chart`
--

CREATE TABLE `profit_chart` (
  `id` int(11) NOT NULL,
  `label` varchar(250) DEFAULT NULL,
  `amount` varchar(250) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profit_chart`
--

INSERT INTO `profit_chart` (`id`, `label`, `amount`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '2018-19', '23.23', '2024-05-14 12:57:06', '2024-05-14 11:57:51', '2024-05-14 12:57:06'),
(2, '2019-2020', '32.22', NULL, '2024-05-14 12:13:36', '2024-05-14 13:11:31'),
(3, '2020-2021', '45.95', NULL, '2024-05-14 12:15:38', '2024-05-14 13:11:21'),
(4, '2021-2022', '54.02', NULL, '2024-05-14 12:16:20', '2024-05-14 13:11:14'),
(5, '2022-2023', '43.78', NULL, '2024-05-14 12:17:22', '2024-05-14 13:11:06'),
(6, '2023-2024', '13.61', NULL, '2024-05-14 12:17:46', '2024-05-14 13:10:53'),
(7, '2025', 'fgdfg', '2024-05-14 12:56:36', '2024-05-14 12:55:57', '2024-05-14 12:56:36'),
(8, '2025', 'rtyrt', '2024-05-14 12:58:09', '2024-05-14 12:57:01', '2024-05-14 12:58:09');

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscribable_id` int(11) DEFAULT NULL,
  `subscribable_type` varchar(255) DEFAULT NULL,
  `endpoint` varchar(500) NOT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `content_encoding` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `push_subscriptions`
--

INSERT INTO `push_subscriptions` (`id`, `subscribable_id`, `subscribable_type`, `endpoint`, `public_key`, `auth_token`, `content_encoding`, `created_at`, `updated_at`) VALUES
(8, 8, 'App\\Guest', 'https://updates.push.services.mozilla.com/wpush/v2/gAAAAABgWtflfgOQ6Zu9YS1cgmd5CpfOnjSoxolT02byjYLKCQBrtUypVyYG9YxI0_ypNnyfZpRSf3tOur7GBiN1R5NGZVkaazRPwt1rILBAeNfNw6AW_N3hWD7Uz-RLxfFc7G7PAegKlgGYoL0n1oUMuZOUI3cIZIb3hYtBa0YoP1YDgAfoAi0', 'BPnWQRwG0w9UpT9SgGIvZu14qiOh6xeJw7LH0SGB9yQ8rotD3PcoVP6baA5tkgHYeKbkBVc0zKscFanqLvSE2jI', 'xXBSBQEM1NUoevPvlcWIVw', NULL, '2021-03-24 01:10:47', '2021-03-24 01:10:47'),
(20, 20, 'App\\Guest', 'https://updates.push.services.mozilla.com/wpush/v2/gAAAAABhikRba0a-zxtAD66amGYkq9OQh5z9-rOici-p6UUbMvDNtBfQFZE4l77xT47225N0YnU4jFxY2kNFVY9V7U07thn58MlpN_EjgPehJ0Iy8hx03MxC3QVXa4IOb-R7UDSPP1R9TdVa9LczlQc0FwKr946oYP35nPbyQ9wTpMAmjL9Alxk', 'BPPhkRphOJ6Ax917o2rVvZzFBnC3H1oHJQ0AkS8hk5w1TjYREbpz08z2EVe90NgWUw193FHMgjVP6zTp8yKaqMs', '171oWQWrwo4YTzwS6KWnzQ', NULL, '2021-11-09 04:50:20', '2021-11-09 04:50:20'),
(21, 21, 'App\\Guest', 'https://fcm.googleapis.com/fcm/send/f0dlMt-oX9M:APA91bEjpmSkkxgd2vubVIT4YKI0sWFmfOSp64EWjMqd3czv96hr3TsjDpj5LEop10vFIH7NE6QktKACmLww-iVfxw361X_znJtsggv2j0KCh7HiArkUPUAuHIL0rpB-CL-6JEbw1XLx', 'BGUokSQoW3xW7FnkG3s9IS7JQdXEtS2RrXxy9jpCPrD4wEWldH61JaYYL2Of8BdySocWZfku3InyWMO7wonXv08', '-nG-0-ohe-cT-8yNPDldUg', NULL, '2021-11-09 04:52:27', '2021-11-09 04:52:27'),
(23, 23, 'App\\Guest', 'https://fcm.googleapis.com/fcm/send/eo9eVCrhlbc:APA91bGZU9zzWa1HbNyNwrcU2y1wWfeSq3D_EUdaOwFPcX06YvFPQwa9wgP0sF0ktdiZlTNVHO6t5s52jpnQ6o1wrOPAyduV235y0GX6WkafnLUERYBE4BUswI1U9dggkGbofiFhQoGd', 'BF_1rRM2-haffX4kfdJgxd4KDSFiCOiQ8ZyNH435nGpUx0A7CPnZ3gjZwISiQxxdcy3j8u2eYrShT5kDljT2h94', 'gG8M4EpK2NksXL9_cwWWYQ', NULL, '2021-11-09 04:53:24', '2021-11-09 04:53:24'),
(24, 24, 'App\\Guest', 'https://fcm.googleapis.com/fcm/send/faIO6Nu3yMU:APA91bFBe7Lg-uax_22xYjMtjrtaupEW5Dv_bDExHVVXm4JoY_rSvxsN8YTuWNjJh-1QjTtx6i77rW-61e7mPLf9MSn88UbrtRcFEZEHEPXPtU4Nr-seRLzOuSNd5J7AErxs7qQBRRUI', 'BO7CdeMQFOsna8C5YFPxcdheoRfvzvmxCnBA-ibDQDzlBCi_hMlqBrStw7p2yNNOgqhZlBIoUTXL1GifHpab6oI', 'R9cfNwcK7NroV0OaI8Z0SQ', NULL, '2021-11-22 00:50:58', '2021-11-22 00:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `queue_jobs`
--

CREATE TABLE `queue_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fields` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-pending, 1-prcessing, 2-completed, 3-rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quote_inputs`
--

CREATE TABLE `quote_inputs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(4) DEFAULT NULL COMMENT '1-text, 2-select, 3-checkbox, 4-textarea, 5-file',
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `required` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - required, 0 - optional',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quote_input_options`
--

CREATE TABLE `quote_input_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote_input_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quote_input_options`
--

INSERT INTO `quote_input_options` (`id`, `quote_input_id`, `name`, `created_at`, `updated_at`) VALUES
(86, 20, 'less than $10000', '2019-12-25 18:59:35', '2019-12-25 18:59:35'),
(87, 20, '$10000 to $25000', '2019-12-25 18:59:35', '2019-12-25 18:59:35'),
(88, 20, '$25000 to $50000', '2019-12-25 18:59:35', '2019-12-25 18:59:35'),
(89, 20, '$50000+', '2019-12-25 18:59:35', '2019-12-25 18:59:35'),
(90, 20, 'Negotiable', '2019-12-25 18:59:35', '2019-12-25 18:59:35'),
(96, 28, 'menos de US $ 10000', '2019-12-25 20:20:17', '2019-12-25 20:20:17'),
(97, 28, '$ 10000 a $ 25000', '2019-12-25 20:20:17', '2019-12-25 20:20:17'),
(98, 28, '$ 25000 a $ 50000', '2019-12-25 20:20:17', '2019-12-25 20:20:17'),
(99, 28, '$ 50000 +', '2019-12-25 20:20:17', '2019-12-25 20:20:17'),
(100, 28, 'Negociável', '2019-12-25 20:20:17', '2019-12-25 20:20:17'),
(101, 30, 'Modelo do Bootstrap 4', '2019-12-25 20:22:56', '2019-12-25 20:22:56'),
(102, 30, 'PSD para HTML', '2019-12-25 20:22:56', '2019-12-25 20:22:56'),
(103, 30, 'HTML e CSS', '2019-12-25 20:22:56', '2019-12-25 20:22:56'),
(104, 30, 'Laravel Framework', '2019-12-25 20:22:56', '2019-12-25 20:22:56'),
(105, 30, 'React Native App', '2019-12-25 20:22:56', '2019-12-25 20:22:56'),
(106, 36, '10000 dolardan az', '2019-12-25 20:31:41', '2019-12-25 20:31:41'),
(107, 36, '10000 $ ile 25000 $ arası', '2019-12-25 20:31:41', '2019-12-25 20:31:41'),
(108, 36, '25000 $ ile 50000 $ arası', '2019-12-25 20:31:41', '2019-12-25 20:31:41'),
(109, 36, '$ 50000 +', '2019-12-25 20:31:41', '2019-12-25 20:31:41'),
(110, 36, 'tartışılabilir', '2019-12-25 20:31:41', '2019-12-25 20:31:41'),
(111, 38, 'Bootstrap 4 Şablonu', '2019-12-25 22:09:54', '2019-12-25 22:09:54'),
(112, 38, 'PSD\'den HTML\'ye', '2019-12-25 22:09:54', '2019-12-25 22:09:54'),
(113, 38, 'HTML ve CSS', '2019-12-25 22:09:54', '2019-12-25 22:09:54'),
(114, 38, 'Laravel Framework', '2019-12-25 22:09:54', '2019-12-25 22:09:54'),
(115, 38, 'React Native App', '2019-12-25 22:09:54', '2019-12-25 22:09:54'),
(119, 48, 'less than $10000', '2019-12-25 22:32:19', '2019-12-25 22:32:19'),
(120, 48, '$10000 to $25000', '2019-12-25 22:32:19', '2019-12-25 22:32:19'),
(121, 48, '$25000 to $50000', '2019-12-25 22:32:19', '2019-12-25 22:32:19'),
(122, 48, '$50000+', '2019-12-25 22:32:19', '2019-12-25 22:32:19'),
(123, 48, 'Negotiable', '2019-12-25 22:32:19', '2019-12-25 22:32:19'),
(124, 50, 'Bootstrap 4 Template', '2019-12-25 22:33:21', '2019-12-25 22:33:21'),
(125, 50, 'PSD to HTML', '2019-12-25 22:33:21', '2019-12-25 22:33:21'),
(126, 50, 'HTML & CSS', '2019-12-25 22:33:21', '2019-12-25 22:33:21'),
(127, 50, 'Laravel Framework', '2019-12-25 22:33:21', '2019-12-25 22:33:21'),
(128, 50, 'React Native App', '2019-12-25 22:33:21', '2019-12-25 22:33:21'),
(139, 56, 'أقل من 10000 دولار', '2020-01-07 04:36:51', '2020-01-07 04:36:51'),
(140, 56, '10000 دولار إلى 25000 دولار', '2020-01-07 04:36:51', '2020-01-07 04:36:51'),
(141, 56, '25000 دولار إلى 50000 دولار', '2020-01-07 04:36:51', '2020-01-07 04:36:51'),
(142, 56, '$ 50000 +', '2020-01-07 04:36:51', '2020-01-07 04:36:51'),
(143, 56, 'قابل للتفاوض', '2020-01-07 04:36:51', '2020-01-07 04:36:51'),
(144, 58, 'Bootstrap 4 Template', '2020-01-07 04:37:08', '2020-01-07 04:37:08'),
(145, 58, 'مديرية الأمن العام إلى HTML', '2020-01-07 04:37:08', '2020-01-07 04:37:08'),
(146, 58, 'HTML و CSS', '2020-01-07 04:37:08', '2020-01-07 04:37:08'),
(147, 58, 'Laravel Framework', '2020-01-07 04:37:08', '2020-01-07 04:37:08'),
(148, 58, 'React Native App', '2020-01-07 04:37:08', '2020-01-07 04:37:08'),
(160, 22, 'Bootstrap 4 Template', '2021-01-23 06:28:24', '2021-01-23 06:28:24'),
(161, 22, 'PSD to HTML', '2021-01-23 06:28:24', '2021-01-23 06:28:24'),
(162, 22, 'HTML & CSS', '2021-01-23 06:28:24', '2021-01-23 06:28:24'),
(163, 22, 'React Native App', '2021-01-23 06:28:24', '2021-01-23 06:28:24'),
(164, 22, 'Laravel Framework', '2021-01-23 06:28:24', '2021-01-23 06:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin', '2024-04-19 09:15:27', '2024-04-19 09:15:27'),
(2, 'Admin', 'admin', '2024-04-19 09:15:27', '2024-04-19 09:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles_old`
--

CREATE TABLE `roles_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles_old`
--

INSERT INTO `roles_old` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Moderator', '[\"Dashboard\",\"Theme & Home\",\"Content Management\",\"Pages\",\"Event Calendar\",\"Shop Management\",\"Events Management\",\"Knowledgebase\",\"Tickets\"]', '2019-10-03 03:47:30', '2021-04-22 07:07:55'),
(3, 'Super Admin', '[\"Dashboard\",\"Basic Settings\",\"Subscribers\",\"Quote Management\",\"Home Page\",\"Footer\",\"Pages\",\"Service Page\",\"Portfolio Management\",\"Event Calendar\",\"Gallery Management\",\"FAQ Management\",\"Blogs\",\"Contact Page\",\"Role Management\",\"Users Management\",\"Language Management\",\"Backup\"]', '2019-10-04 02:52:29', '2020-03-06 05:48:34'),
(4, 'Admin', '[\"Dashboard\",\"Basic Settings\",\"Quote Management\",\"Home Page\",\"Footer\",\"Service Page\",\"Portfolio Management\",\"Gallery Management\",\"FAQ Management\",\"Blogs\",\"Contact Page\"]', '2019-10-04 02:52:53', '2019-10-04 02:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(15, 2),
(16, 1),
(17, 1),
(17, 2),
(18, 1),
(19, 1),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(23, 1),
(23, 2),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(97, 2),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(101, 2),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(110, 2),
(111, 1),
(111, 2),
(112, 1),
(112, 2),
(113, 1),
(114, 1),
(116, 1),
(116, 2),
(117, 1),
(117, 2),
(118, 1),
(119, 1),
(119, 2),
(120, 1),
(120, 2),
(121, 1),
(121, 2),
(122, 1),
(123, 1),
(123, 2),
(124, 1),
(124, 2),
(125, 1),
(125, 2),
(126, 1),
(126, 2),
(127, 1),
(127, 2),
(128, 1),
(128, 2),
(130, 1),
(130, 2),
(131, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rss_feeds`
--

CREATE TABLE `rss_feeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `feed_name` varchar(255) DEFAULT NULL,
  `feed_url` varchar(255) DEFAULT NULL,
  `post_limit` int(11) DEFAULT NULL,
  `read_more_button` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rss_posts`
--

CREATE TABLE `rss_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `rss_feed_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rss_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rss_posts`
--

INSERT INTO `rss_posts` (`id`, `language_id`, `rss_feed_id`, `title`, `slug`, `photo`, `description`, `rss_link`, `created_at`, `updated_at`) VALUES
(15, 169, 9, 'As city gigs dry up, unemployed look to farmers for a job', 'As-city-gigs-dry-up,-unemployed-look-to-farmers-for-a-job', 'https://www.abc.net.au/news/image/11765638-16x9-2150x1210.jpg', '<p>Coronavirus is expected to force hundreds of thousands of Australians out of work, and farmers are already being inundated with enquiries from the unemployed.</p>', 'https://www.abc.net.au/news/2020-03-28/covid-19-downturn-sees-farmers-inundated-by-jobseekers/12097012', '2020-03-27 16:29:52', NULL),
(16, 169, 9, '\'Ugly\' fruit and vegetables hit top shelf to meet demand during COVID-19', '\'Ugly\'-fruit-and-vegetables-hit-top-shelf-to-meet-demand-during-COVID-19', 'https://www.abc.net.au/news/image/7837650-16x9-2150x1210.jpg', '<p>Consumers can expect some different-looking fruit and vegetables in the aisles as COVID-19 demand forces supermarkets to relax specifications.</p>', 'https://www.abc.net.au/news/2020-03-25/supermarkets-change-fruit-vegetable-specifications-covid19/12085326', '2020-03-27 16:29:53', NULL),
(17, 169, 9, 'Another hit to rural tourism in Tasmania', 'Another-hit-to-rural-tourism-in-Tasmania', 'https://www.abc.net.au/news/image/12085520-16x9-2150x1210.jpg', 'The rural tourism industry in southern Tasmania has been hit with closures of regional pubs and restaurants due to coronavirus', 'https://www.abc.net.au/radio/programs/tas-country-hour/bangor-closed/12085570', '2020-03-27 16:29:53', NULL),
(18, 169, 9, 'While many are losing their jobs, these businesses need more workers', 'While-many-are-losing-their-jobs,-these-businesses-need-more-workers', 'https://www.abc.net.au/news/image/12084808-16x9-2150x1210.jpg', '<p>As tens of thousands of Australians lose their jobs because of new rules around social distancing, some businesses including food producers, are looking for new workers.</p>', 'https://www.abc.net.au/news/2020-03-24/some-businesses-looking-for-workers-amid-coronavirus-layoffs/12084182', '2020-03-27 16:29:53', NULL),
(19, 169, 9, 'Farmer doesn\'t let coronavirus squash his giant pumpkin strides', 'Farmer-doesn\'t-let-coronavirus-squash-his-giant-pumpkin-strides', 'https://www.abc.net.au/news/image/12081934-16x9-2150x1210.jpg', '<p>Sorell farmer Shane Newitt put six months of love into his giant pumpkin to compete at the Bream Creek Show, but its cancellation hasn\'t stopped him showing it off.</p>', 'https://www.abc.net.au/news/2020-03-24/tasmanian-farmer-shane-newitt-shows-off-giant-pumpkin/12081512', '2020-03-27 16:29:53', NULL),
(20, 169, 10, 'It\'s shockingly easy to get a $150 bonus with this card', 'It\'s-shockingly-easy-to-get-a-$150-bonus-with-this-card', 'https://cdn.cnn.com/cnnnext/dam/assets/200306170259-cc-pastelcashstack-super-169.jpg', '<img src=\"http://feeds.feedburner.com/~r/rss/edition_world/~4/BF-YqghZ2po\" height=\"1\" width=\"1\" alt=\"\">', 'http://rss.cnn.com/~r/rss/edition_world/~3/BF-YqghZ2po/best-cash-back-quicksilver', NULL, NULL),
(21, 169, 10, 'Iceland lab\'s testing suggests 50% of cases have no symptoms', 'Iceland-lab\'s-testing-suggests-50%-of-cases-have-no-symptoms', 'https://cdn.cnn.com/cnnnext/dam/assets/200331132121-02-iceland-coronavirus-testing-super-169.jpg', 'There\'s a lot about Iceland that other countries could envy: Its spectacular natural surroundings, its place among the world\'s happiest countries, and, now, its large-scale testing for the novel coronavirus, which could influence how the world understands the outbreak.<img src=\"http://feeds.feedburner.com/~r/rss/edition_world/~4/odv9kN_humI\" height=\"1\" width=\"1\" alt=\"\">', 'http://rss.cnn.com/~r/rss/edition_world/~3/odv9kN_humI/index.html', NULL, NULL),
(22, 169, 10, 'Can the Tour de France go ahead?', 'Can-the-Tour-de-France-go-ahead?', 'https://cdn.cnn.com/cnnnext/dam/assets/190704153713-eddy-mercxx-super-169.jpg', 'With the list of sporting postponements growing ever longer, the fate of cycling\'s Tour de France would seem almost inevitable.<img src=\"http://feeds.feedburner.com/~r/rss/edition_world/~4/ppR7f_Hvqo8\" height=\"1\" width=\"1\" alt=\"\">', 'http://rss.cnn.com/~r/rss/edition_world/~3/ppR7f_Hvqo8/index.html', NULL, NULL),
(23, 169, 10, 'Asia may have been right about coronavirus and face masks', 'Asia-may-have-been-right-about-coronavirus-and-face-masks', 'https://cdn.cnn.com/cnnnext/dam/assets/200401141239-hong-kong-face-mask-0323-01-super-169.jpg', '<img src=\"http://feeds.feedburner.com/~r/rss/edition_world/~4/ZlwuatLpZnk\" height=\"1\" width=\"1\" alt=\"\">', 'http://rss.cnn.com/~r/rss/edition_world/~3/ZlwuatLpZnk/index.html', NULL, NULL),
(24, 169, 10, 'UK races to convert convention hall into ICU', 'UK-races-to-convert-convention-hall-into-ICU', 'https://cdn.cnn.com/cnnnext/dam/assets/200401074352-nhs-nightingale-hospital-excel-center-super-169.jpg', 'The UK will open the doors this week on what could soon be the biggest intensive care unit in the country. Nick Paton Walsh reports from east London.<img src=\"http://feeds.feedburner.com/~r/rss/edition_world/~4/JDrSljdXw7s\" height=\"1\" width=\"1\" alt=\"\">', 'http://rss.cnn.com/~r/rss/edition_world/~3/JDrSljdXw7s/london-nick-paton-walsh-nhs-excel-nightingale-hospital.cnn', NULL, NULL),
(25, 169, 10, 'Cruise ships are still scrambling for safe harbor', 'Cruise-ships-are-still-scrambling-for-safe-harbor', 'https://cdn.cnn.com/cnnnext/dam/assets/200327135115-01-zaandam-0327-super-169.jpg', 'More than a dozen cruise ships remain stranded at sea right now -- some with and some without passengers -- as ports deny entry and passengers panic about returning home.<img src=\"http://feeds.feedburner.com/~r/rss/edition_world/~4/tirk0A6nwoc\" height=\"1\" width=\"1\" alt=\"\">', 'http://rss.cnn.com/~r/rss/edition_world/~3/tirk0A6nwoc/index.html', NULL, NULL),
(26, 169, 10, 'Analysis: Power-hungry leaders itching to exploit this crisis', 'Analysis:-Power-hungry-leaders-itching-to-exploit-this-crisis', 'https://cdn.cnn.com/cnnnext/dam/assets/200330112237-01-viktor-orban-0304-super-169.jpg', 'As Covid-19 brings the world to a halt, some world leaders have spotted an opportunity to tighten their grip on power.<img src=\"http://feeds.feedburner.com/~r/rss/edition_world/~4/7BOgm5Y7KI0\" height=\"1\" width=\"1\" alt=\"\">', 'http://rss.cnn.com/~r/rss/edition_world/~3/7BOgm5Y7KI0/index.html', NULL, NULL),
(27, 169, 10, 'How Huawei is returning to work', 'How-Huawei-is-returning-to-work', 'https://cdn.cnn.com/cnnnext/dam/assets/200331141553-huawei-shenzhen-file-super-169.jpg', 'At Huawei\'s first ever virtual press conference on Tuesday, CEO Eric Xu waited patiently as dozens of reporters attempted to get the moderator\'s attention on video conferencing platform Zoom.<img src=\"http://feeds.feedburner.com/~r/rss/edition_world/~4/sknDExqjy8I\" height=\"1\" width=\"1\" alt=\"\">', 'http://rss.cnn.com/~r/rss/edition_world/~3/sknDExqjy8I/index.html', NULL, NULL),
(28, 169, 10, 'How some investors have profited from the stock market\'s huge losses', 'How-some-investors-have-profited-from-the-stock-market\'s-huge-losses', 'https://cdn.cnn.com/cnnnext/dam/assets/200326111241-bill-ackman-1112-file-super-169.jpg', 'Hedge fund manager Bill Ackman appeared on CNBC earlier this month tearfully begging for the stock market to be shut down because he thought \"hell\" was coming,\"<img src=\"http://feeds.feedburner.com/~r/rss/edition_world/~4/J3F-ryolr6Y\" height=\"1\" width=\"1\" alt=\"\">', 'http://rss.cnn.com/~r/rss/edition_world/~3/J3F-ryolr6Y/index.html', NULL, NULL),
(29, 169, 10, 'Pandemic could push 11 million people in Asia into poverty', 'Pandemic-could-push-11-million-people-in-Asia-into-poverty', 'https://cdn.cnn.com/cnnnext/dam/assets/200331141303-manila-philippines-0331-super-169.jpg', 'The economic fallout from the coronavirus pandemic could drive an additional 11 million people into poverty in East Asia and the Pacific unless \"urgent action\" is taken, the World Bank warned in a report released Monday.<img src=\"http://feeds.feedburner.com/~r/rss/edition_world/~4/N_u5Z8QWPmc\" height=\"1\" width=\"1\" alt=\"\">', 'http://rss.cnn.com/~r/rss/edition_world/~3/N_u5Z8QWPmc/index.html', NULL, NULL),
(30, 169, 11, 'US medical workers hit by pay cuts at height of coronavirus', 'US-medical-workers-hit-by-pay-cuts-at-height-of-coronavirus', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/14/new-york-doctor.jpg', 'One of the largest medical staffing agencies in the US announced cuts to staff whilst they care for coronavirus patients', 'https://www.independent.co.uk/news/world/americas/us-politics/coronavirus-us-healthcare-doctor-pay-nurse-wages-a9440521.html', NULL, NULL),
(31, 169, 11, 'Tornado and hurricane seasons could be worse this year due to abnormally high sea temperature', 'Tornado-and-hurricane-seasons-could-be-worse-this-year-due-to-abnormally-high-sea-temperature', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/12/tornado.jpg', 'Southern US states have seen unusually warm weather so far this year', 'https://www.independent.co.uk/news/world/americas/tornado-hurricane-season-high-sea-temperature-gulf-mexico-a9440331.html', NULL, NULL),
(32, 169, 11, 'Coronavirus: Nuclear aircraft carrier will evacuate after desperate plea from captain', 'Coronavirus:-Nuclear-aircraft-carrier-will-evacuate-after-desperate-plea-from-captain', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/04/21/00/web-USS-Roosevelt-Get-v2.jpg', '\'We are not at war,\' wrote Captain Brett Crozier. \'Sailors do not need to die\'', 'https://www.independent.co.uk/news/world/americas/coronavirus-us-war-ship-theodore-roosevelt-navy-aircraft-carrier-guam-brett-crozier-a9439901.html', NULL, NULL),
(33, 169, 11, 'Trump blames impeachment for slow response to coronavirus', 'Trump-blames-impeachment-for-slow-response-to-coronavirus', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/13/trump-hoax-rally.jpg', 'President suggests his administration was distracted by impeachment process in January', 'https://www.independent.co.uk/news/world/americas/us-politics/trump-coronavirus-impeachment-white-house-press-briefing-a9440351.html', NULL, NULL),
(34, 169, 11, 'Coronavirus: 350 bodies sent away from Bergamo after local crematorium overwhelmed', 'Coronavirus:-350-bodies-sent-away-from-Bergamo-after-local-crematorium-overwhelmed', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/03/27/17/Italy-coronavirus-deaths.jpg', 'Florence reportedly offered help this week', 'https://www.independent.co.uk/news/world/europe/coronavirus-cremation-bergamo-bodies-sent-ferrara-venice-florence-a9440436.html', NULL, NULL),
(35, 169, 11, 'Trump news – live: President warns nation facing &amp;apos;hell of a bad two weeks&amp;apos; and predicts death toll of up to 240,000 even if lockdown measures kept up', 'Trump-news-–-live:-President-warns-nation-facing-&amp;apos;hell-of-a-bad-two-weeks&amp;apos;-and-predicts-death-toll-of-up-to-240,000-even-if-lockdown-measures-kept-up', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/03/31/22/donald-trump-anthony-fauci-coronavirus.jpg', 'Follow the latest updates', 'https://www.independent.co.uk/news/world/americas/us-politics/trump-news-live-coronavirus-update-white-house-live-press-conference-cases-a9439936.html', NULL, NULL),
(36, 169, 11, 'US coronavirus death toll passes 4,000 as cases near 200,000', 'US-coronavirus-death-toll-passes-4,000-as-cases-near-200,000', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/11/refrigeration-units-ny.jpg', 'The US death toll passed another marker on Wednesday, as coronavirus fatalities surpassed those of 9/11', 'https://www.independent.co.uk/news/world/americas/us-politics/us-coronavirus-death-toll-cases-latest-trump-news-a9440151.html', NULL, NULL),
(37, 169, 11, 'Coronavirus news – live: UK daily death toll exceeds 500 for first time, as &amp;apos;1.7 million Britons may have had disease&amp;apos; and UN warns world faces &amp;apos;worst crisis&amp;apos; since WW2', 'Coronavirus-news-–-live:-UK-daily-death-toll-exceeds-500-for-first-time,-as-&amp;apos;1.7-million-Britons-may-have-had-disease&amp;apos;-and-UN-warns-world-faces-&amp;apos;worst-crisis&amp;apos;-since-WW2', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/07/pri148122028.jpg', 'Follow the latest updates', 'https://www.independent.co.uk/news/health/coronavirus-update-live-news-cases-uk-map-latest-today-deaths-a9439711.html', NULL, NULL),
(38, 169, 11, '&amp;apos;People do not realise what is coming&amp;apos;: What a coronavirus crisis would look like in war-torn Syria, Yemen and Libya', '&amp;apos;People-do-not-realise-what-is-coming&amp;apos;:-What-a-coronavirus-crisis-would-look-like-in-war-torn-Syria,-Yemen-and-Libya', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/14/syria.jpg', 'In more than a dozen interviews, doctors and medical charities tells Bel Trew how years of conflict has left them completely unable to stop the spread of coronavirus', 'https://www.independent.co.uk/news/world/middle-east/coronavirus-syria-yemen-libya-cases-update-death-toll-doctors-a9440486.html', NULL, NULL),
(39, 169, 11, '&amp;apos;You could run from Katrina. You can&amp;apos;t run from this&amp;apos;: Hurricane&amp;apos;s legacy haunts Louisiana&amp;apos;s fight against coronavirus', '&amp;apos;You-could-run-from-Katrina.-You-can&amp;apos;t-run-from-this&amp;apos;:-Hurricane&amp;apos;s-legacy-haunts-Louisiana&amp;apos;s-fight-against-coronavirus', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/12/New-Orleans-21.jpg', 'With Mardi Gras in hindsight, New Orleans becomes a scapegoat as the city braces for more trauma under a national microscope', 'https://www.independent.co.uk/news/world/americas/coronavirus-louisiana-new-orleans-hurricane-katrina-death-toll-cases-a9439616.html', NULL, NULL),
(40, 169, 9, 'South Australian cellar doors closed amid coronavirus cluster concerns', 'South-Australian-cellar-doors-closed-amid-coronavirus-cluster-concerns', 'https://www.abc.net.au/news/image/12103596-16x9-2150x1210.jpg', '<p>With wine tasting already off the menu due to COVID-19 restrictions, many wineries have been relying on cellar-door sales to keep them afloat, but they are now being banned too.</p>', 'https://www.abc.net.au/news/2020-03-30/south-australian-wineries-to-close-amid-coronavirus-concerns/12103540', NULL, NULL),
(41, 169, 9, '\'Just going to waste\': Flowers dumped as sales plummet amid coronavirus closures', '\'Just-going-to-waste\':-Flowers-dumped-as-sales-plummet-amid-coronavirus-closures', 'https://www.abc.net.au/news/image/12101024-16x9-2150x1210.jpg', '<p>Australian flower growers destroy tens of thousands of flowers after events and florists are shut down in coronavirus measures.</p>', 'https://www.abc.net.au/news/2020-03-30/flowers-dumped-as-coronavirus-closes-events-and-florists/12100998', NULL, NULL),
(42, 169, 11, '&amp;apos;We have a life and death situation&amp;apos;: Trump lambasted for blaming slow coronavirus response on impeachment', '&amp;apos;We-have-a-life-and-death-situation&amp;apos;:-Trump-lambasted-for-blaming-slow-coronavirus-response-on-impeachment', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/03/13/14/pelosi-coronavirus.jpg', 'Pelosi: \'That\'s an admission that perhaps the president and the majority leader cannot handle the job\'', 'https://www.independent.co.uk/news/world/americas/us-politics/coronavirus-trump-impeachment-pandemic-us-pelosi-mitch-mcconnell-a9441136.html', NULL, NULL),
(43, 169, 11, 'Coronavirus: Florida issues stay-at-home order', 'Coronavirus:-Florida-issues-stay-at-home-order', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/09/26/17/breaking-4.png', 'The governor of Florida has issued a statewide stay-at-home order to remain in effect for at least 30 days beginning Thursday, after facing extensive criticism over a seemingly slow response to the novel coronavirus pandemic.', 'https://www.independent.co.uk/news/world/americas/coronavirus-florida-stay-at-home-order-lockdown-update-today-a9441116.html', NULL, NULL),
(44, 169, 11, 'Trump says Iran is planning &amp;apos;sneak attack&amp;apos; on US interests in Iraq', 'Trump-says-Iran-is-planning-&amp;apos;sneak-attack&amp;apos;-on-US-interests-in-Iraq', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/09/26/17/breaking-4.png', 'Donald Trump claimed Wednesday that Iran is planning a \"sneak attack\" against US forces in Iraq, without providing any evidence or sourcing for the assertion.', 'https://www.independent.co.uk/news/world/americas/trump-iran-us-troops-iraq-sanctions-military-latest-a9441056.html', NULL, NULL),
(45, 169, 11, 'Coronavirus: New York governor says peak will hit at end of April, as death toll nears 2,000', 'Coronavirus:-New-York-governor-says-peak-will-hit-at-end-of-April,-as-death-toll-nears-2,000', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/18/ap-20090603494496.jpg', 'Cases in state rise to 83,712 people infected', 'https://www.independent.co.uk/news/world/americas/coronavirus-new-york-cases-andrew-cuomo-press-briefing-latest-a9440976.html', NULL, NULL),
(46, 169, 11, 'Coronavirus: 28 spring breakers test positive after returning home to Texas', 'Coronavirus:-28-spring-breakers-test-positive-after-returning-home-to-Texas', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/17/florida-beach.jpg', '\'Four of the confirmed cases did not present any symptoms\'', 'https://www.independent.co.uk/news/world/americas/coronavirus-spring-break-test-positive-austin-texas-a9440911.html', NULL, NULL),
(47, 169, 11, 'Coronavirus stimulus package: Who is eligible and when will you get your checks?', 'Coronavirus-stimulus-package:-Who-is-eligible-and-when-will-you-get-your-checks', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/16/stimulus-bill.jpg', 'Payment will be one-off that is calculated by looking at your 2019 tax return', 'https://www.independent.co.uk/news/world/americas/coronavirus-stimulus-package-when-checks-who-eligible-2020-trump-bill-a9440611.html', NULL, NULL),
(48, 169, 11, 'Coronavirus: Trump administration claims it only found out alarming death toll figures at weekend despite experts issuing warning weeks ago', 'Coronavirus:-Trump-administration-claims-it-only-found-out-alarming-death-toll-figures-at-weekend-despite-experts-issuing-warning-weeks-ago', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/03/30/18/screenshot-2020-03-30-at-11.53.31-am.png', 'American life likely mostly shut down into \'early June,\' VP warns', 'https://www.independent.co.uk/news/world/americas/us-politics/coronavirus-trump-us-death-toll-pence-dr-birx-covid-stats-cases-a9440841.html', NULL, NULL),
(49, 169, 11, 'Churches remain packed as pastors are arrested and lobby for exemptions to coronavirus lockdown orders', 'Churches-remain-packed-as-pastors-are-arrested-and-lobby-for-exemptions-to-coronavirus-lockdown-orders', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/17/new-york.jpg', 'Pastors sue for \'religious liberty\' exemptions as thousands of people die across the country from Covid-19', 'https://www.independent.co.uk/news/world/americas/churches-coronavirus-lock-down-louisiana-texas-pastors-arrest-a9440956.html', NULL, NULL),
(50, 169, 11, 'Coronavirus: Man uses cherry picker to visit his mother on third floor of care home', 'Coronavirus:-Man-uses-cherry-picker-to-visit-his-mother-on-third-floor-of-care-home', 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/01/15/care-home.png', '\'Her spirits were kind of down because she\'s used to being able to get out go places and do things\'', 'https://www.independent.co.uk/news/world/americas/coronavirus-care-home-visit-cherry-picker-social-distancing-elderly-a9440466.html', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scategories`
--

CREATE TABLE `scategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `short_text` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `feature` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - will not show in home, 1 - will show in home'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scategories`
--

INSERT INTO `scategories` (`id`, `language_id`, `name`, `image`, `short_text`, `status`, `serial_number`, `feature`) VALUES
(1, 169, 'Uninterrupted Water Supply', NULL, 'We ensure a consistent and reliable water supply to our beneficiaries as per their allocated shares, meeting their needs efficiently.', 1, 1, 0),
(2, 170, 'अखंड पाणीपुरवठा', NULL, 'आम्ही आमच्या लाभार्थ्यांना त्यांच्या वाटप केलेल्या समभागांनुसार सातत्यपूर्ण आणि विश्वासार्ह पाणीपुरवठा सुनिश्चित करतो, त्यांच्या गरजा कार्यक्षमतेने पूर्ण करतो.', 1, 1, 0),
(3, 169, 'Industry and Commercial Supply', NULL, 'In addition to urban areas, we offer water supply solutions to industries and commercial establishments.', 1, 2, 0),
(4, 170, 'उद्योग आणि व्यावसायिक पुरवठा', NULL, 'शहरी भागांव्यतिरिक्त, आम्ही उद्योग आणि व्यावसायिक आस्थापनांना पाणीपुरवठा उपाय ऑफर करतो', 1, 2, 0),
(5, 169, 'Consultancy', NULL, 'We engage in contracts with urban local bodies for environmental and infrastructure services, including land-fill sites', 1, 3, 0),
(6, 170, 'कन्सल्टन्सी', NULL, 'आम्ही शहरी स्थानिक स्वराज्य संस्थांसोबत पर्यावरण आणि पायाभूत सेवांसाठी करारांमध्ये गुंतलो आहोत, ज्यामध्ये जमीन भरण्याची जागा समाविष्ट आहे', 1, 3, 0),
(7, 169, 'Environmental and Infrastructure Services', NULL, 'We engage in contracts with urban local bodies for environmental and infrastructure services, including land-fill sites', 1, 4, 0),
(8, 170, 'पर्यावरण आणि पायाभूत सुविधा सेवा', NULL, 'आम्ही शहरी स्थानिक स्वराज्य संस्थांसोबत पर्यावरण आणि पायाभूत सेवांसाठी करारांमध्ये गुंतलो आहोत, ज्यामध्ये जमीन भरण्याची जागा समाविष्ट आहे...', 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `scategory_id` int(11) DEFAULT NULL,
  `main_image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` blob DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `feature` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - will not show in home, 1 - will show in home',
  `details_page_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - enable, 0 - disable',
  `sidebar` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - enable, 0 - disable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_charges`
--

CREATE TABLE `shipping_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `days` varchar(255) DEFAULT NULL,
  `charge` decimal(11,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_charges`
--

INSERT INTO `shipping_charges` (`id`, `title`, `language_id`, `text`, `days`, `charge`, `created_at`, `updated_at`) VALUES
(6, 'Same Day Shipping', 169, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', NULL, '10.00', '2021-04-23 06:15:15', '2021-04-23 06:15:15');

-- --------------------------------------------------------

--
-- Table structure for table `sitemaps`
--

CREATE TABLE `sitemaps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitemap_url` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `title_font_size` int(11) DEFAULT NULL,
  `bold_text` varchar(255) DEFAULT NULL,
  `bold_text_font_size` int(11) DEFAULT NULL,
  `bold_text_color` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `text_font_size` int(11) DEFAULT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_text_font_size` int(11) DEFAULT NULL,
  `button_url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `side_image` varchar(50) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `another_button_text` varchar(255) DEFAULT NULL,
  `another_button_text_font_size` int(11) DEFAULT NULL,
  `another_button_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `language_id`, `title`, `title_font_size`, `bold_text`, `bold_text_font_size`, `bold_text_color`, `text`, `text_font_size`, `button_text`, `button_text_font_size`, `button_url`, `image`, `side_image`, `serial_number`, `created_at`, `updated_at`, `another_button_text`, `another_button_text_font_size`, `another_button_url`) VALUES
(1, 169, 'Empowering Lives Through Water', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '66419fe52867a.jpg', NULL, 1, '2024-05-07 10:56:26', '2024-05-13 05:06:45', NULL, NULL, NULL),
(2, 170, 'पाण्याद्वारे सशक्त जीवन', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6641a6de90514.jpg', NULL, 1, '2024-05-07 10:56:46', '2024-05-13 05:36:32', NULL, NULL, NULL),
(3, 170, 'पाण्याद्वारे सशक्त जीवन', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6641a6c916011.jpg', NULL, 2, '2024-05-07 10:56:59', '2024-05-13 05:36:10', NULL, NULL, NULL),
(4, 169, 'Empowering Lives Through Water', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '66419fd5e61f2.jpg', NULL, 2, '2024-05-07 10:57:13', '2024-05-13 05:06:30', NULL, NULL, NULL),
(5, 169, 'Empowering Lives Through Water', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '66419fbb2fa79.jpg', NULL, 3, '2024-05-07 10:58:08', '2024-05-13 05:06:03', NULL, NULL, NULL),
(6, 170, 'पाण्याद्वारे सशक्त जीवन', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6641a6ae3ed4e.jpg', NULL, 3, '2024-05-07 10:58:27', '2024-05-13 05:35:43', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `icon`, `url`, `serial_number`) VALUES
(20, 'fab fa-facebook-f', 'https://www.facebook.com/', 1),
(21, 'fab fa-twitter', 'https://www.twitter.com/', 2),
(24, 'fab fa-google-plus-g iconpicker-component', 'https://www.google.com/', 4),
(25, 'fab fa-instagram iconpicker-component', 'https://www.instagram.com/', 3);

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `current_package_id` int(11) DEFAULT NULL,
  `next_package_id` int(11) DEFAULT NULL,
  `fields` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 3 COMMENT '0 - expired, 1 - active, 2 - cancelled, 3 - payment incomplete',
  `expire_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `receipt` varchar(255) DEFAULT NULL,
  `current_payment_method` varchar(255) DEFAULT NULL,
  `next_payment_method` varchar(255) DEFAULT NULL,
  `pending_package_id` int(11) DEFAULT NULL,
  `pending_payment_method` varchar(255) DEFAULT NULL,
  `gateway_type` varchar(50) NOT NULL DEFAULT 'online',
  `invoice` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenders`
--

CREATE TABLE `tenders` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_mr` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `description_mr` longtext DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  `tender_link` text DEFAULT NULL,
  `files` text DEFAULT NULL,
  `tender_category` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenders`
--

INSERT INTO `tenders` (`id`, `title`, `title_mr`, `description`, `description_mr`, `deadline`, `tender_link`, `files`, `tender_category`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Summer Internship for MTech (Urban System/Civil/Electrical/Mechanical) Students.', 'एमटेक (अर्बन सिस्टम/सिव्हिल/इलेक्ट्रिकल/मेकॅनिकल) विद्यार्थ्यांसाठी समर इंटर्नशिप.', 'Lorem ipsum dolor sit amet. Sit harum ratione sed rerum voluptates 33 deserunt excepturi quo minima vero id earum porro aut accusamus voluptate vel ratione incidunt. Eos inventore corrupti qui aliquam iste non alias neque vel consectetur provident est internos velit qui voluptas debitis sit veritatis ipsum! Ea itaque veritatis id assumenda quia et quis galisum qui unde modi ut nostrum possimus et sint omnis. Ut deleniti alias aut ipsam fugit non omnis reprehenderit aut earum dolores non nisi atque quo impedit sint est voluptas perspiciatis.', 'Lorem ipsum dolor sit amet. Sit harum ratione sed rerum voluptates 33 deserunt excepturi quo minima vero id earum porro or accusamus voluptate or ratione incidunt. Eos inventore corrupti qui aliquam iste non alias neque vel consectetur provident est internos velit qui voluptas debitis sit veritatis ipsum! Ea itaque veritatis id assumenda quia et quis galisum qui unde modi ut nostrum possimus et sint sint sint. Ut deleniti aka aut ipsam fugit non omnis reprehenderit ut earum dolores non nisi atque quo impedit sint est voluptas perspiciatis.', NULL, 'http://localhost:8001/tenders', '317-1715590835.pdf', 1, 1, NULL, '2024-05-13 09:00:35', '2024-05-16 04:50:03');

-- --------------------------------------------------------

--
-- Table structure for table `tender_category`
--

CREATE TABLE `tender_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_mr` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tender_category`
--

INSERT INTO `tender_category` (`id`, `name`, `name_mr`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'General', 'सामान्य', 1, NULL, '2024-05-13 08:57:59', '2024-05-13 08:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 1,
  `ticket_number` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `zip_file` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_message` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `timezone` varchar(125) NOT NULL,
  `gmt_offset` decimal(10,2) NOT NULL,
  `dst_offset` decimal(10,2) NOT NULL,
  `raw_offset` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `country_code`, `timezone`, `gmt_offset`, `dst_offset`, `raw_offset`) VALUES
(1, 'AD', 'Europe/Andorra', '1.00', '2.00', '1.00'),
(2, 'AE', 'Asia/Dubai', '4.00', '4.00', '4.00'),
(3, 'AF', 'Asia/Kabul', '4.50', '4.50', '4.50'),
(4, 'AG', 'America/Antigua', '-4.00', '-4.00', '-4.00'),
(5, 'AI', 'America/Anguilla', '-4.00', '-4.00', '-4.00'),
(6, 'AL', 'Europe/Tirane', '1.00', '2.00', '1.00'),
(7, 'AM', 'Asia/Yerevan', '4.00', '4.00', '4.00'),
(8, 'AO', 'Africa/Luanda', '1.00', '1.00', '1.00'),
(9, 'AQ', 'Antarctica/Casey', '8.00', '8.00', '8.00'),
(10, 'AQ', 'Antarctica/Davis', '7.00', '7.00', '7.00'),
(11, 'AQ', 'Antarctica/DumontDUrville', '10.00', '10.00', '10.00'),
(12, 'AQ', 'Antarctica/Mawson', '5.00', '5.00', '5.00'),
(13, 'AQ', 'Antarctica/McMurdo', '13.00', '12.00', '12.00'),
(14, 'AQ', 'Antarctica/Palmer', '-3.00', '-4.00', '-4.00'),
(15, 'AQ', 'Antarctica/Rothera', '-3.00', '-3.00', '-3.00'),
(16, 'AQ', 'Antarctica/South_Pole', '13.00', '12.00', '12.00'),
(17, 'AQ', 'Antarctica/Syowa', '3.00', '3.00', '3.00'),
(18, 'AQ', 'Antarctica/Vostok', '6.00', '6.00', '6.00'),
(19, 'AR', 'America/Argentina/Buenos_Aires', '-3.00', '-3.00', '-3.00'),
(20, 'AR', 'America/Argentina/Catamarca', '-3.00', '-3.00', '-3.00'),
(21, 'AR', 'America/Argentina/Cordoba', '-3.00', '-3.00', '-3.00'),
(22, 'AR', 'America/Argentina/Jujuy', '-3.00', '-3.00', '-3.00'),
(23, 'AR', 'America/Argentina/La_Rioja', '-3.00', '-3.00', '-3.00'),
(24, 'AR', 'America/Argentina/Mendoza', '-3.00', '-3.00', '-3.00'),
(25, 'AR', 'America/Argentina/Rio_Gallegos', '-3.00', '-3.00', '-3.00'),
(26, 'AR', 'America/Argentina/Salta', '-3.00', '-3.00', '-3.00'),
(27, 'AR', 'America/Argentina/San_Juan', '-3.00', '-3.00', '-3.00'),
(28, 'AR', 'America/Argentina/San_Luis', '-3.00', '-3.00', '-3.00'),
(29, 'AR', 'America/Argentina/Tucuman', '-3.00', '-3.00', '-3.00'),
(30, 'AR', 'America/Argentina/Ushuaia', '-3.00', '-3.00', '-3.00'),
(31, 'AS', 'Pacific/Pago_Pago', '-11.00', '-11.00', '-11.00'),
(32, 'AT', 'Europe/Vienna', '1.00', '2.00', '1.00'),
(33, 'AU', 'Antarctica/Macquarie', '11.00', '11.00', '11.00'),
(34, 'AU', 'Australia/Adelaide', '10.50', '9.50', '9.50'),
(35, 'AU', 'Australia/Brisbane', '10.00', '10.00', '10.00'),
(36, 'AU', 'Australia/Broken_Hill', '10.50', '9.50', '9.50'),
(37, 'AU', 'Australia/Currie', '11.00', '10.00', '10.00'),
(38, 'AU', 'Australia/Darwin', '9.50', '9.50', '9.50'),
(39, 'AU', 'Australia/Eucla', '8.75', '8.75', '8.75'),
(40, 'AU', 'Australia/Hobart', '11.00', '10.00', '10.00'),
(41, 'AU', 'Australia/Lindeman', '10.00', '10.00', '10.00'),
(42, 'AU', 'Australia/Lord_Howe', '11.00', '10.50', '10.50'),
(43, 'AU', 'Australia/Melbourne', '11.00', '10.00', '10.00'),
(44, 'AU', 'Australia/Perth', '8.00', '8.00', '8.00'),
(45, 'AU', 'Australia/Sydney', '11.00', '10.00', '10.00'),
(46, 'AW', 'America/Aruba', '-4.00', '-4.00', '-4.00'),
(47, 'AX', 'Europe/Mariehamn', '2.00', '3.00', '2.00'),
(48, 'AZ', 'Asia/Baku', '4.00', '5.00', '4.00'),
(49, 'BA', 'Europe/Sarajevo', '1.00', '2.00', '1.00'),
(50, 'BB', 'America/Barbados', '-4.00', '-4.00', '-4.00'),
(51, 'BD', 'Asia/Dhaka', '6.00', '6.00', '6.00'),
(52, 'BE', 'Europe/Brussels', '1.00', '2.00', '1.00'),
(53, 'BF', 'Africa/Ouagadougou', '0.00', '0.00', '0.00'),
(54, 'BG', 'Europe/Sofia', '2.00', '3.00', '2.00'),
(55, 'BH', 'Asia/Bahrain', '3.00', '3.00', '3.00'),
(56, 'BI', 'Africa/Bujumbura', '2.00', '2.00', '2.00'),
(57, 'BJ', 'Africa/Porto-Novo', '1.00', '1.00', '1.00'),
(58, 'BL', 'America/St_Barthelemy', '-4.00', '-4.00', '-4.00'),
(59, 'BM', 'Atlantic/Bermuda', '-4.00', '-3.00', '-4.00'),
(60, 'BN', 'Asia/Brunei', '8.00', '8.00', '8.00'),
(61, 'BO', 'America/La_Paz', '-4.00', '-4.00', '-4.00'),
(62, 'BQ', 'America/Kralendijk', '-4.00', '-4.00', '-4.00'),
(63, 'BR', 'America/Araguaina', '-3.00', '-3.00', '-3.00'),
(64, 'BR', 'America/Bahia', '-3.00', '-3.00', '-3.00'),
(65, 'BR', 'America/Belem', '-3.00', '-3.00', '-3.00'),
(66, 'BR', 'America/Boa_Vista', '-4.00', '-4.00', '-4.00'),
(67, 'BR', 'America/Campo_Grande', '-3.00', '-4.00', '-4.00'),
(68, 'BR', 'America/Cuiaba', '-3.00', '-4.00', '-4.00'),
(69, 'BR', 'America/Eirunepe', '-5.00', '-5.00', '-5.00'),
(70, 'BR', 'America/Fortaleza', '-3.00', '-3.00', '-3.00'),
(71, 'BR', 'America/Maceio', '-3.00', '-3.00', '-3.00'),
(72, 'BR', 'America/Manaus', '-4.00', '-4.00', '-4.00'),
(73, 'BR', 'America/Noronha', '-2.00', '-2.00', '-2.00'),
(74, 'BR', 'America/Porto_Velho', '-4.00', '-4.00', '-4.00'),
(75, 'BR', 'America/Recife', '-3.00', '-3.00', '-3.00'),
(76, 'BR', 'America/Rio_Branco', '-5.00', '-5.00', '-5.00'),
(77, 'BR', 'America/Santarem', '-3.00', '-3.00', '-3.00'),
(78, 'BR', 'America/Sao_Paulo', '-2.00', '-3.00', '-3.00'),
(79, 'BS', 'America/Nassau', '-5.00', '-4.00', '-5.00'),
(80, 'BT', 'Asia/Thimphu', '6.00', '6.00', '6.00'),
(81, 'BW', 'Africa/Gaborone', '2.00', '2.00', '2.00'),
(82, 'BY', 'Europe/Minsk', '3.00', '3.00', '3.00'),
(83, 'BZ', 'America/Belize', '-6.00', '-6.00', '-6.00'),
(84, 'CA', 'America/Atikokan', '-5.00', '-5.00', '-5.00'),
(85, 'CA', 'America/Blanc-Sablon', '-4.00', '-4.00', '-4.00'),
(86, 'CA', 'America/Cambridge_Bay', '-7.00', '-6.00', '-7.00'),
(87, 'CA', 'America/Creston', '-7.00', '-7.00', '-7.00'),
(88, 'CA', 'America/Dawson', '-8.00', '-7.00', '-8.00'),
(89, 'CA', 'America/Dawson_Creek', '-7.00', '-7.00', '-7.00'),
(90, 'CA', 'America/Edmonton', '-7.00', '-6.00', '-7.00'),
(91, 'CA', 'America/Glace_Bay', '-4.00', '-3.00', '-4.00'),
(92, 'CA', 'America/Goose_Bay', '-4.00', '-3.00', '-4.00'),
(93, 'CA', 'America/Halifax', '-4.00', '-3.00', '-4.00'),
(94, 'CA', 'America/Inuvik', '-7.00', '-6.00', '-7.00'),
(95, 'CA', 'America/Iqaluit', '-5.00', '-4.00', '-5.00'),
(96, 'CA', 'America/Moncton', '-4.00', '-3.00', '-4.00'),
(97, 'CA', 'America/Montreal', '-5.00', '-4.00', '-5.00'),
(98, 'CA', 'America/Nipigon', '-5.00', '-4.00', '-5.00'),
(99, 'CA', 'America/Pangnirtung', '-5.00', '-4.00', '-5.00'),
(100, 'CA', 'America/Rainy_River', '-6.00', '-5.00', '-6.00'),
(101, 'CA', 'America/Rankin_Inlet', '-6.00', '-5.00', '-6.00'),
(102, 'CA', 'America/Regina', '-6.00', '-6.00', '-6.00'),
(103, 'CA', 'America/Resolute', '-6.00', '-5.00', '-6.00'),
(104, 'CA', 'America/St_Johns', '-3.50', '-2.50', '-3.50'),
(105, 'CA', 'America/Swift_Current', '-6.00', '-6.00', '-6.00'),
(106, 'CA', 'America/Thunder_Bay', '-5.00', '-4.00', '-5.00'),
(107, 'CA', 'America/Toronto', '-5.00', '-4.00', '-5.00'),
(108, 'CA', 'America/Vancouver', '-8.00', '-7.00', '-8.00'),
(109, 'CA', 'America/Whitehorse', '-8.00', '-7.00', '-8.00'),
(110, 'CA', 'America/Winnipeg', '-6.00', '-5.00', '-6.00'),
(111, 'CA', 'America/Yellowknife', '-7.00', '-6.00', '-7.00'),
(112, 'CC', 'Indian/Cocos', '6.50', '6.50', '6.50'),
(113, 'CD', 'Africa/Kinshasa', '1.00', '1.00', '1.00'),
(114, 'CD', 'Africa/Lubumbashi', '2.00', '2.00', '2.00'),
(115, 'CF', 'Africa/Bangui', '1.00', '1.00', '1.00'),
(116, 'CG', 'Africa/Brazzaville', '1.00', '1.00', '1.00'),
(117, 'CH', 'Europe/Zurich', '1.00', '2.00', '1.00'),
(118, 'CI', 'Africa/Abidjan', '0.00', '0.00', '0.00'),
(119, 'CK', 'Pacific/Rarotonga', '-10.00', '-10.00', '-10.00'),
(120, 'CL', 'America/Santiago', '-3.00', '-4.00', '-4.00'),
(121, 'CL', 'Pacific/Easter', '-5.00', '-6.00', '-6.00'),
(122, 'CM', 'Africa/Douala', '1.00', '1.00', '1.00'),
(123, 'CN', 'Asia/Chongqing', '8.00', '8.00', '8.00'),
(124, 'CN', 'Asia/Harbin', '8.00', '8.00', '8.00'),
(125, 'CN', 'Asia/Kashgar', '8.00', '8.00', '8.00'),
(126, 'CN', 'Asia/Shanghai', '8.00', '8.00', '8.00'),
(127, 'CN', 'Asia/Urumqi', '8.00', '8.00', '8.00'),
(128, 'CO', 'America/Bogota', '-5.00', '-5.00', '-5.00'),
(129, 'CR', 'America/Costa_Rica', '-6.00', '-6.00', '-6.00'),
(130, 'CU', 'America/Havana', '-5.00', '-4.00', '-5.00'),
(131, 'CV', 'Atlantic/Cape_Verde', '-1.00', '-1.00', '-1.00'),
(132, 'CW', 'America/Curacao', '-4.00', '-4.00', '-4.00'),
(133, 'CX', 'Indian/Christmas', '7.00', '7.00', '7.00'),
(134, 'CY', 'Asia/Nicosia', '2.00', '3.00', '2.00'),
(135, 'CZ', 'Europe/Prague', '1.00', '2.00', '1.00'),
(136, 'DE', 'Europe/Berlin', '1.00', '2.00', '1.00'),
(137, 'DE', 'Europe/Busingen', '1.00', '2.00', '1.00'),
(138, 'DJ', 'Africa/Djibouti', '3.00', '3.00', '3.00'),
(139, 'DK', 'Europe/Copenhagen', '1.00', '2.00', '1.00'),
(140, 'DM', 'America/Dominica', '-4.00', '-4.00', '-4.00'),
(141, 'DO', 'America/Santo_Domingo', '-4.00', '-4.00', '-4.00'),
(142, 'DZ', 'Africa/Algiers', '1.00', '1.00', '1.00'),
(143, 'EC', 'America/Guayaquil', '-5.00', '-5.00', '-5.00'),
(144, 'EC', 'Pacific/Galapagos', '-6.00', '-6.00', '-6.00'),
(145, 'EE', 'Europe/Tallinn', '2.00', '3.00', '2.00'),
(146, 'EG', 'Africa/Cairo', '2.00', '2.00', '2.00'),
(147, 'EH', 'Africa/El_Aaiun', '0.00', '0.00', '0.00'),
(148, 'ER', 'Africa/Asmara', '3.00', '3.00', '3.00'),
(149, 'ES', 'Africa/Ceuta', '1.00', '2.00', '1.00'),
(150, 'ES', 'Atlantic/Canary', '0.00', '1.00', '0.00'),
(151, 'ES', 'Europe/Madrid', '1.00', '2.00', '1.00'),
(152, 'ET', 'Africa/Addis_Ababa', '3.00', '3.00', '3.00'),
(153, 'FI', 'Europe/Helsinki', '2.00', '3.00', '2.00'),
(154, 'FJ', 'Pacific/Fiji', '13.00', '12.00', '12.00'),
(155, 'FK', 'Atlantic/Stanley', '-3.00', '-3.00', '-3.00'),
(156, 'FM', 'Pacific/Chuuk', '10.00', '10.00', '10.00'),
(157, 'FM', 'Pacific/Kosrae', '11.00', '11.00', '11.00'),
(158, 'FM', 'Pacific/Pohnpei', '11.00', '11.00', '11.00'),
(159, 'FO', 'Atlantic/Faroe', '0.00', '1.00', '0.00'),
(160, 'FR', 'Europe/Paris', '1.00', '2.00', '1.00'),
(161, 'GA', 'Africa/Libreville', '1.00', '1.00', '1.00'),
(162, 'GB', 'Europe/London', '0.00', '1.00', '0.00'),
(163, 'GD', 'America/Grenada', '-4.00', '-4.00', '-4.00'),
(164, 'GE', 'Asia/Tbilisi', '4.00', '4.00', '4.00'),
(165, 'GF', 'America/Cayenne', '-3.00', '-3.00', '-3.00'),
(166, 'GG', 'Europe/Guernsey', '0.00', '1.00', '0.00'),
(167, 'GH', 'Africa/Accra', '0.00', '0.00', '0.00'),
(168, 'GI', 'Europe/Gibraltar', '1.00', '2.00', '1.00'),
(169, 'GL', 'America/Danmarkshavn', '0.00', '0.00', '0.00'),
(170, 'GL', 'America/Godthab', '-3.00', '-2.00', '-3.00'),
(171, 'GL', 'America/Scoresbysund', '-1.00', '0.00', '-1.00'),
(172, 'GL', 'America/Thule', '-4.00', '-3.00', '-4.00'),
(173, 'GM', 'Africa/Banjul', '0.00', '0.00', '0.00'),
(174, 'GN', 'Africa/Conakry', '0.00', '0.00', '0.00'),
(175, 'GP', 'America/Guadeloupe', '-4.00', '-4.00', '-4.00'),
(176, 'GQ', 'Africa/Malabo', '1.00', '1.00', '1.00'),
(177, 'GR', 'Europe/Athens', '2.00', '3.00', '2.00'),
(178, 'GS', 'Atlantic/South_Georgia', '-2.00', '-2.00', '-2.00'),
(179, 'GT', 'America/Guatemala', '-6.00', '-6.00', '-6.00'),
(180, 'GU', 'Pacific/Guam', '10.00', '10.00', '10.00'),
(181, 'GW', 'Africa/Bissau', '0.00', '0.00', '0.00'),
(182, 'GY', 'America/Guyana', '-4.00', '-4.00', '-4.00'),
(183, 'HK', 'Asia/Hong_Kong', '8.00', '8.00', '8.00'),
(184, 'HN', 'America/Tegucigalpa', '-6.00', '-6.00', '-6.00'),
(185, 'HR', 'Europe/Zagreb', '1.00', '2.00', '1.00'),
(186, 'HT', 'America/Port-au-Prince', '-5.00', '-4.00', '-5.00'),
(187, 'HU', 'Europe/Budapest', '1.00', '2.00', '1.00'),
(188, 'ID', 'Asia/Jakarta', '7.00', '7.00', '7.00'),
(189, 'ID', 'Asia/Jayapura', '9.00', '9.00', '9.00'),
(190, 'ID', 'Asia/Makassar', '8.00', '8.00', '8.00'),
(191, 'ID', 'Asia/Pontianak', '7.00', '7.00', '7.00'),
(192, 'IE', 'Europe/Dublin', '0.00', '1.00', '0.00'),
(193, 'IL', 'Asia/Jerusalem', '2.00', '3.00', '2.00'),
(194, 'IM', 'Europe/Isle_of_Man', '0.00', '1.00', '0.00'),
(195, 'IN', 'Asia/Kolkata', '5.50', '5.50', '5.50'),
(196, 'IO', 'Indian/Chagos', '6.00', '6.00', '6.00'),
(197, 'IQ', 'Asia/Baghdad', '3.00', '3.00', '3.00'),
(198, 'IR', 'Asia/Tehran', '3.50', '4.50', '3.50'),
(199, 'IS', 'Atlantic/Reykjavik', '0.00', '0.00', '0.00'),
(200, 'IT', 'Europe/Rome', '1.00', '2.00', '1.00'),
(201, 'JE', 'Europe/Jersey', '0.00', '1.00', '0.00'),
(202, 'JM', 'America/Jamaica', '-5.00', '-5.00', '-5.00'),
(203, 'JO', 'Asia/Amman', '2.00', '3.00', '2.00'),
(204, 'JP', 'Asia/Tokyo', '9.00', '9.00', '9.00'),
(205, 'KE', 'Africa/Nairobi', '3.00', '3.00', '3.00'),
(206, 'KG', 'Asia/Bishkek', '6.00', '6.00', '6.00'),
(207, 'KH', 'Asia/Phnom_Penh', '7.00', '7.00', '7.00'),
(208, 'KI', 'Pacific/Enderbury', '13.00', '13.00', '13.00'),
(209, 'KI', 'Pacific/Kiritimati', '14.00', '14.00', '14.00'),
(210, 'KI', 'Pacific/Tarawa', '12.00', '12.00', '12.00'),
(211, 'KM', 'Indian/Comoro', '3.00', '3.00', '3.00'),
(212, 'KN', 'America/St_Kitts', '-4.00', '-4.00', '-4.00'),
(213, 'KP', 'Asia/Pyongyang', '9.00', '9.00', '9.00'),
(214, 'KR', 'Asia/Seoul', '9.00', '9.00', '9.00'),
(215, 'KW', 'Asia/Kuwait', '3.00', '3.00', '3.00'),
(216, 'KY', 'America/Cayman', '-5.00', '-5.00', '-5.00'),
(217, 'KZ', 'Asia/Almaty', '6.00', '6.00', '6.00'),
(218, 'KZ', 'Asia/Aqtau', '5.00', '5.00', '5.00'),
(219, 'KZ', 'Asia/Aqtobe', '5.00', '5.00', '5.00'),
(220, 'KZ', 'Asia/Oral', '5.00', '5.00', '5.00'),
(221, 'KZ', 'Asia/Qyzylorda', '6.00', '6.00', '6.00'),
(222, 'LA', 'Asia/Vientiane', '7.00', '7.00', '7.00'),
(223, 'LB', 'Asia/Beirut', '2.00', '3.00', '2.00'),
(224, 'LC', 'America/St_Lucia', '-4.00', '-4.00', '-4.00'),
(225, 'LI', 'Europe/Vaduz', '1.00', '2.00', '1.00'),
(226, 'LK', 'Asia/Colombo', '5.50', '5.50', '5.50'),
(227, 'LR', 'Africa/Monrovia', '0.00', '0.00', '0.00'),
(228, 'LS', 'Africa/Maseru', '2.00', '2.00', '2.00'),
(229, 'LT', 'Europe/Vilnius', '2.00', '3.00', '2.00'),
(230, 'LU', 'Europe/Luxembourg', '1.00', '2.00', '1.00'),
(231, 'LV', 'Europe/Riga', '2.00', '3.00', '2.00'),
(232, 'LY', 'Africa/Tripoli', '2.00', '2.00', '2.00'),
(233, 'MA', 'Africa/Casablanca', '0.00', '0.00', '0.00'),
(234, 'MC', 'Europe/Monaco', '1.00', '2.00', '1.00'),
(235, 'MD', 'Europe/Chisinau', '2.00', '3.00', '2.00'),
(236, 'ME', 'Europe/Podgorica', '1.00', '2.00', '1.00'),
(237, 'MF', 'America/Marigot', '-4.00', '-4.00', '-4.00'),
(238, 'MG', 'Indian/Antananarivo', '3.00', '3.00', '3.00'),
(239, 'MH', 'Pacific/Kwajalein', '12.00', '12.00', '12.00'),
(240, 'MH', 'Pacific/Majuro', '12.00', '12.00', '12.00'),
(241, 'MK', 'Europe/Skopje', '1.00', '2.00', '1.00'),
(242, 'ML', 'Africa/Bamako', '0.00', '0.00', '0.00'),
(243, 'MM', 'Asia/Rangoon', '6.50', '6.50', '6.50'),
(244, 'MN', 'Asia/Choibalsan', '8.00', '8.00', '8.00'),
(245, 'MN', 'Asia/Hovd', '7.00', '7.00', '7.00'),
(246, 'MN', 'Asia/Ulaanbaatar', '8.00', '8.00', '8.00'),
(247, 'MO', 'Asia/Macau', '8.00', '8.00', '8.00'),
(248, 'MP', 'Pacific/Saipan', '10.00', '10.00', '10.00'),
(249, 'MQ', 'America/Martinique', '-4.00', '-4.00', '-4.00'),
(250, 'MR', 'Africa/Nouakchott', '0.00', '0.00', '0.00'),
(251, 'MS', 'America/Montserrat', '-4.00', '-4.00', '-4.00'),
(252, 'MT', 'Europe/Malta', '1.00', '2.00', '1.00'),
(253, 'MU', 'Indian/Mauritius', '4.00', '4.00', '4.00'),
(254, 'MV', 'Indian/Maldives', '5.00', '5.00', '5.00'),
(255, 'MW', 'Africa/Blantyre', '2.00', '2.00', '2.00'),
(256, 'MX', 'America/Bahia_Banderas', '-6.00', '-5.00', '-6.00'),
(257, 'MX', 'America/Cancun', '-6.00', '-5.00', '-6.00'),
(258, 'MX', 'America/Chihuahua', '-7.00', '-6.00', '-7.00'),
(259, 'MX', 'America/Hermosillo', '-7.00', '-7.00', '-7.00'),
(260, 'MX', 'America/Matamoros', '-6.00', '-5.00', '-6.00'),
(261, 'MX', 'America/Mazatlan', '-7.00', '-6.00', '-7.00'),
(262, 'MX', 'America/Merida', '-6.00', '-5.00', '-6.00'),
(263, 'MX', 'America/Mexico_City', '-6.00', '-5.00', '-6.00'),
(264, 'MX', 'America/Monterrey', '-6.00', '-5.00', '-6.00'),
(265, 'MX', 'America/Ojinaga', '-7.00', '-6.00', '-7.00'),
(266, 'MX', 'America/Santa_Isabel', '-8.00', '-7.00', '-8.00'),
(267, 'MX', 'America/Tijuana', '-8.00', '-7.00', '-8.00'),
(268, 'MY', 'Asia/Kuala_Lumpur', '8.00', '8.00', '8.00'),
(269, 'MY', 'Asia/Kuching', '8.00', '8.00', '8.00'),
(270, 'MZ', 'Africa/Maputo', '2.00', '2.00', '2.00'),
(271, 'NA', 'Africa/Windhoek', '2.00', '1.00', '1.00'),
(272, 'NC', 'Pacific/Noumea', '11.00', '11.00', '11.00'),
(273, 'NE', 'Africa/Niamey', '1.00', '1.00', '1.00'),
(274, 'NF', 'Pacific/Norfolk', '11.50', '11.50', '11.50'),
(275, 'NG', 'Africa/Lagos', '1.00', '1.00', '1.00'),
(276, 'NI', 'America/Managua', '-6.00', '-6.00', '-6.00'),
(277, 'NL', 'Europe/Amsterdam', '1.00', '2.00', '1.00'),
(278, 'NO', 'Europe/Oslo', '1.00', '2.00', '1.00'),
(279, 'NP', 'Asia/Kathmandu', '5.75', '5.75', '5.75'),
(280, 'NR', 'Pacific/Nauru', '12.00', '12.00', '12.00'),
(281, 'NU', 'Pacific/Niue', '-11.00', '-11.00', '-11.00'),
(282, 'NZ', 'Pacific/Auckland', '13.00', '12.00', '12.00'),
(283, 'NZ', 'Pacific/Chatham', '13.75', '12.75', '12.75'),
(284, 'OM', 'Asia/Muscat', '4.00', '4.00', '4.00'),
(285, 'PA', 'America/Panama', '-5.00', '-5.00', '-5.00'),
(286, 'PE', 'America/Lima', '-5.00', '-5.00', '-5.00'),
(287, 'PF', 'Pacific/Gambier', '-9.00', '-9.00', '-9.00'),
(288, 'PF', 'Pacific/Marquesas', '-9.50', '-9.50', '-9.50'),
(289, 'PF', 'Pacific/Tahiti', '-10.00', '-10.00', '-10.00'),
(290, 'PG', 'Pacific/Port_Moresby', '10.00', '10.00', '10.00'),
(291, 'PH', 'Asia/Manila', '8.00', '8.00', '8.00'),
(292, 'PK', 'Asia/Karachi', '5.00', '5.00', '5.00'),
(293, 'PL', 'Europe/Warsaw', '1.00', '2.00', '1.00'),
(294, 'PM', 'America/Miquelon', '-3.00', '-2.00', '-3.00'),
(295, 'PN', 'Pacific/Pitcairn', '-8.00', '-8.00', '-8.00'),
(296, 'PR', 'America/Puerto_Rico', '-4.00', '-4.00', '-4.00'),
(297, 'PS', 'Asia/Gaza', '2.00', '3.00', '2.00'),
(298, 'PS', 'Asia/Hebron', '2.00', '3.00', '2.00'),
(299, 'PT', 'Atlantic/Azores', '-1.00', '0.00', '-1.00'),
(300, 'PT', 'Atlantic/Madeira', '0.00', '1.00', '0.00'),
(301, 'PT', 'Europe/Lisbon', '0.00', '1.00', '0.00'),
(302, 'PW', 'Pacific/Palau', '9.00', '9.00', '9.00'),
(303, 'PY', 'America/Asuncion', '-3.00', '-4.00', '-4.00'),
(304, 'QA', 'Asia/Qatar', '3.00', '3.00', '3.00'),
(305, 'RE', 'Indian/Reunion', '4.00', '4.00', '4.00'),
(306, 'RO', 'Europe/Bucharest', '2.00', '3.00', '2.00'),
(307, 'RS', 'Europe/Belgrade', '1.00', '2.00', '1.00'),
(308, 'RU', 'Asia/Anadyr', '12.00', '12.00', '12.00'),
(309, 'RU', 'Asia/Irkutsk', '9.00', '9.00', '9.00'),
(310, 'RU', 'Asia/Kamchatka', '12.00', '12.00', '12.00'),
(311, 'RU', 'Asia/Khandyga', '10.00', '10.00', '10.00'),
(312, 'RU', 'Asia/Krasnoyarsk', '8.00', '8.00', '8.00'),
(313, 'RU', 'Asia/Magadan', '12.00', '12.00', '12.00'),
(314, 'RU', 'Asia/Novokuznetsk', '7.00', '7.00', '7.00'),
(315, 'RU', 'Asia/Novosibirsk', '7.00', '7.00', '7.00'),
(316, 'RU', 'Asia/Omsk', '7.00', '7.00', '7.00'),
(317, 'RU', 'Asia/Sakhalin', '11.00', '11.00', '11.00'),
(318, 'RU', 'Asia/Ust-Nera', '11.00', '11.00', '11.00'),
(319, 'RU', 'Asia/Vladivostok', '11.00', '11.00', '11.00'),
(320, 'RU', 'Asia/Yakutsk', '10.00', '10.00', '10.00'),
(321, 'RU', 'Asia/Yekaterinburg', '6.00', '6.00', '6.00'),
(322, 'RU', 'Europe/Kaliningrad', '3.00', '3.00', '3.00'),
(323, 'RU', 'Europe/Moscow', '4.00', '4.00', '4.00'),
(324, 'RU', 'Europe/Samara', '4.00', '4.00', '4.00'),
(325, 'RU', 'Europe/Volgograd', '4.00', '4.00', '4.00'),
(326, 'RW', 'Africa/Kigali', '2.00', '2.00', '2.00'),
(327, 'SA', 'Asia/Riyadh', '3.00', '3.00', '3.00'),
(328, 'SB', 'Pacific/Guadalcanal', '11.00', '11.00', '11.00'),
(329, 'SC', 'Indian/Mahe', '4.00', '4.00', '4.00'),
(330, 'SD', 'Africa/Khartoum', '3.00', '3.00', '3.00'),
(331, 'SE', 'Europe/Stockholm', '1.00', '2.00', '1.00'),
(332, 'SG', 'Asia/Singapore', '8.00', '8.00', '8.00'),
(333, 'SH', 'Atlantic/St_Helena', '0.00', '0.00', '0.00'),
(334, 'SI', 'Europe/Ljubljana', '1.00', '2.00', '1.00'),
(335, 'SJ', 'Arctic/Longyearbyen', '1.00', '2.00', '1.00'),
(336, 'SK', 'Europe/Bratislava', '1.00', '2.00', '1.00'),
(337, 'SL', 'Africa/Freetown', '0.00', '0.00', '0.00'),
(338, 'SM', 'Europe/San_Marino', '1.00', '2.00', '1.00'),
(339, 'SN', 'Africa/Dakar', '0.00', '0.00', '0.00'),
(340, 'SO', 'Africa/Mogadishu', '3.00', '3.00', '3.00'),
(341, 'SR', 'America/Paramaribo', '-3.00', '-3.00', '-3.00'),
(342, 'SS', 'Africa/Juba', '3.00', '3.00', '3.00'),
(343, 'ST', 'Africa/Sao_Tome', '0.00', '0.00', '0.00'),
(344, 'SV', 'America/El_Salvador', '-6.00', '-6.00', '-6.00'),
(345, 'SX', 'America/Lower_Princes', '-4.00', '-4.00', '-4.00'),
(346, 'SY', 'Asia/Damascus', '2.00', '3.00', '2.00'),
(347, 'SZ', 'Africa/Mbabane', '2.00', '2.00', '2.00'),
(348, 'TC', 'America/Grand_Turk', '-5.00', '-4.00', '-5.00'),
(349, 'TD', 'Africa/Ndjamena', '1.00', '1.00', '1.00'),
(350, 'TF', 'Indian/Kerguelen', '5.00', '5.00', '5.00'),
(351, 'TG', 'Africa/Lome', '0.00', '0.00', '0.00'),
(352, 'TH', 'Asia/Bangkok', '7.00', '7.00', '7.00'),
(353, 'TJ', 'Asia/Dushanbe', '5.00', '5.00', '5.00'),
(354, 'TK', 'Pacific/Fakaofo', '13.00', '13.00', '13.00'),
(355, 'TL', 'Asia/Dili', '9.00', '9.00', '9.00'),
(356, 'TM', 'Asia/Ashgabat', '5.00', '5.00', '5.00'),
(357, 'TN', 'Africa/Tunis', '1.00', '1.00', '1.00'),
(358, 'TO', 'Pacific/Tongatapu', '13.00', '13.00', '13.00'),
(359, 'TR', 'Europe/Istanbul', '2.00', '3.00', '2.00'),
(360, 'TT', 'America/Port_of_Spain', '-4.00', '-4.00', '-4.00'),
(361, 'TV', 'Pacific/Funafuti', '12.00', '12.00', '12.00'),
(362, 'TW', 'Asia/Taipei', '8.00', '8.00', '8.00'),
(363, 'TZ', 'Africa/Dar_es_Salaam', '3.00', '3.00', '3.00'),
(364, 'UA', 'Europe/Kiev', '2.00', '3.00', '2.00'),
(365, 'UA', 'Europe/Simferopol', '2.00', '4.00', '4.00'),
(366, 'UA', 'Europe/Uzhgorod', '2.00', '3.00', '2.00'),
(367, 'UA', 'Europe/Zaporozhye', '2.00', '3.00', '2.00'),
(368, 'UG', 'Africa/Kampala', '3.00', '3.00', '3.00'),
(369, 'UM', 'Pacific/Johnston', '-10.00', '-10.00', '-10.00'),
(370, 'UM', 'Pacific/Midway', '-11.00', '-11.00', '-11.00'),
(371, 'UM', 'Pacific/Wake', '12.00', '12.00', '12.00'),
(372, 'US', 'America/Adak', '-10.00', '-9.00', '-10.00'),
(373, 'US', 'America/Anchorage', '-9.00', '-8.00', '-9.00'),
(374, 'US', 'America/Boise', '-7.00', '-6.00', '-7.00'),
(375, 'US', 'America/Chicago', '-6.00', '-5.00', '-6.00'),
(376, 'US', 'America/Denver', '-7.00', '-6.00', '-7.00'),
(377, 'US', 'America/Detroit', '-5.00', '-4.00', '-5.00'),
(378, 'US', 'America/Indiana/Indianapolis', '-5.00', '-4.00', '-5.00'),
(379, 'US', 'America/Indiana/Knox', '-6.00', '-5.00', '-6.00'),
(380, 'US', 'America/Indiana/Marengo', '-5.00', '-4.00', '-5.00'),
(381, 'US', 'America/Indiana/Petersburg', '-5.00', '-4.00', '-5.00'),
(382, 'US', 'America/Indiana/Tell_City', '-6.00', '-5.00', '-6.00'),
(383, 'US', 'America/Indiana/Vevay', '-5.00', '-4.00', '-5.00'),
(384, 'US', 'America/Indiana/Vincennes', '-5.00', '-4.00', '-5.00'),
(385, 'US', 'America/Indiana/Winamac', '-5.00', '-4.00', '-5.00'),
(386, 'US', 'America/Juneau', '-9.00', '-8.00', '-9.00'),
(387, 'US', 'America/Kentucky/Louisville', '-5.00', '-4.00', '-5.00'),
(388, 'US', 'America/Kentucky/Monticello', '-5.00', '-4.00', '-5.00'),
(389, 'US', 'America/Los_Angeles', '-8.00', '-7.00', '-8.00'),
(390, 'US', 'America/Menominee', '-6.00', '-5.00', '-6.00'),
(391, 'US', 'America/Metlakatla', '-8.00', '-8.00', '-8.00'),
(392, 'US', 'America/New_York', '-5.00', '-4.00', '-5.00'),
(393, 'US', 'America/Nome', '-9.00', '-8.00', '-9.00'),
(394, 'US', 'America/North_Dakota/Beulah', '-6.00', '-5.00', '-6.00'),
(395, 'US', 'America/North_Dakota/Center', '-6.00', '-5.00', '-6.00'),
(396, 'US', 'America/North_Dakota/New_Salem', '-6.00', '-5.00', '-6.00'),
(397, 'US', 'America/Phoenix', '-7.00', '-7.00', '-7.00'),
(398, 'US', 'America/Shiprock', '-7.00', '-6.00', '-7.00'),
(399, 'US', 'America/Sitka', '-9.00', '-8.00', '-9.00'),
(400, 'US', 'America/Yakutat', '-9.00', '-8.00', '-9.00'),
(401, 'US', 'Pacific/Honolulu', '-10.00', '-10.00', '-10.00'),
(402, 'UY', 'America/Montevideo', '-2.00', '-3.00', '-3.00'),
(403, 'UZ', 'Asia/Samarkand', '5.00', '5.00', '5.00'),
(404, 'UZ', 'Asia/Tashkent', '5.00', '5.00', '5.00'),
(405, 'VA', 'Europe/Vatican', '1.00', '2.00', '1.00'),
(406, 'VC', 'America/St_Vincent', '-4.00', '-4.00', '-4.00'),
(407, 'VE', 'America/Caracas', '-4.50', '-4.50', '-4.50'),
(408, 'VG', 'America/Tortola', '-4.00', '-4.00', '-4.00'),
(409, 'VI', 'America/St_Thomas', '-4.00', '-4.00', '-4.00'),
(410, 'VN', 'Asia/Ho_Chi_Minh', '7.00', '7.00', '7.00'),
(411, 'VU', 'Pacific/Efate', '11.00', '11.00', '11.00'),
(412, 'WF', 'Pacific/Wallis', '12.00', '12.00', '12.00'),
(413, 'WS', 'Pacific/Apia', '14.00', '13.00', '13.00'),
(414, 'YE', 'Asia/Aden', '3.00', '3.00', '3.00'),
(415, 'YT', 'Indian/Mayotte', '3.00', '3.00', '3.00'),
(416, 'ZA', 'Africa/Johannesburg', '2.00', '2.00', '2.00'),
(417, 'ZM', 'Africa/Lusaka', '2.00', '2.00', '2.00'),
(418, 'ZW', 'Africa/Harare', '2.00', '2.00', '2.00');

-- --------------------------------------------------------

--
-- Table structure for table `ulinks`
--

CREATE TABLE `ulinks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ulinks`
--

INSERT INTO `ulinks` (`id`, `language_id`, `name`, `url`) VALUES
(1, 169, 'Home', 'http://localhost:8001/'),
(2, 170, 'मुख्यपृष्ठ', 'http://localhost:8001/'),
(3, 169, 'About Us', 'http://localhost:8001/Aboute-Us'),
(4, 169, 'Department', 'http://localhost:8001/'),
(5, 169, 'e-Governance', 'http://localhost:8001/egovernance'),
(6, 169, 'Tender & Advertisement', 'http://localhost:8001/tenders'),
(7, 169, 'Contact Us', 'http://localhost:8001/contactus'),
(8, 170, 'आमच्याबद्दल', 'http://localhost:8001/आमच्याबद्दल'),
(9, 170, 'विभाग', 'http://localhost:8001/'),
(10, 170, 'ई-शासन', 'http://localhost:8001/egovernance'),
(11, 170, 'निविदा आणि जाहिरात', 'http://localhost:8001/tenders'),
(12, 170, 'आमच्याशी संपर्क साधा', 'http://localhost:8001/contactus');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `billing_fname` varchar(255) DEFAULT NULL,
  `billing_lname` varchar(255) DEFAULT NULL,
  `billing_photo` varchar(255) DEFAULT NULL,
  `billing_email` varchar(255) DEFAULT NULL,
  `billing_number` varchar(255) DEFAULT NULL,
  `billing_city` varchar(255) DEFAULT NULL,
  `billing_state` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `billing_country` varchar(255) DEFAULT NULL,
  `shpping_fname` varchar(255) DEFAULT NULL,
  `shpping_lname` varchar(255) DEFAULT NULL,
  `shpping_photo` varchar(255) DEFAULT NULL,
  `shpping_email` varchar(255) DEFAULT NULL,
  `shpping_number` varchar(255) DEFAULT NULL,
  `shpping_city` varchar(255) DEFAULT NULL,
  `shpping_state` varchar(255) DEFAULT NULL,
  `shpping_address` varchar(255) DEFAULT NULL,
  `shpping_country` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `verification_link` text DEFAULT NULL,
  `email_verified` varchar(20) NOT NULL DEFAULT 'no',
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `water_teriff`
--

CREATE TABLE `water_teriff` (
  `id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `water_tariff` varchar(255) DEFAULT NULL,
  `tariff_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `water_teriff`
--

INSERT INTO `water_teriff` (`id`, `language_id`, `institution`, `water_tariff`, `tariff_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 169, 'Thane Municipal Corporation Thane M B R', '11,900', NULL, '2024-05-15 07:57:02', '2024-05-16 10:30:17', NULL),
(2, 169, 'Thane Municipal Corporation  Azadnagar, Dongripada, BSUP, Gaymukh', '13,000', NULL, '2024-05-15 07:57:56', '2024-05-16 10:30:23', NULL),
(3, 169, 'Mira Bhayander Municipal Corporation', '12,600', NULL, '2024-05-15 07:58:42', '2024-05-16 10:30:28', NULL),
(4, 169, 'Bhiwandi Nizampur City Municipal Corporation', '11,900', NULL, '2024-05-15 07:59:52', '2024-05-16 10:30:33', NULL),
(5, 169, 'Zilla Parishad (36 Gram Panchayats)', '9,600', NULL, '2024-05-15 08:00:42', '2024-05-16 10:30:37', NULL),
(7, 170, 'ठाणे महानगरपालिका ठाणे एम बी आर', '११,९००', NULL, '2024-05-16 06:07:00', '2024-05-16 06:07:00', NULL),
(8, 170, 'ठाणे महानगरपालिका आझादनगर, डोंगरीपाडा, बीएसयुपी, गायमुख', '१३,०००', NULL, '2024-05-16 06:29:38', '2024-05-16 06:29:38', NULL),
(9, 170, 'मिरा भाईंदर महानगरपालिका', '१२,६००', NULL, '2024-05-16 06:30:55', '2024-05-16 06:30:55', NULL),
(10, 170, 'भिवंडी निजामपूर शहर महानगरपालिका', '११,९००', NULL, '2024-05-16 06:31:36', '2024-05-16 06:31:36', NULL),
(11, 170, 'जिल्हा परिषद (३६ ग्रामपंचायती)', '९६००', NULL, '2024-05-16 06:32:45', '2024-05-16 06:32:45', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alink`
--
ALTER TABLE `alink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `archives`
--
ALTER TABLE `archives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_categories`
--
ALTER TABLE `article_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_settings`
--
ALTER TABLE `basic_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_settings_extended`
--
ALTER TABLE `basic_settings_extended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_settings_extra`
--
ALTER TABLE `basic_settings_extra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcategories`
--
ALTER TABLE `bcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_query`
--
ALTER TABLE `contact_query`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_purchases`
--
ALTER TABLE `course_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `date_table`
--
ALTER TABLE `date_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dlink`
--
ALTER TABLE `dlink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_categories`
--
ALTER TABLE `document_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donations_lang_id_foreign` (`lang_id`);

--
-- Indexes for table `donation_details`
--
ALTER TABLE `donation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donation_details_donation_id_foreign` (`donation_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_lang_id_foreign` (`lang_id`),
  ADD KEY `events_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `event_categories`
--
ALTER TABLE `event_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_categories_lang_id_foreign` (`lang_id`);

--
-- Indexes for table `event_details`
--
ALTER TABLE `event_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_details_event_id_foreign` (`event_id`);

--
-- Indexes for table `e_governance`
--
ALTER TABLE `e_governance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_categories`
--
ALTER TABLE `gallery_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homes`
--
ALTER TABLE `homes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homes_language_id_foreign` (`language_id`);

--
-- Indexes for table `jcategories`
--
ALTER TABLE `jcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leadership`
--
ALTER TABLE `leadership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_categories`
--
ALTER TABLE `lead_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `megamenus`
--
ALTER TABLE `megamenus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `megamenus_language_id_foreign` (`language_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_gateways`
--
ALTER TABLE `offline_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_categories`
--
ALTER TABLE `package_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `package_inputs`
--
ALTER TABLE `package_inputs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_input_options`
--
ALTER TABLE `package_input_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_orders`
--
ALTER TABLE `package_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pcategories`
--
ALTER TABLE `pcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permalinks`
--
ALTER TABLE `permalinks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popups`
--
ALTER TABLE `popups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `popups_language_id_foreign` (`language_id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio_images`
--
ALTER TABLE `portfolio_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profit_chart`
--
ALTER TABLE `profit_chart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue_jobs`
--
ALTER TABLE `queue_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_jobs_queue_index` (`queue`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quote_inputs`
--
ALTER TABLE `quote_inputs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quote_input_options`
--
ALTER TABLE `quote_input_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles_old`
--
ALTER TABLE `roles_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `rss_feeds`
--
ALTER TABLE `rss_feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rss_posts`
--
ALTER TABLE `rss_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scategories`
--
ALTER TABLE `scategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sitemaps`
--
ALTER TABLE `sitemaps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenders`
--
ALTER TABLE `tenders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tender_category`
--
ALTER TABLE `tender_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ulinks`
--
ALTER TABLE `ulinks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `water_teriff`
--
ALTER TABLE `water_teriff`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `alink`
--
ALTER TABLE `alink`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `archives`
--
ALTER TABLE `archives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_categories`
--
ALTER TABLE `article_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basic_settings`
--
ALTER TABLE `basic_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `basic_settings_extended`
--
ALTER TABLE `basic_settings_extended`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `basic_settings_extra`
--
ALTER TABLE `basic_settings_extra`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `bcategories`
--
ALTER TABLE `bcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_query`
--
ALTER TABLE `contact_query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_categories`
--
ALTER TABLE `course_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_purchases`
--
ALTER TABLE `course_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_reviews`
--
ALTER TABLE `course_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `date_table`
--
ALTER TABLE `date_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dlink`
--
ALTER TABLE `dlink`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `document_categories`
--
ALTER TABLE `document_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `donation_details`
--
ALTER TABLE `donation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `event_categories`
--
ALTER TABLE `event_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `event_details`
--
ALTER TABLE `event_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `e_governance`
--
ALTER TABLE `e_governance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `gallery_categories`
--
ALTER TABLE `gallery_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `homes`
--
ALTER TABLE `homes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jcategories`
--
ALTER TABLE `jcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `leadership`
--
ALTER TABLE `leadership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `lead_categories`
--
ALTER TABLE `lead_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=487;

--
-- AUTO_INCREMENT for table `megamenus`
--
ALTER TABLE `megamenus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `offline_gateways`
--
ALTER TABLE `offline_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=443;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `package_categories`
--
ALTER TABLE `package_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `package_inputs`
--
ALTER TABLE `package_inputs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `package_input_options`
--
ALTER TABLE `package_input_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `package_orders`
--
ALTER TABLE `package_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pcategories`
--
ALTER TABLE `pcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `permalinks`
--
ALTER TABLE `permalinks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `popups`
--
ALTER TABLE `popups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio_images`
--
ALTER TABLE `portfolio_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=495;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `profit_chart`
--
ALTER TABLE `profit_chart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `queue_jobs`
--
ALTER TABLE `queue_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quote_inputs`
--
ALTER TABLE `quote_inputs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quote_input_options`
--
ALTER TABLE `quote_input_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles_old`
--
ALTER TABLE `roles_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rss_feeds`
--
ALTER TABLE `rss_feeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rss_posts`
--
ALTER TABLE `rss_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `scategories`
--
ALTER TABLE `scategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sitemaps`
--
ALTER TABLE `sitemaps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenders`
--
ALTER TABLE `tenders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tender_category`
--
ALTER TABLE `tender_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=419;

--
-- AUTO_INCREMENT for table `ulinks`
--
ALTER TABLE `ulinks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `water_teriff`
--
ALTER TABLE `water_teriff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_lang_id_foreign` FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `donation_details`
--
ALTER TABLE `donation_details`
  ADD CONSTRAINT `donation_details_donation_id_foreign` FOREIGN KEY (`donation_id`) REFERENCES `donations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `event_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_lang_id_foreign` FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_categories`
--
ALTER TABLE `event_categories`
  ADD CONSTRAINT `event_categories_lang_id_foreign` FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `event_details`
--
ALTER TABLE `event_details`
  ADD CONSTRAINT `event_details_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD CONSTRAINT `faq_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gallery_categories`
--
ALTER TABLE `gallery_categories`
  ADD CONSTRAINT `gallery_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homes`
--
ALTER TABLE `homes`
  ADD CONSTRAINT `homes_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `megamenus`
--
ALTER TABLE `megamenus`
  ADD CONSTRAINT `megamenus_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_categories`
--
ALTER TABLE `package_categories`
  ADD CONSTRAINT `package_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `popups`
--
ALTER TABLE `popups`
  ADD CONSTRAINT `popups_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
