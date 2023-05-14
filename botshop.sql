-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 14 2023 г., 20:57
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `botshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, '🍵 Чай'),
(2, '☕️ Кофе'),
(3, '🍎 Фрукты'),
(4, '🍆 Овощи');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `telegram_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `bonuces_used` float NOT NULL,
  `delivery_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `telegram_id`, `time`, `bonuces_used`, `delivery_address`) VALUES
(48, 23101, '2023-05-02 08:33:55', 0, 'Тестовый Адрес');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_composition`
--

CREATE TABLE `orders_composition` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `orders_composition`
--

INSERT INTO `orders_composition` (`order_id`, `product_id`, `amount`, `price`, `discount`) VALUES
(48, 1, 1, 112, 0),
(48, 2, 2, 200, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `in_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `price`, `discount`, `description`, `in_stock`) VALUES
(1, 1, 'Чай зеленый ПРИНЦЕССА ЯВА', 'https://pipe.bot/img/d/m/6d/79f473.jpg', '200 грамм', 119, 0, 'Чай зеленый ПРИНЦЕССА ЯВА Китайский Традиционный листовой – зеленый чай сорта ганпаудер (в переводе «порох») из китайской провинции Чженцзян. Обладает приятным терпким вкусом с выразительной легкой горчинкой. Название получил благодаря технологии производства: при сушке чайные листья скручиваются в шарики, напоминающие порох.', 110),
(2, 1, 'Чай зеленый GREENFIELD Green Melissa', 'https://pipe.bot/img/d/m/b6/2d6f0f.jpg', '100 пакетиков', 299, 110, 'Чай зеленый GREENFIELD Green Melissa – натуральная композиция из зеленого китайского чая, мяты и мелиссы. Обладает освежающим нежным вкусом, в котором сочетаются легкая терпкость изысканного зеленого чая, свежесть мяты и естественный лимонный оттенок мелиссы.', 50),
(3, 1, 'Чай зеленый CURTIS Fresh Mojito', 'https://pipe.bot/img/d/m/e7/63a542.jpg', '20 пакетиков', 109, 0, 'Зеленый чай CURTIS Fresh Mojito – это китайский зеленый чай с ароматом мохито, мятой, цедрой цитрусовых и лемонграссом. Солнечный аромат спелого лайма и свежесть мяты перенесут вас в незабываемое путешествие на Кубу. Зеленый чай - отличный источник антиоксидантов и питательных веществ, которые благотворно влияют на здоровье.', 60),
(4, 1, 'Чай зеленый TESS Flirt с кусочками персика и клубники', 'https://pipe.bot/img/d/m/57/e023bc.jpg', '25 пакетиков', 79, 0, 'Чай зеленый TESS Флирт с кусочками персика и клубники – зеленый чай с белым персиком и клубникой, обладающий выразительной, нежной композицией с целым букетом оттенков и полутонов. Легкая терпкость зеленого чая смягчается свежим, сочным вкусом белого персика и тонкой, естественной ноткой клубники.', 200),
(5, 2, 'Кофе растворимый JACOBS Monarch сублимированный', 'https://pipe.bot/img/d/m/18/95e8ec.jpg', '270 грамм', 499, 0, 'JACOBS Monarch обладает богатым, классическим вкусом и притягательным ароматом, благодаря искусному сочетанию отборных кофейных зерен и глубокой обжарке, и является наиболее популярным кофе в линейке JACOBS. Приготовьте кофе JACOBS Monarch для себя и своих близких и почувствуйте его вдохновляющую Аромагию.', 140),
(6, 4, 'Огурцы среднеплодные гладкие', 'https://pipe.bot/img/d/m/03/33dba6.jpg', '1 кг', 199, 30, 'Огурцы среднеплодные гладкие отличаются гладкой тонкой кожицей насыщенного зеленого цвета. Овощи обладают сочной хрустящей структурой с практически незаметными семечками.', 25),
(7, 3, 'Манго спелое, весовое', 'https://pipe.bot/img/d/m/ca/f820ad.jpg', '800 гр', 369, 80, 'Манго – очень вкусный экзотический плод овальной формы. Размер фрукта довольно большой, длина 10–20см, вес 350–600г. Кожура зеленого цвета с красным румянцем. Мякоть зрелого манго сочная и сладкая, медового цвета. В центре плода вытянутая, жесткая косточка. Манго укрепляет иммунитет, налаживает пищеварение и улучшает зрение.', 50);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `telegram_id` int(11) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `telegram_name` varchar(255) NOT NULL,
  `telegram_lastname` varchar(255) NOT NULL,
  `telegram_nickname` varchar(255) NOT NULL,
  `bonuces_amount` float NOT NULL DEFAULT 0,
  `active_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`telegram_id`, `phone`, `telegram_name`, `telegram_lastname`, `telegram_nickname`, `bonuces_amount`, `active_status`) VALUES
(0, '1111', 'undefined', 'undefined', 'undefined', 0, 1),
(1, NULL, '2', '3', '4', 0, 1),
(23, NULL, '23', '23', '23', 0, 1),
(231, NULL, '231', '231', '231', 0, 1),
(2310, NULL, '231', '231', '231', 0, 1),
(23101, NULL, '231', '231', '231', 0, 1),
(123456, '79282279567', 'Test', 'User', 'testusernickname', 0, 1),
(231011, NULL, '231', '231', '231', 0, 1),
(316721682, '79282279567', 'bodya', 'sokol', 'mrguitarix', 111, 1),
(321321321, '1231231234', 'tgname', 'tglastname', 'tgnickname', 0, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `telegram_id` (`telegram_id`);

--
-- Индексы таблицы `orders_composition`
--
ALTER TABLE `orders_composition`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`telegram_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`telegram_id`) REFERENCES `users` (`telegram_id`);

--
-- Ограничения внешнего ключа таблицы `orders_composition`
--
ALTER TABLE `orders_composition`
  ADD CONSTRAINT `orders_composition_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_composition_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
