--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', 'public', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cart (
    id serial PRIMARY KEY,
    created_date timestamp without time zone,
    product_id int,
    quantity integer NOT NULL,
    user_id integer
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

--CREATE SEQUENCE cart_id_seq
--    AS integer
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


-- ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id serial PRIMARY KEY,
    category_name character varying(255),
    description character varying(255),
    image_url character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

-- CREATE SEQUENCE public.categories_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


-- ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orderitems (
    id serial PRIMARY KEY,
    created_date timestamp without time zone,
    order_id integer,
    price double precision,
    product_id int,
    quantity integer
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

-- CREATE SEQUENCE public.orderitems_order_item_id_seq
--   AS integer
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


-- ALTER TABLE public.orderitems_order_item_id_seq OWNER TO postgres;

--
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.orderitems_order_item_id_seq OWNED BY public.orderitems.order_item_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id serial PRIMARY KEY,
    description character varying(255),
    image_url character varying(255),
    name character varying(255),
    price double precision NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

-- CREATE SEQUENCE public.products_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


-- ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id serial PRIMARY KEY,
    created_date timestamp without time zone,
    token character varying(255),
    user_id integer NOT NULL
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

-- CREATE SEQUENCE public.tokens_id_seq
--     AS integer
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;


-- ALTER TABLE public.tokens_id_seq OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_profile (
    id serial PRIMARY KEY,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    username character varying(255)
);


ALTER TABLE public.user_profile OWNER TO postgres;

--
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

-- CREATE SEQUENCE public.user_profile_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


-- ALTER TABLE public.user_profile_id_seq OWNER TO postgres;

--
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.user_profile_id_seq OWNED BY public.user_profile.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id serial PRIMARY KEY,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

-- CREATE SEQUENCE public.users_id_seq
--    AS integer
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


-- ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE wishlist (
    id serial PRIMARY KEY,
    created_date timestamp without time zone,
    product_id bigint,
    user_id integer
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- Name: wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

-- CREATE SEQUENCE public.wishlist_id_seq
--    AS integer
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


-- ALTER TABLE public.wishlist_id_seq OWNER TO postgres;

--
-- Name: wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.wishlist_id_seq OWNED BY public.wishlist.id;


--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: orderitems order_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.orderitems ALTER COLUMN order_item_id SET DEFAULT nextval('public.orderitems_order_item_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: user_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.user_profile ALTER COLUMN id SET DEFAULT nextval('public.user_profile_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wishlist id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.wishlist ALTER COLUMN id SET DEFAULT nextval('public.wishlist_id_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

-- COPY public.cart (id, created_date, product_id, quantity, user_id) FROM stdin;



--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categories (id, category_name, description, image_url) VALUES (1,'Electronics','string','string'),(2,'Kites','These are Kites','https://images.unsplash.com/photo-1600387822941-a6ac49b2f0a3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8a2l0ZXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(3,'Television','Television','https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8dGVsZXZpc2lvbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(4,'Shoes','Shoes','https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(5,'Clothes','Clothes',NULL),(6,NULL,'Kids space',NULL),(7,'Toys','Space for kids',NULL),(8,'Demo3','This is Demo category','https://images.unsplash.com/photo-1560529178-855fa2041193?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fHRveXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(9,'Demo5','This is demo test','https://images.unsplash.com/photo-1545997281-2cfe4d4b740f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHRveXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(10,'Demo','Demo','null'),(11,'demo4','demo4','null'),(12,'Demo10','Demo10','Demo10'),(13,'Smartphones','This contains all sartphones','https://images.unsplash.com/photo-1510878933023-e2e2e3942fb0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80'),(14,'Clocks','Collection of clocks','https://images.unsplash.com/photo-1585586463948-9e40851ed193?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),(15,'Kites','This is a collection of kites','https://images.unsplash.com/photo-1534640881905-039ca1e21a81?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8a2l0ZXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(16,'Books','This section contains Books','https://images.unsplash.com/photo-1524578271613-d550eacf6090?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3N8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(17,'Automobiles','Find all vehicles','https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fyc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(18,'Bags','High Quality Bags',NULL),(19,'Groceries','Find all your groceries here','https://images.unsplash.com/photo-1543168256-418811576931?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JvY2VyaWVzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(20,'Biscuits','Tasty Biscuits','https://images.unsplash.com/photo-1531685932387-e60fae5f6163?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTN8fGJpc2N1aXRzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');



--
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

-- COPY public.orderitems (order_item_id, created_date, order_id, price, product_id, quantity) FROM stdin;



--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO products (id, description, imageurl, name, price, category_id) VALUES (1,'Microcontroller board for starters.','https://images.unsplash.com/photo-1608564697071-ddf911d81370?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Arduino UNO',500,9),(2,'Highly accurate','https://images.unsplash.com/photo-1497997457905-3f85463eb0bc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2Vuc29yfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Ultrasonic sensor',200,2),(3,'hello World','https://images.unsplash.com/photo-1609584862854-57387c661076?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Hello World',100,1),(4,'This is a Car','https://images.unsplash.com/photo-1600661653561-629509216228?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTl8fGV2fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Tesla Car',10000,17),(5,'This is demo200','https://images.unsplash.com/photo-1602526211905-6adc54adb8d2?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','demo200',50000,1),(6,'This is a toy','https://images.unsplash.com/photo-1563396983906-b3795482a59a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8dG95c3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Toy',200,3),(7,'Demo','https://images.unsplash.com/photo-1469037784699-75dcff1cbf75?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fHRveXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Demo',89,5),(8,'This is a great Toy','https://images.unsplash.com/photo-1517348159000-002b80abf80f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzV8fHRveXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Toy',500,1),(9,'This is a car','https://images.unsplash.com/photo-1502877338535-766e1452684a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2FyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Car',5000,1),(10,'This is a Iphone','https://images.unsplash.com/photo-1556656793-08538906a9f8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80','Iphone',1000,1),(11,'This is a watch','https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80','Watch',2000,1),(12,'This is a clock','https://images.unsplash.com/photo-1563861826100-9cb868fdbe1c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Y2xvY2t8ZW58MHx8MHw%3D&auto=format&fit=crop&w=500&q=60','Wall Clock',2000,14),(13,'This is a TV','https://images.unsplash.com/photo-1571415060716-baff5f717c37?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8dHZ8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','LG TV',5000,3),(14,'This is a Samsung Smartphone','https://images.unsplash.com/photo-1553179459-4514c0f52f41?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fHNhbXN1bmclMjBzbWFydHBob25lfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Samsung Galaxy ',5000,13),(15,'Fruits','https://images.unsplash.com/photo-1609257574707-a3114f91cefe?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Fruits',1500,2),(16,'A great historical tamil novel by Amarar Kalki!','https://dwtr67e3ikfml.cloudfront.net/bookCovers/8d0aebe488c9389b799f9c153bc05717ce2fa45f','Ponniyin Selvan',2500,2),(17,'This is a Historical clock','https://images.unsplash.com/photo-1415604934674-561df9abf539?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8Y2xvY2tzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Ancient Clock',1000,14);



--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tokens (id, token, created_date, user_id) VALUES (1,'0a686925-7735-4d5e-930a-285e23d8aed1','2020-12-22 13:19:11',1),(2,'73110419-d579-4fd9-ad98-dd9402226adb','2020-12-22 13:22:02',2),(3,'9816248d-4623-474f-a985-d11b094325f9','2020-12-22 13:22:14',3),(4,'120038ca-5a15-49fa-a50f-6580345ad35e','2020-12-27 06:24:23',4),(5,'ea8303ca-29c7-4892-961a-5829814d02d3','2020-12-27 06:25:06',5),(6,'59f35dc9-9dc4-4bcc-ab28-f4ea6f81722d','2020-12-27 06:25:16',6),(7,'cba245a4-d4eb-41a2-9789-e3dc9b46855a','2020-12-27 07:48:16',7),(8,'3ea96f41-708c-4ad6-adf8-b862fc7ee125','2020-12-27 07:50:11',8),(9,'fb32b650-fd27-4dc3-b8e2-9bee7f5a66f3','2020-12-27 08:23:40',9),(10,'f54d51b9-01e3-4a1c-9ab7-b072801305dd','2020-12-27 08:41:01',10),(11,'1b7e5c1a-0161-453f-950e-367397190065','2020-12-27 15:39:16',11),(12,'4fee3514-cc3d-46c8-a0eb-0cc04a0fda59','2020-12-28 09:55:06',12),(13,'a3699f8e-56c6-4d00-8849-68833c37b571','2020-12-28 10:03:34',13),(14,'4a0d58f1-1171-4721-b617-ad2604bc12c2','2020-12-28 10:04:09',14),(15,'3d0bd78a-b4a1-4a91-bc9c-a9960c83a6e2','2020-12-28 11:30:29',15);



--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

-- COPY public.user_profile (id, email, first_name, last_name, username) FROM stdin;



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, email, first_name, last_name, password, role) VALUES (1,'t@t.t','rr','rr','E358EFA489F58062F10DD7316B65649E','user'),(2,'tt@tt.ttt','string','string','B45CFFE084DD3D20D928BEE85E7B0F21','user'),(3,'t@tt.tt',NULL,NULL,'ACCC9105DF5383111407FD5B41255E23','user'),(4,'tt@tt.t',NULL,NULL,'633DE4B0C14CA52EA2432A3C8A5C4C31','user'),(5,'tt@tt.tt','t','t','ACCC9105DF5383111407FD5B41255E23','user'),(6,'test@test.com','test','test','CEB6C970658F31504A901B89DCD3E461','user'),(7,'t@t.in','string','string','B45CFFE084DD3D20D928BEE85E7B0F21','user'),(8,'admin@gmail.com','admin','admin','21232F297A57A5A743894A0E4A801FC3','admin'),(9,'chathrua@test.com','Chathrua','Buddhika','34F85CA80EC353D3052B8A2D3973A0C5','user'),(10,NULL,NULL,'Darsha','69FE8DBF75B65A08B4C1F005B400F261','user'),(11,'testuser@gmail.com','test','user','098F6BCD4621D373CADE4E832627B4F6','user'),(12,'chathu@gmail.com','Chathura','Darsha','69FE8DBF75B65A08B4C1F005B400F261','user'),(13,'sdcdsc@gmail.com','Chathura','Darsha','69FE8DBF75B65A08B4C1F005B400F261','user'),(14,'ascscas@ds.hi','ascsc','Darshaaas','81DC9BDB52D04DC20036DBD8313ED055','user'),(15,'asdf@asdf.com','dsih','jisci','A545F9A48DF4BE512630CC53CEE1916B','user');



--
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO wishlist (id, user_id, created_date, product_id) VALUES (1,1,'2021-01-12 21:06:39',1),(2,1,'2021-01-12 21:11:54',6),(3,2,'2021-01-12 21:12:34',3),(5,9,'2021-01-13 02:48:42',3),(6,11,'2021-01-13 02:51:01',1);



--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitems_order_item_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokens_id_seq', 1, false);


--
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_profile_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 1, false);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.cart
--     ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.categories
--     ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.orderitems
--     ADD CONSTRAINT orderitems_pkey PRIMARY KEY (order_item_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.products
--    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.tokens
--    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.user_profile
--    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.users
--    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.wishlist
--     ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);


--
-- Name: tokens fk2dylsfo39lgjyqml2tbe0b0ss; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT fk2dylsfo39lgjyqml2tbe0b0ss FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: wishlist fk6p7qhvy1bfkri13u29x6pu8au; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk6p7qhvy1bfkri13u29x6pu8au FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: products fkog2rp4qthbtt2lfyhfo32lsw9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fkog2rp4qthbtt2lfyhfo32lsw9 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: cart fkpu4bcbluhsxagirmbdn7dilm5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fkpu4bcbluhsxagirmbdn7dilm5 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orderitems fkqu7dfdpbhltsgxfq2ahkdnyv5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT fkqu7dfdpbhltsgxfq2ahkdnyv5 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--
