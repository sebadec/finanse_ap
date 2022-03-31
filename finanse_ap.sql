-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 31 Mar 2022, 19:33
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `finanse_ap`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

CREATE TABLE `category` (
  `categoryID` int(2) NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `category`
--

INSERT INTO `category` (`categoryID`, `category`) VALUES
(1, 'Jedzenie'),
(2, 'Mieszkanie'),
(3, 'Transport'),
(4, 'Telekomunikacja'),
(5, 'Opieka zdrowotna'),
(6, 'Ubranie'),
(7, 'Higiena'),
(8, 'Dzieci'),
(9, 'Rozrywka'),
(10, 'Wycieczka'),
(11, 'Szkolenia'),
(12, 'Książki'),
(13, 'Oszczędności'),
(14, 'Na złotą jesień, czyli emeryturę'),
(15, 'Spłata długów'),
(16, 'Darowizna'),
(17, 'Inne wydatki'),
(18, 'Wynagrodzenie'),
(19, 'Odsetki bankowe'),
(20, 'Sprzedaż na allegro');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `expenses`
--

CREATE TABLE `expenses` (
  `expensesID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date` date NOT NULL,
  `paymentID` int(2) NOT NULL,
  `categoryID` int(2) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `expenses`
--

INSERT INTO `expenses` (`expensesID`, `userID`, `amount`, `date`, `paymentID`, `categoryID`, `comment`) VALUES
(1, 1, 1000, '2022-03-29', 2, 4, 'abc'),
(2, 1, 1000, '2022-03-21', 2, 4, 'def'),
(3, 1, 2000, '2022-02-20', 1, 6, 'ghi'),
(4, 2, 100, '2022-03-25', 1, 7, ''),
(5, 2, 500, '2022-03-25', 2, 8, ''),
(6, 2, 500, '2022-02-20', 3, 9, ''),
(7, 2, 100, '2022-02-21', 2, 10, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `incomes`
--

CREATE TABLE `incomes` (
  `incomesID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date` date NOT NULL,
  `categoryID` int(2) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(2) NOT NULL,
  `payment` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `payment`
--

INSERT INTO `payment` (`paymentID`, `payment`) VALUES
(1, 'Karta kredytowa'),
(2, 'Gotówka'),
(3, 'Karta debetowa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`userID`, `name`, `email`, `password`) VALUES
(1, 'Sebastian', 'sebastian.dec.programista@gmail.com', 'admin1'),
(2, 'Sebastian2', 'sebadec50@gmail.com', 'Start1'),
(3, 'Ania', 'Ania11@gmail.com', 'qwert123');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indeksy dla tabeli `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expensesID`),
  ADD KEY `userID` (`userID`);

--
-- Indeksy dla tabeli `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`incomesID`),
  ADD KEY `userID` (`userID`);

--
-- Indeksy dla tabeli `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expensesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `incomes`
--
ALTER TABLE `incomes`
  MODIFY `incomesID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`UserID`);

--
-- Ograniczenia dla tabeli `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
