--
-- PostgreSQL database dump
--

\restrict HNwY5s4lfor3Tyu7PyTEB9QJEMzyq1XCEHgsl9tr0Pnd1HIx1cf6o02z4YQj8ZB

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-16 11:52:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 222 (class 1259 OID 17444)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    role character varying(100),
    game character varying(100),
    photo text,
    quotes text,
    favorite_weapon integer
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17443)
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.characters_id_seq OWNER TO postgres;

--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 221
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;


--
-- TOC entry 220 (class 1259 OID 17435)
-- Name: infected; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.infected (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    photo text,
    threat_level character varying(100),
    weaknesses text
);


ALTER TABLE public.infected OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17434)
-- Name: infected_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.infected_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.infected_id_seq OWNER TO postgres;

--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 219
-- Name: infected_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.infected_id_seq OWNED BY public.infected.id;


--
-- TOC entry 218 (class 1259 OID 17426)
-- Name: weapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapons (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    photo text,
    type character varying(100)
);


ALTER TABLE public.weapons OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17425)
-- Name: weapons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weapons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weapons_id_seq OWNER TO postgres;

--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 217
-- Name: weapons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapons_id_seq OWNED BY public.weapons.id;


--
-- TOC entry 4653 (class 2604 OID 17447)
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- TOC entry 4652 (class 2604 OID 17438)
-- Name: infected id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infected ALTER COLUMN id SET DEFAULT nextval('public.infected_id_seq'::regclass);


--
-- TOC entry 4651 (class 2604 OID 17429)
-- Name: weapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons ALTER COLUMN id SET DEFAULT nextval('public.weapons_id_seq'::regclass);


--
-- TOC entry 4811 (class 0 OID 17444)
-- Dependencies: 222
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.characters VALUES (1, 'Joel Miller', 'Protagonista do primeiro jogo, sobrevivente endurecido pela perda da filha.', 'Protagonista', 'Parte I', '979fdb17ce957d0f96f55aac34c4c4a0', '“Prometa-me que vai lutar pela sua vida.”', 12);
INSERT INTO public.characters VALUES (2, 'Ellie Williams', 'Adolescente imune ao Cordyceps, peça central da história. Cresce como sobrevivente.', 'Co-protagonista', 'Parte I', '869a7d03b4f8ea36f62616941f4f4192', '“Depois de tudo que passamos, tudo que fizemos, você ainda vai me abandonar?”', 13);
INSERT INTO public.characters VALUES (3, 'Tess Servopoulos', 'Parceira de Joel no contrabando. Forte, decidida e leal.', 'Aliada', 'Parte I', '8a9a4d7c310a5523c852674a75464617', '“Não somos maus, só fazemos o que precisa ser feito.”', 6);
INSERT INTO public.characters VALUES (4, 'Marlene', 'Líder dos Vagalumes. Acredita que Ellie é a chave para a cura.', 'Líder dos Vagalumes', 'Parte I', '345f17037ed779a868265c22fdb064d2', '“Você tem que acreditar, Joel. É o futuro da humanidade.”', 8);
INSERT INTO public.characters VALUES (5, 'Ellie Williams', 'Agora jovem adulta, protagonista da Parte II. Em busca de vingança.', 'Protagonista', 'Parte II', '7b9e16cd8639ce11822108c2f352e95f', '“Eu vou encontrá-la… e vou matá-la.”', 1);
INSERT INTO public.characters VALUES (6, 'Abby Anderson', 'Soldada da WLF em Seattle. Motivada por vingança, cruza o caminho de Ellie.', 'Protagonista alterna', 'Parte II', '679788c79f3ab209c389d8914a871741', '“Todos nós fazemos escolhas… e pagamos por elas.”', 11);
INSERT INTO public.characters VALUES (7, 'Dina', 'Amiga e interesse amoroso de Ellie. Leal, afetuosa e corajosa.', 'Aliada', 'Parte II', 'ef586675a6682fe2be8a4855a01268c5', '“Você me faz querer ser uma pessoa melhor.”', 6);
INSERT INTO public.characters VALUES (8, 'Tommy Miller', 'Irmão de Joel. Guerreiro habilidoso, mas com forte senso de justiça.', 'Aliado', 'Parte II', '76521daf917f6e97cbc23deda3e92bdc', '“Você não sabe o que está perdendo, Ellie.”', 12);
INSERT INTO public.characters VALUES (9, 'Lev', 'Jovem Serafita que ajuda Abby. Corajoso e determinado.', 'Aliado', 'Parte II', '8f9135b118c66d33cda756c1db1f4568', '“Não escolhi quem eu sou, só escolhi ser livre.”', 14);


--
-- TOC entry 4809 (class 0 OID 17435)
-- Dependencies: 220
-- Data for Name: infected; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.infected VALUES (1, 'Corredor', 'Primeiro estágio da infecção. Muito ágil e agressivo, mas frágil em combate direto.', 'e686815706e7bbf7a665e3bad446e95f', 'Médio', 'Armas de fogo rápidas, ataques corpo a corpo, fogo');
INSERT INTO public.infected VALUES (2, 'Corredor', 'Primeiro estágio da infecção. Muito ágil e agressivo, mas frágil em combate direto.', '245591e1a12a17af19c16506c7b92cc3', 'Médio', 'Armas de fogo rápidas, ataques corpo a corpo, fogo');
INSERT INTO public.infected VALUES (3, 'Perseguidor', 'Estágio intermediário entre Corredor e Estalador. Mais furtivo, costuma emboscar a vítima.', 'a81273fa52fe2650ebdc5e68d37551f2', 'Alto', 'Armas de fogo, facas, explosivos');
INSERT INTO public.infected VALUES (4, 'Estalador', 'Segundo estágio da infecção, cegos e guiados pela ecolocalização. Letais em ataque corpo a corpo.', 'd40850b0fde11f4f417cfe0e3d6f17fc', 'Muito Alto', 'Furtividade, armas de fogo potentes, fogo');
INSERT INTO public.infected VALUES (5, 'Baiacu', 'Estágio final da infecção. Muito grande, resistente e capaz de lançar esporos explosivos.', 'eeed3f583674bff934b65adbda12abea', 'Extremo', 'Explosivos, fogo, lança-chamas.');
INSERT INTO public.infected VALUES (6, 'Chamuscado', 'Variante do Baiacu exclusiva da Parte II. Mais ágil, resistente e extremamente letal.', '52e89ac47eec43224ab7a99b33b6725b', 'Extremo', 'Explosivos, lança-chamas, ataques em equipe.');


--
-- TOC entry 4807 (class 0 OID 17426)
-- Dependencies: 218
-- Data for Name: weapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.weapons VALUES (1, 'Faca', 'Arma branca usada para ataques furtivos e abates silenciosos. Na Parte II, Ellie já possui uma faca permanente que não se quebra.', '6625ebec2c45025ec5295911d168e94e', 'Corpo a corpo');
INSERT INTO public.weapons VALUES (2, 'Taco de Beisebol', 'Arma corpo a corpo comum, causa bastante dano e pode ser melhorada com lâmina.', 'a222df8f8e9739e5bb0d37a5ba046d97', 'Corpo a corpo');
INSERT INTO public.weapons VALUES (3, 'Bastão de Madeira', 'Versão alternativa do taco, usado em combate corpo a corpo.', 'e536f413e46f528ec76a6f28d9f39c74', 'Corpo a corpo');
INSERT INTO public.weapons VALUES (4, 'Cano de Metal', 'Arma corpo a corpo resistente, pode ser aprimorada com lâmina.', 'c33ce8a5bdf07949f008b086004a857d', 'Corpo a corpo');
INSERT INTO public.weapons VALUES (5, 'Machadinha', 'Arma corpo a corpo de alto dano, ideal contra inimigos mais fortes.', 'b754a644563af6a04126e258a8368e5c', 'Corpo a corpo');
INSERT INTO public.weapons VALUES (6, 'Pistola 9mm', 'Arma leve, rápida, ideal para combate próximo.', '426f9be392eddf4e256c06e5daab3864', 'Arma de fogo');
INSERT INTO public.weapons VALUES (7, 'Pistola Semi-Automática', 'Pistola de Ellie na Parte II, rápida e precisa.', 'ab3580adc1310f5151e5bb1233f192a7', 'Arma de fogo');
INSERT INTO public.weapons VALUES (8, 'Revólver', 'Arma de fogo de pequeno porte, dano moderado e munição comum.', '8813bf79b88ecf02e8d04cee403be5c2', 'Arma de fogo');
INSERT INTO public.weapons VALUES (9, 'Espingarda', 'Arma de curto alcance, extremamente letal contra múltiplos inimigos.''', '6c41ba519d04366c71c223bdf72a5db4', 'Arma de fogo');
INSERT INTO public.weapons VALUES (10, 'Espingarda', 'Arma de curto alcance, extremamente letal contra múltiplos inimigos.''', 'd340db4244f4ae5d0e85804d5582ad7a', 'Arma de fogo');
INSERT INTO public.weapons VALUES (11, 'Espingarda de Cano Serrado', 'Versão mais curta da espingarda, usada por Abby.', 'ea02e03bf52792e3fa684d01f199416a', 'Arma de fogo');
INSERT INTO public.weapons VALUES (12, 'Rifle de Caça', 'Rifle de longo alcance com mira, alto dano em inimigos distantes.', '02acaebddfca2a043e2dc88d0b316a90', 'Arma de fogo');
INSERT INTO public.weapons VALUES (13, 'Arco e Flecha', 'Arma silenciosa, ideal para furtividade, permite reutilizar flechas.', '0a27a6d2dbf22cc12f1f4e1cd9604ed4', 'Arma de fogo');
INSERT INTO public.weapons VALUES (14, 'Arco Composto', 'Versão melhorada do arco, com mais precisão e dano, aparece na Parte II.', '5b42992648fc10fdf1da9af10c2dcdee', 'Arma de fogo');
INSERT INTO public.weapons VALUES (15, 'Lança-Chamas', 'Arma improvisada que dispara fogo, extremamente eficaz contra infectados.', '1aa133c0ffb6700d42298547422944ad', 'Arma de fogo');
INSERT INTO public.weapons VALUES (16, 'Coquetel Molotov', 'Explosivo improvisado que incendeia inimigos em área.', 'fbf1880893dc6e0cf3e6bad40298cd3c', 'Explosivo');
INSERT INTO public.weapons VALUES (17, 'Bomba de Estilhaço', 'Arma improvisada com explosão letal em área.', '2c96f941982995a8e34c7d0b7564c31c', 'Explosivo');


--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 221
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_id_seq', 9, true);


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 219
-- Name: infected_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.infected_id_seq', 6, true);


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 217
-- Name: weapons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapons_id_seq', 17, true);


--
-- TOC entry 4659 (class 2606 OID 17451)
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- TOC entry 4657 (class 2606 OID 17442)
-- Name: infected infected_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.infected
    ADD CONSTRAINT infected_pkey PRIMARY KEY (id);


--
-- TOC entry 4655 (class 2606 OID 17433)
-- Name: weapons weapons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT weapons_pkey PRIMARY KEY (id);


--
-- TOC entry 4660 (class 2606 OID 17452)
-- Name: characters characters_favorite_weapon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_favorite_weapon_fkey FOREIGN KEY (favorite_weapon) REFERENCES public.weapons(id) ON DELETE CASCADE;


-- Completed on 2025-09-16 11:52:55

--
-- PostgreSQL database dump complete
--

\unrestrict HNwY5s4lfor3Tyu7PyTEB9QJEMzyq1XCEHgsl9tr0Pnd1HIx1cf6o02z4YQj8ZB

