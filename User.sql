CREATE TABLE `login` (
             `email` varchar(45) NOT NULL,
             `password` varchar(45) DEFAULT NULL,
             PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;