--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-12-09 20:42:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 25835)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25834)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 25857)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25856)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 25868)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25867)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 25829)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(100),
    role character varying(50) NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25828)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 25841)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    description text NOT NULL,
    price real NOT NULL,
    seller text NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    date_time timestamp without time zone,
    category_id integer,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25884)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25883)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 25840)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3364 (class 0 OID 25835)
-- Dependencies: 217
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Televisions');
INSERT INTO public.category (id, name) VALUES (2, 'Smartphones');
INSERT INTO public.category (id, name) VALUES (3, 'Steamers');
INSERT INTO public.category (id, name) VALUES (4, 'Heaters');


--
-- TOC entry 3368 (class 0 OID 25857)
-- Dependencies: 221
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (6, 'aa019e2c-7437-4a52-8fad-ceeac18b1078.a2f7b75179b711431f661da49454f5cc.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '71bbe8c9-5747-48f5-96a6-33e1e100cfa0.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '5c5e961b-cbcc-4fe7-9e29-3b9eb2f03659.1645537156_6325325325325325326.webp', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '1d98e766-04b9-48ff-a417-6ca0569cd117.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, 'a58a0398-3e38-4536-a6a9-6f8189414cde.1646180024781791144.webp', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '8f8eb0fb-69dc-4a6e-8596-7b052a67bbcd.iphone-14_large.png', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, '3052c86d-0c75-4341-b2f2-6e8acac9fb3f.iPhone-14-Mock-pill-and-hole-thu_large.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, 'f64015a5-7389-4149-b8d8-5cf32d25c52b.960x0.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, '5438ee52-9a85-406f-ba98-9f5c3b2a4a00.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '1a497605-bf26-45ff-b766-3409d0c94017.iphone14-xl_large.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, 'bf115e4b-bb42-4607-9cbf-ac3ebc69d736.$_57.jpeg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, '02b80498-feb2-4f42-a8d6-bba52441815c.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, '13a746e4-cce2-403b-ac29-f3737c747d02.e8670b52a8659db3243ecb24a7b399a1.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, '05e1bb39-c799-4bdf-b4ea-3531cf3c9936.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, '6c089776-0ba9-4b04-ad08-0b7e7cd6e94a.198442c4aa3b7b108186daa7e48e8d9e.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, 'b41f61dc-dccf-4e7f-a2cb-f926853a66d3.6021518123.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, '96bc0ee8-6642-44ed-876a-32b8d7d883eb.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '575f6536-29bd-408a-8bc3-ee5a9f611930.988604_6.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, 'fab6a345-9653-4240-898f-e5b6e1831a09.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '8b114d56-0039-4577-8401-7d83fd7ce851.21727-main.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, 'cf530c75-1c3e-477f-8cd8-99eca7f0e70c.700-nw.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '5faee02f-bea4-41cb-9c65-abb5b2f4401b.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '0d434b68-13c3-4758-955a-71f85b61ffa3.image3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '1dddbd4b-d495-4af5-b015-b9e2ced2ee61.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, 'b89eacf1-8153-401a-b5cb-237e5cec93be.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '1823e59b-1438-4adf-bf2c-cd685e48541d.1311502.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, '10fcc9a9-f931-412d-a7de-43ea1a9e6a38.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, 'c49d70e7-fada-403d-9083-a8dd0206a0e8.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'c2d03f35-a725-406e-9902-b8744453d0b4.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '4dd96b92-fcb1-4041-8a85-edccbb47bb4e.', 7);


--
-- TOC entry 3370 (class 0 OID 25868)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2022-12-08 22:11:39.897902', 'c4ddca44-e29c-40e8-b2b2-532eb7731fee', 150, 4, 3, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2022-12-08 22:25:31.002976', 'e1f0fcf3-9bec-4d59-ba9b-3dc352618f29', 35, 4, 3, 7);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2022-12-09 11:55:08.687707', '7c56814f-b0a5-47af-a218-9df2e87d26d7', 600, 4, 3, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (6, 1, '2022-12-09 11:55:08.727993', '7c56814f-b0a5-47af-a218-9df2e87d26d7', 150, 4, 3, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (7, 1, '2022-12-09 11:55:08.735971', '7c56814f-b0a5-47af-a218-9df2e87d26d7', 600, 4, 3, 3);


--
-- TOC entry 3362 (class 0 OID 25829)
-- Dependencies: 215
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'user1', '$2a$10$KWzEiV8PLZyBhsIp8WfSD.WjacNeEP2IMMgXg29YpPtfNejIcTRlO', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'Port15', '$2a$10$BuXWpZDUh3AoCw6Wy3qlqe6lD9P2Rvnw37yjbnJDdFMswGc90RHRK', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (3, 'Foga5', '$2a$10$Jqw8r5f01wMaJ5y2h2DLEeR5zb.FdcHi5QvxzRuNBOgkRXEx6CBSu', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (4, 'User2', '$2a$10$cw27e6KaMiLvj2x4Ikx0weh2NHZrhY1G3WepgD7TGr/Gt9XGQ8.D6', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (5, 'Foga6', '$2a$10$JKZGdpRl.fck9d4zHGyb7Oh78KEPl6iuAD.fr2Z3nUJszE0eYt88O', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (6, 'Foga7', '$2a$10$va7kZN0N8420BRo3Vn6aHe9bTP0lkT9h757UyjWQnaP9vvr3LAfN2', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (7, 'Ruby16', '$2a$10$qBeNNRDiwPCk62qdVUxg2eGe2AGIxGvz0OxO0eq2vgWieDUdjzjTi', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (8, 'Evernote', '$2a$10$bAqNraMIom4Z/KGjhbyxHOs67uTDSFdPL8nyixpyoD6sP1aO7YK6.', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (9, 'Goga66', '$2a$10$P4HRHCvqYwlAAtIvXR04zukoReZsnE5ziIXssR3TgJfk7./1Y5M4W', 'ROLE_USER');


--
-- TOC entry 3366 (class 0 OID 25841)
-- Dependencies: 219
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, description, price, seller, title, warehouse, date_time, category_id) VALUES (7, 'Утюг со встроенным пульверизатором оснащён терморегулятором, регулятором пара, сетевым индикатором. Предусмотрена фун...
', 35, 'Philips', 'Паровой утюг', 'China', NULL, 3);
INSERT INTO public.product (id, description, price, seller, title, warehouse, date_time, category_id) VALUES (2, 'В серии POCO X теперь используется дисплей AMOLED и поддерживается цветовой охват DCI-P3. Расширенное цветовое пространство для более сочной картинки и кинематографического эффекта. Диафрагма фронтальной камеры составляет 2,96 мм, что расширяет поле зрения', 35000, 'Xiaomi', 'Poco x4 pro 5G', 'China', '2022-12-08 14:13:27.841024', 2);
INSERT INTO public.product (id, description, price, seller, title, warehouse, date_time, category_id) VALUES (3, 'У iPhone 14 Pro 6,1--дюймовая панель. Пиковая яркость — 2000 нит. Используется небольшой вырез с датчиком фронтальной камеры и системой Face ID. Кроме того, он способен визуально уменьшаться и увеличиваться. Предусмотрен режим Always-on Display (экран всегда включен).
Аппаратная основа — A16 Bionic. Это 4-нм SoC с производительным GPU и дополнительным процессором Image Signal Proccessor для повышения качества снимков.
Тыльная камера iPhone 14 Pro тройная, на 48, 12 и 12 Мп. Ночью iPhone 14 Pro снимает в два раза лучше, чем iPhone 13 Pro. Селфи-камера на 12 Мп.', 600, 'Apple', 'Apple iPhone 14 Pro', 'USA', '2022-12-08 21:44:57.278048', 2);
INSERT INTO public.product (id, description, price, seller, title, warehouse, date_time, category_id) VALUES (4, 'Купить 32" Zoll LED Cello Smart TV 81cm HD Android Fernseher DVB-T2/C, WLAN, HDMI, USB из категории Телевизоры в разделе ТВ, видео и аудио с доставкой в Россию, Казахстан, Беларусь, Украину, Молдову, Армению, Азербайджан, Грузию и другие страны на уникальных условиях сервиса E-Pard: гарантия доставки, страхование посылки, единый тариф, никаких скрытых расходов. Сравните цены в европейских магазинах и выберите лучший вариант. Сэкономьте деньги - купите нужный товар у иностранного продавца, сделайте это с доставкой в любой город и населённый пункт.', 150, 'Cello', 'Zoll LED Cello Smart TV 81cm HD Android Fernseher DVB-T2/C, WLAN', 'USA', '2022-12-08 21:47:43.898468', 1);
INSERT INTO public.product (id, description, price, seller, title, warehouse, date_time, category_id) VALUES (6, 'В доме или офисе недостаточно тепло? На помощь придёт Обогреватель Polaris PKSH 0508H, карбоновый, 800 Вт серебристый/чёрный. Прибор будет актуален как зимой, так и в другое прохладное время года. Простая в использовании и компактная модель наполнит помещение приятным теплом и сделает атмосферу ещё уютнее. Устройство не займёт много места, а поэтому отлично подойдёт даже для небольшого помещения.', 15, 'Polaris', 'Обогреватель Polaris PKSH 0508H', 'China', '2022-12-08 21:50:44.301437', 3);
INSERT INTO public.product (id, description, price, seller, title, warehouse, date_time, category_id) VALUES (5, 'Отпариватель Grand Master GM-S205 Professional Silver – профессиональная модель, обладающая высокой мощностью. 
', 60, 'Grand', 'Хороший Отпариватель Grand Master GM-S205', 'USA', NULL, 4);


--
-- TOC entry 3372 (class 0 OID 25884)
-- Dependencies: 225
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_cart (id, person_id, product_id) VALUES (8, 8, 2);


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 216
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 4, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 220
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 40, true);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 7, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 214
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 9, true);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 10, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 8, true);


--
-- TOC entry 3202 (class 2606 OID 25839)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 25861)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 25872)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 25833)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 25888)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 25848)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 25850)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3215 (class 2606 OID 25873)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3213 (class 2606 OID 25851)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3216 (class 2606 OID 25878)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3214 (class 2606 OID 25862)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3217 (class 2606 OID 25894)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3218 (class 2606 OID 25889)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-12-09 20:42:15

--
-- PostgreSQL database dump complete
--

