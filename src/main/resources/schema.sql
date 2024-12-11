-- lineas de atencion
CREATE SEQUENCE IF NOT EXISTS linea_atencion_ape;
CREATE SEQUENCE IF NOT EXISTS linea_atencion_sena;
CREATE SEQUENCE IF NOT EXISTS tags_id_seq;

CREATE TABLE IF NOT EXISTS public."LINEA_ATENCION_APE" (
    id BIGINT DEFAULT nextval('linea_atencion_ape'::regclass) NOT NULL,
    departamento varchar(200) NOT NULL,
    ciudad varchar(200) NOT NULL,
    contacto varchar(200) NULL,
    direccion text NULL,
    horario_atencion varchar(255) NULL,
    telefono varchar(200) NULL,
    CONSTRAINT "LINEA_ATENCION_APE_PK" PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS public."LINEA_ATENCION_SENA" (
    id BIGINT DEFAULT nextval('linea_atencion_sena'::regclass) NOT NULL,
    cod_regional int4 NOT NULL,
    departamento varchar(100) NOT NULL,
    ciudad varchar(100) NOT NULL,
    contacto varchar(100) NULL,
    direccion text NULL,
    horario_atencion varchar(255) NULL,
    telefono varchar(50) NULL,
    nombre_centro varchar(255) NULL,
    CONSTRAINT "LINEA_ATENCION_SENA_PK" PRIMARY KEY (id)
);

--/************************************************************/




CREATE TABLE IF NOT EXISTS public.ruv_victimas_temp (
"ID" SERIAL PRIMARY KEY,
"ORIGEN" varchar(4000) NULL,
"FUENTE" varchar(4000) NULL,
"PROGRAMA" varchar(1000) NULL,
"ID_PERSONA" varchar(2000) NULL,
"ID_HOGAR" varchar(1000) NULL,
"TIPO_DOCUMENTO" varchar(1000) NULL,
"DOCUMENTO" varchar(1000) NULL,
"PRIMERNOMBRE" varchar(1000) NULL,
"SEGUNDONOMBRE" varchar(1000) NULL,
"PRIMERAPELLIDO" varchar(1000) NULL,
"SEGUNDOAPELLIDO" varchar(1000) NULL,
"FECHANACIMIENTO" varchar(1000) NULL,
"EXPEDICIONDOCUMENTO" varchar(1000) NULL,
"FECHAEXPEDICIONDOCUMENTO" varchar(1000) NULL,
"PERTENENCIAETNICA" varchar(1000) NULL,
"GENERO" varchar(1000) NULL,
"TIPOHECHO" varchar(1000) NULL,
"HECHO" varchar(1000) NULL,
"FECHAOCURRENCIA" varchar(1000) NULL,
"CODDANEMUNICIPIOOCURRENCIA" varchar(1000) NULL,
"ZONAOCURRENCIA" varchar(1000) NULL,
"UBICACIONOCURRENCIA" varchar(1000) NULL,
"PRESUNTOACTOR" varchar(1000) NULL,
"PRESUNTOVICTIMIZANTE" varchar(1000) NULL,
"FECHAREPORTE" varchar(1000) NULL,
"TIPOPOBLACION" varchar(1000) NULL,
"TIPOVICTIMA" varchar(1000) NULL,
"PAIS" varchar(1000) NULL,
"CIUDAD" varchar(1000) NULL,
"CODDANEMUNICIPIORESIDENCIA" varchar(1000) NULL,
"ZONARESIDENCIA" varchar(1000) NULL,
"UBICACIONRESIDENCIA" varchar(1000) NULL,
"DIRECCION" varchar(1000) NULL,
"NUMTELEFONOFIJO" varchar(1000) NULL,
"NUMTELEFONOCELULAR" varchar(1000) NULL,
"EMAIL" varchar(1000) NULL,
"FECHAVALORACION" varchar(1000) NULL,
"ESTADOVICTIMA" varchar(1000) NULL,
"NOMBRECOMPLETO" varchar(1000) NULL,
"IDSINIESTRO" varchar(1000) NULL,
"IDMIJEFE" varchar(1000) NULL,
"TIPODESPLAZAMIENTO" varchar(1000) NULL,
"REGISTRADURIA" varchar(1000) NULL,
"VIGENCIADOCUMENTO" varchar(1000) NULL,
"CONSPERSONA" varchar(1000) NULL,
"RELACION" varchar(1000) NULL,
"CODDANEDECLARACION" varchar(1000) NULL,
"CODDANELLEGADA" varchar(1000) NULL,
"CODIGOHECHO" varchar(1000) NULL,
"DISCAPACIDAD" varchar(1000) NULL,
"DESCRIPCIONDISCAPACIDAD" varchar(2000) NULL,
"FUD_FICHA" varchar(1000) NULL,
"AFECTACIONES" varchar(2000) NULL
);

--Indices para las siguiente columnas

CREATE INDEX idx_ruv_victimas_temp_persona 
ON public.ruv_victimas_temp ("ID_PERSONA");

CREATE INDEX idx_ruv_victimas_temp_hogar 
ON public.ruv_victimas_temp ("ID_HOGAR");

CREATE INDEX idx_ruv_victimas_temp_siniestro 
ON public.ruv_victimas_temp ("IDSINIESTRO");



CREATE TABLE IF NOT EXISTS public.ruv_victimas (
"ID" SERIAL PRIMARY KEY,
"ORIGEN" varchar(4000) NULL,
"FUENTE" varchar(4000) NULL,
"PROGRAMA" varchar(1000) NULL,
"ID_PERSONA" varchar(2000) NULL ,
"ID_HOGAR" varchar(1000) NULL ,
"TIPO_DOCUMENTO" varchar(1000) NULL,
"DOCUMENTO" varchar(1000) NULL,
"PRIMERNOMBRE" varchar(1000) NULL,
"SEGUNDONOMBRE" varchar(1000) NULL,
"PRIMERAPELLIDO" varchar(1000) NULL,
"SEGUNDOAPELLIDO" varchar(1000) NULL,
"FECHANACIMIENTO" varchar(1000) NULL,
"EXPEDICIONDOCUMENTO" varchar(1000) NULL,
"FECHAEXPEDICIONDOCUMENTO" varchar(1000) NULL,
"PERTENENCIAETNICA" varchar(1000) NULL,
"GENERO" varchar(1000) NULL,
"TIPOHECHO" varchar(1000) NULL,
"HECHO" varchar(1000) NULL,
"FECHAOCURRENCIA" varchar(1000) NULL,
"CODDANEMUNICIPIOOCURRENCIA" varchar(1000) NULL,
"ZONAOCURRENCIA" varchar(1000) NULL,
"UBICACIONOCURRENCIA" varchar(1000) NULL,
"PRESUNTOACTOR" varchar(1000) NULL,
"PRESUNTOVICTIMIZANTE" varchar(1000) NULL,
"FECHAREPORTE" varchar(1000) NULL,
"TIPOPOBLACION" varchar(1000) NULL,
"TIPOVICTIMA" varchar(1000) NULL,
"PAIS" varchar(1000) NULL,
"CIUDAD" varchar(1000) NULL,
"CODDANEMUNICIPIORESIDENCIA" varchar(1000) NULL,
"ZONARESIDENCIA" varchar(1000) NULL,
"UBICACIONRESIDENCIA" varchar(1000) NULL,
"DIRECCION" varchar(1000) NULL,
"NUMTELEFONOFIJO" varchar(1000) NULL,
"NUMTELEFONOCELULAR" varchar(1000) NULL,
"EMAIL" varchar(1000) NULL,
"FECHAVALORACION" varchar(1000) NULL,
"ESTADOVICTIMA" varchar(1000) NULL,
"NOMBRECOMPLETO" varchar(1000) NULL,
"IDSINIESTRO" varchar(1000) NULL ,
"IDMIJEFE" varchar(1000) NULL,
"TIPODESPLAZAMIENTO" varchar(1000) NULL,
"REGISTRADURIA" varchar(1000) NULL,
"VIGENCIADOCUMENTO" varchar(1000) NULL,
"CONSPERSONA" varchar(1000) NULL,
"RELACION" varchar(1000) NULL,
"CODDANEDECLARACION" varchar(1000) NULL,
"CODDANELLEGADA" varchar(1000) NULL,
"CODIGOHECHO" varchar(1000) NULL,
"DISCAPACIDAD" varchar(1000) NULL,
"DESCRIPCIONDISCAPACIDAD" varchar(2000) NULL,
"FUD_FICHA" varchar(1000) NULL,
"AFECTACIONES" varchar(2000) NULL
);

--Indices para las siguiente columnas

CREATE INDEX idx_ruv_victimas_persona 
ON public.ruv_victimas ("ID_PERSONA");

CREATE INDEX idx_ruv_victimas_hogar 
ON public.ruv_victimas ("ID_HOGAR");

CREATE INDEX idx_ruv_victimas 
ON public.ruv_victimas ("IDSINIESTRO");

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);


CREATE TABLE IF NOT EXISTS public.tickets (
    "ID" INT4 DEFAULT nextval('tags_id_seq'::regclass) NOT NULL,
    "ID_TICKET" BIGINT NOT NULL,
    "TITULO" VARCHAR NOT NULL,
    "CONTENIDO" VARCHAR NOT NULL,
    "PALABRAS_CLAVES" VARCHAR NOT NULL,
    "NUMERO_DOCUMENTO" VARCHAR NOT NULL,
    "ID_USUARIO" INT4 NOT NULL,
    "FECHA_HORA" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    CONSTRAINT TAGS_PK PRIMARY KEY ("ID")
);




--Linea de arencion sena

INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (91,'Amazonas','Leticia','cycanas@sena.edu.co','Calle 12 No. 10 – 60 Centro','7:30 a.m. a 12:00 m. y 2:00 p.m. a 6:00 p.m.
','5927626/7966 Ext: 85810/845
','Despacho Dirección'),
	 (91,'Amazonas','Leticia','cycanas@sena.edu.co','Carretera Vía Leticia Tarapaca Km 1.3','7:30 a.m. a 12:00 m. y 2:00 p.m. a 6:00 p.m.','5927966 / 5927626','Centro para la Biodiversidad y el Turismo del Amazonas'),
	 (5,'Antioquia','Medellìn','jogiral@sena.edu.co','Calle 51 No. 57 - 70','','42007 - 42327','Despacho Dirección'),
	 (5,'Antioquia','Caldas ','farleyc@sena.edu.co','Km 6 Vía a la Pintada Caldas Antioquia','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','8410997','Centro de los Recursos Naturales Renovables - La Salada'),
	 (5,'Antioquia','Itaguí','hgomez@sena.edu.co','Cl.63  58B-03  Itagui-Calatrava','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','43211','Centro del Diseño y Manufactura del Cuero'),
	 (5,'Antioquia','Itaguí','','Cl.63  58B-03  Itagui-Calatrava','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','43209','Centro de Formación en Diseño, Confección y Moda'),
	 (5,'Antioquia','Medellín','elquintero@sena.edu.co','Diag.104  69-120 El pedregal','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','43305','Centro para el Desarrollo del Hábitat y la Construcción'),
	 (5,'Antioquia','Medellin','gvasquezm@sena.edu.co','Diag.104  69-120 El pedregal','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','43306','Centro de Tecnología de la Manufactura Avanzada'),
	 (5,'Antioquia','Itaguí','sduarte@sena.edu.co','Cl.63  58B-03  Itagui-Calatrava','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','43104 - 43101','Centro Tecnológico del Mobiliario'),
	 (5,'Antioquia','Medellín','ecoronado@sena.edu.co','Diag.104  69-120 El pedregal','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','43620','Centro Textil y de Gestión Industrial');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (5,'Antioquia','Medellín','omonroy@sena.edu.co','Calle 51 No. 57 – 70 Torre Sur Piso 5','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','42021 - 42012','Centro de Comercio'),
	 (5,'Antioquia','Medellín','','Calle 51 No. 57 – 70 Torre Sur','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','','Centro de Servicios de Salud'),
	 (5,'Antioquia','Medellín','jhvelez@sena.edu.co','Calle 51 No. 57 – 70 Torre Norte','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','42010','Centro de Servicios y Gestión Empresarial '),
	 (5,'Antioquia','Caucasia','atejada@sena.edu.co','Transversal 16 calle 33 No. 102','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','','Complejo Tecnológico para la Gestión Agroempresarial'),
	 (5,'Antioquia','Puerto Berrío ','','Calle 50 Vía La Malena','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','43751','Complejo Tecnológico Minero Agroempresarial '),
	 (5,'Antioquia','Rionegro','','Carrera 1 No. 28-71','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','44100','Centro de la Innovación, la Agroindustria y la Aviación'),
	 (5,'Antioquia','Apartadó','hvelezc@sena.edu.co','Kilometro 1 Salida Turbo','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','44235 - 44200','Complejo Tecnológico Agroindustrial, Pecuario y Turístico'),
	 (5,'Antioquia','Santafé de Antioquia','ofzambrano@sena.edu.co','Calle 11 Nro. 12-42','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','43060','Complejo Tecnológico, Turístico y Agroindustrial del Occidente Antioqueño'),
	 (5,'Antioquia','El Bagre','jjimenez@sena.edu.co ','El Bagre - Municipio El Bagre en el sector conocido como los Comodatos de Arriba','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','45126','Centro de Formación Minero Ambiental'),
	 (81,'Arauca','Arauca','mahernandezt@sena.edu.co','Carrera 20 No.28-163','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','74230 - 74245','Despacho Dirección');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (81,'Arauca','Arauca','mahernandezt@sena.edu.co','Carrera 20 No.28-163','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','74230 - 74245','Centro de Gestión y Desarrollo Agroindustrial de Arauca'),
	 (8,'Atlántico','Barranquilla','','Carrera 43  42-40 Piso 11','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52001','Despacho Dirección'),
	 (8,'Atlántico','Sabanalarga','mnflorezro@sena.edu.co','Calle 9  19-120 ','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52002','Centro para el Desarrollo Agroecologico y Agroindustrial'),
	 (8,'Atlántico','Barranquilla','Dedeltoror@sena.edu.co','Calle 30  3E-164','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52200','Centro Nacional Colombo Alemán'),
	 (8,'Atlántico','Barranquilla','hestarita@sena.edu.co','Calle 30  3E-164','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52202','Centro Industrial y de Aviación  '),
	 (8,'Atlántico','Barranquilla','','Carrera 43  42-40 Piso 10','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52000','Centro de Comercio y Servicios'),
	 (13,'Bolívar','Cartagena','','Ternera Km 1 Vía Turbaco ','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52450 - 52514','Despacho Dirección'),
	 (13,'Bolívar','Cartagena','storres@sena.edu.co','Ternera Km 1 Vía Turbaco','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52452','Centro Agroempresarial y Minero'),
	 (13,'Bolívar','Cartagena ','rplatac@sena.edu.co','Carretera Mamonal Km 5','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52700','Centro Internacional Náutico, Fluvial y Portuario'),
	 (13,'Bolívar','Cartagena','jrodriguezr@sena.edu.co','Avenida Pedro de Heredia, Sector Tesca','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52800 - 52816','Centro para la Industria Petroquímica');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (13,'Bolívar','Cartagena','','Ternera Km 1 Vía Turbaco','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52451','Centro de Comercio y Servicios'),
	 (15,'Boyacá','Sogamoso','','Carrera 12  55 A – 51','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','82100','Despacho Dirección'),
	 (15,'Boyacá','Duitama','eramirezc@sena.edu.co','Kilómetro 1 Vía Duitama - Pantano de Vargas','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','82350','Centro de Desarrollo Agropecuario y Agroindustrial '),
	 (15,'Boyacá','Puerto Boyacá','kgonzalezm@sena.edu.co','','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','','Centro de la Innovación Agroindustrial y de Servicios'),
	 (15,'Boyacá','Sogamoso','hdimate@sena.edu.co','Veredá Morcá','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','82451','Centro Minero'),
	 (15,'Boyacá','Tunja','cperezz@sena.edu.co','Calle 19  12-29','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','82554','Centro de Gestión Administrativa y Fortalecimiento Empresarial '),
	 (15,'Boyacá','Sogamoso','cabarrerac@sena.edu.co','Carrera 12  55 A – 51','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','82103','Centro Industrial de Mantenimiento y Manufactura'),
	 (17,'Caldas','Manizales','omaldonadom@sena.edu.co','Kilómetro 10 Vía al Magdalena','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','62000','Despacho Dirección'),
	 (17,'Caldas','Manizales','caospina@sena.edu.co','Kilómetro 10 Vía al Magdalena','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','62052','Centro para la Formación Cafetera'),
	 (17,'Caldas','Manizales','jcrugeo@sena.edu.co','Kilómetro 10 Vía al Magdalena','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','62008','Centro de Automatización Industrial');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (17,'Caldas','Manizales','','Kilómetro 10 Vía al Magdalena','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','62011','Centro de Procesos Industriales y Construcción'),
	 (17,'Caldas','Manizales','farciniegas@sena.edu.co','Kilómetro 10 Vía al Magdalena','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','62005','Centro de Comercio y Servicios'),
	 (17,'Caldas','La Dorada','aramirezg@sena.edu.co','Calle 41 Carrera 1ª.','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','82850','Centro Pecuario y Agroempresarial'),
	 (18,'Caquetá','Florencia','llozadao@sena.edu.co','Kilómetro 3 Vía Aeropuerto','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','82950','Despacho Dirección'),
	 (18,'Caquetá','Florencia','llozadao@sena.edu.co','Kilómetro 3 Vía Aeropuerto','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','82950','Centro Tecnológico de la Amazonia'),
	 (85,'Casanare','Yopal','','Carrera 19 No. 36-68','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','84750','Despacho Dirección'),
	 (85,'Casanare','Yopal','','Carrera 19 No. 36-68','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','84750','Centro Agroindustrial y Fortalecimiento Empresarial de Casanare'),
	 (19,'Cauca','Popayán','eevargasv@sena.edu.co','Calle 4  2-80','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','22033 - 22440','Despacho Dirección'),
	 (19,'Cauca','Popayán','dmontufarb@sena.edu.co','Carrera 9N  71N-60 Sede Alto Cauca','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','22112','Centro Agropecuario '),
	 (19,'Cauca','Popayán','sflopez@sena.edu.co','Carrera 9N  71N-60 Sede Alto Cauca','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','22115','Centro de Teleinformática y Producción Industrial ');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (19,'Cauca','Popayán','hmorales@sena.edu.co','Calle 4  2-80','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','22408','Centro de Comercio y Servicios'),
	 (20,'Cesar','Valledupar','ezapata@sena.edu.co','Kra 19 calles 15 y 15','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52902','Despacho Dirección'),
	 (20,'Cesar','Valledupar','jbaute@sena.edu.co','Km. 7 Vía a La Paz','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52956','Centro Biotecnológico del Caribe'),
	 (20,'Cesar','Aguachica','scaselleso@sena.edu.co','Km 1 Vía Bucaramanga','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','53269','Centro Agroempresarial'),
	 (20,'Cesar','Valledupar','','Kra 19 calles 15 y 15','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','52900','Centro de Innovación y de Gestión Empresarial y Cultural'),
	 (27,'Chocó','Quibdo','jcardonad@sena.edu.co','Carrera 1 No. 28-71','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','44400','Despacho Dirección'),
	 (27,'Chocó','Quibdo','jcardonad@sena.edu.co','Carrera 1 No. 28-71','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','44400','Centro de Recursos Naturales, Industria y Biodiversidad'),
	 (23,'Córdoba','Montería','cgenes@sena.edu.co','Avenida circunvalar calle 24 y 27','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','53350','Despacho Dirección'),
	 (23,'Córdoba','Montería','hpaternina@sena.edu.co ','k. 45 corregimiento Santa Isabel vía Tierralta','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','44350','Centro Agropecuario y de Biotecnología el Porvenir'),
	 (23,'Córdoba','Montería','jrestrepo@sena.edu.co','Avenida circunvalar calle 24 y 27','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','53352','Centro de Comercio, Industria y Turismo de Córdoba');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (25,'Cundinamarca','Bogotá','jrjimenezr@sena.edu.co','Diagonal 45D No. 19 – 72','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','17154','Despacho Dirección'),
	 (25,'Cundinamarca','Soacha','aceliscas@sena.edu.co','Clle 13 No. 10 -60','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','18000','Centro Industrial y de Desarrollo Empresarial de Soacha'),
	 (25,'Cundinamarca','Villeta','davilac@sena.edu.co','Calle 2 No. 13 – 03 Barrio San Rafael','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','17350','Centro de Desarrollo Agroindustrial y Empresarial'),
	 (25,'Cundinamarca','Fusagasuga','maperez@sena.edu.co','Avenida Manuel Humberto Cardenas calle 16','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','17552','Centro Agroecológico y Empresarial '),
	 (25,'Cundinamarca','Girardot','ljpradap@sena.edu.co','Cra. 10 No. 30 – 04','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','17704','Centro de la Tecnología de Diseño y la Productividad Empresarial'),
	 (25,'Cundinamarca','Mosquera','','Kilometro 7 Vía Mosquera','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','17850','Centro de Biotecnología Agropecuaria'),
	 (25,'Cundinamarca','Chia','jrjimenezr@sena.edu.co','Vereda Bojacá Carrera 11 Sector el Darien Lote 1 Chia','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','18051','Centro de Desarrollo Agroempresarial '),
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Central Piso 8','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12085 - 12362','Despacho Dirección'),
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Norte Piso 4','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12037','Oficina de Control Interno'),
	 (1,'Dirección General','Bogotá','','Calle 54 No. 10 - 39','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12934','Oficina de Control Interno Disciplinario');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Norte Piso 8','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12026','Oficina de Comunicaciones '),
	 (1,'Dirección General','Bogotá','pfarciniegas@sena.edu.co','Calle 57 No. 8 - 69 Torre Central Piso 3','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12024','Oficina de Sistemas'),
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Central Piso 2','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12506','Dirección Jurídica'),
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Sur Piso 3','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','13057','Secretaría General'),
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Central Piso 5','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12017','Dirección de Planeación y Direccionamiento Corporativo'),
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Sur Piso 8','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12158','Dirección Administrativa y Financiera'),
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Norte Piso 7','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12080','Dirección de Empleo y Trabajo'),
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Sur - Mezzanine','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12088','Dirección de Formación Profesional'),
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Central Piso 7','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12081','Dirección del Sistema Nacional de Formación para el Trabajo'),
	 (1,'Dirección General','Bogotá','','Calle 57 No. 8 - 69 Torre Norte Piso 2','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','12012','Dirección de Promoción y Relaciones Corporativas');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (11,'Distrito Capital','Bogotá','gamedina@sena.edu.co','Carrera 13 No 65-10','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','14508','Despacho Dirección'),
	 (11,'Distrito Capital','Bogotá','','Autopista Sur, Carrera 4 # 53-54 - Zona industrial Cazucá','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','14753','Centro de Tecnologías para la Construcción y la Madera'),
	 (11,'Distrito Capital','Bogotá','prodriguezs@sena.edu.co','Avenida 30 No 17B-25 Sur','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','14914','Centro de Electricidad, Electrónica y Telecomunicaciones'),
	 (11,'Distrito Capital','Bogotá','moandrade@sena.edu.co','Carrera 31 No 14-20','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','15554','Centro de Gestión Industrial'),
	 (11,'Distrito Capital','Bogotá','cygomez@sena.edu.co','Avenida 30 No 17B-25 Sur','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','14916','Centro de Manufactura en Textil y Cuero'),
	 (11,'Distrito Capital','Bogotá','dcristanchoc@sena.edu.co','Autopista Sur, Carrera 4 # 53-54 - Zona industrial Cazucá','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','18501','Centro de Tecnologías del Transporte'),
	 (11,'Distrito Capital','Bogotá','alaraa@sena.edu.co','Avenida 30 No 17B-25 Sur','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','14912','Centro Metalmecánico'),
	 (11,'Distrito Capital','Bogotá','rdmontoyaz@sena.edu.co','Avenida 30 No 17B-25 Sur','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','14910','Centro de Materiales y Ensayos'),
	 (11,'Distrito Capital','Bogotá','jrperezc@sena.edu.co','Carrera 31 No 14-20','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','15458','Centro de Diseño y Metrología'),
	 (11,'Distrito Capital','Bogotá','rrmelo@sena.edu.co','Carrera 31 No 14-20','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','15463','Centro para la Industria de la Comunicación Gráfica');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (11,'Distrito Capital','Bogotá','miparrap@sena.edu.co','Calle 52 No 13-65','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','16900','Centro de Gestión de Mercados, Logística y Tecnologías de la Información'),
	 (11,'Distrito Capital','Bogotá','csalgar@sena.edu.co','Carrera 6 No. 45 - 52','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','15852','Centro de Formación de Talento Humano en Salud'),
	 (11,'Distrito Capital','Bogotá','vgomezv@sena.edu.co ','Avenida Carracas No 13-65','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','16000','Centro de Gestión Administrativa'),
	 (11,'Distrito Capital','Bogotá','eacevedos@sena.edu.co','Carrera 13 No 65-10','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','14510','Centro de Servicios Financieros'),
	 (11,'Distrito Capital','Bogotá','cgamba@sena.edu.co ','Carrera 31 No 14-20','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','15555','Centro Nacional de Hotelería, Turismo y Alimentos'),
	 (11,'Distrito Capital','Bogotá','kgonzalezm@sena.edu.co','Transversal 79 No 41D-15 Sur Kennedy','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','16552','Centro de Formación en Actividad Física y Cultura'),
	 (94,'Guainía','Inírida','jorojasb@sena.edu.co','Transversal 6ª No 29ª 03 Vía al Coco','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','85264 - 85258','Despacho Dirección'),
	 (94,'Guainía','Inírida','jorojasb@sena.edu.co','Transversal 6ª No 29ª 03 Vía al Coco','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','85264 - 85258','Centro Ambiental y Ecoturístico del Nororiente Amazónico'),
	 (44,'Guajira','Riohacha','','Calle 21 Avenida Aeropuerto Esquina','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','53550','Despacho Dirección'),
	 (44,'Guajira','Riohacha','','Calle 21 Avenida Aeropuerto Esquina','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','53551','Centro Industrial y de Energías Alternativas');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (44,'Guajira','Fonseca','jdazaa@sena.edu.co ','Km 1 Vía Barrancas','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','53800','Centro Agroempresarial y Acuícola'),
	 (95,'Guaviare','San José','gacostar@sena.edu.co','Cra.  24 7 - 10','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','85300','Despacho Dirección'),
	 (95,'Guaviare','San José','gacostar@sena.edu.co','Cra. 24 7 - 10','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','85300','Centro de Desarrollo Agroindustrial, Turístico y Tecnológico del Guaviare'),
	 (41,'Huila','Neiva','agasca@sena.edu.co','Carrera 5 No 16-16','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','83200','Despacho Dirección'),
	 (41,'Huila','Campoalegre','gmsanchez@sena.edu.co ','Km. 40 via Campoalegre','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','83567','Centro de Formación Agroindustrial'),
	 (41,'Huila','Garzón','cajimenezm@sena.edu.co ','Carrera 10 No 11-22','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','83600','Centro Agroempresarial y Desarrollo Pecuario del Huila'),
	 (41,'Huila','La Plata','hcerquera@sena.edu.co','Carrera 3 No 2-03','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','73714','Centro de Desarrollo Agroempresarial y Turístico del Huila'),
	 (41,'Huila','Neiva','','Calle 66 No. 8-25','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','83350 - 83405','Centro de la Industria, la Empresa y los Servicios '),
	 (41,'Huila','Pitalito','','Carrera 8 No. 7-53','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','83800','Centro de Gestión y Desarrollo Sostenible Surcolombiano'),
	 (47,'Magdalena','Santa Marta','yepesc@sena.edu.co','Calle 29 # 13 - 127 Barrio Bavaria','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','53891','Despacho Dirección');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (47,'Magdalena','Santa Marta','bzableh@sena.edu.co','Kilometro 5 carretera a Gaira','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','54109','Centro Acuícola y Agroindustrial de Gaira'),
	 (47,'Magdalena','Santa Marta','jdelcastillo@sena.edu.co ','Avenida Ferrocarril  27-97','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','53874','Centro de Logística y Promoción Ecoturística del Magdalena'),
	 (50,'Meta','Villavicencio','geoa@sena.edu.co','Km 1 Vía Acacias','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','84002 - 83954','Despacho Dirección'),
	 (50,'Meta','Villavicencio','hruiz@sena.edu.co','Km 17 Via Puerto López','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','84191','Centro Agroindustrial del Meta'),
	 (50,'Meta','Villavicencio','leonc@sena.edu.co','Km 1 Vía Acacias','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','84001','Centro de Industria y Servicios del Meta'),
	 (52,'Nariño','Pasto','bchamorrog@sena.edu.co','Calle 22 No. 11 Este-05. Vía a Oriente','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','72037','Despacho Dirección'),
	 (52,'Nariño','Ipiales','afajardoc@sena.edu.co','Carrera 8 No. 23-117','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','72226','Centro Sur Colombiano de Logística Internacional'),
	 (52,'Nariño','Tumaco','jopolo@sena.edu.co','Calle del Comercio Muelle','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','74452','Centro Agroindustrial y Pesquero de la Costa Pacífica'),
	 (52,'Nariño','Pasto','garellano@sena.edu.co','Calle 22 No. 11 Este-05. Vía a Oriente','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','72046','Centro Internacional de Producción Limpia - Lope'),
	 (54,'Norte de Santander','Cúcuta','cacontreras@sena.edu.co','Calle 2N  Avenidas 4y5 Pescadero','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','72550','Despacho Dirección');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (54,'Norte de Santander','Cúcuta','facalderon@sena.edu.co','Calle 2N  Avenidas 4y5 Pescadero','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','72638','Centro de Formación para el Desarrollo Rural y Minero'),
	 (54,'Norte de Santander','Cúcuta','ogsuarez@sena.edu.co','Calle 2N  Avenidas 4y5 Pescadero','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','72567','Centro de la Industria, la Empresa y los Servicios '),
	 (86,'Putumayo','Puerto Asís','ariascos@sena.edu.co','Cra 23 A No 25-06, B. 20 de Julio','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','84855','Despacho Dirección'),
	 (86,'Putumayo','Puerto Asís','ariascos@sena.edu.co','Cra 23 A No 25-06, B. 20 de Julio','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','84855','Centro Agroforestal y Acuícola Arapaima'),
	 (63,'Quindío','Armenia','hfernandez@sena.edu.co ','Avenida Centenario 42N-02','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','62800','Despacho Dirección'),
	 (63,'Quindío','Armenia','pvanegasl@sena.edu.co','Avenida Centenario 42N-02','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','62801 - 62876','Centro Agroindustrial'),
	 (63,'Quindío','Armenia','avanegasc@sena.edu.co','Avenida Centenario 44N-02','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','62805','Centro para el Desarrollo Tecnológico de la Construcción y la Industria'),
	 (63,'Quindío','Armenia','','Carrera 18 No. 7-58','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','62689','Centro de Comercio y Turismo'),
	 (66,'Risaralda','Pereira','capalacios@sena.edu.co','Cra 8ª 26-79','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','63051','Despacho Dirección'),
	 (66,'Risaralda','Pereira','lamontoya@sena.edu.co','Cra 8ª 26-79','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','63271','Centro Atención Sector Agropecuario');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (66,'Risaralda','D/quebradas','','Transversal 7 Calle 26 Barrio Santa Isabel','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','63361','Centro de Diseño e Innovación Tecnológica Industrial'),
	 (66,'Risaralda','Pereira','','Cra 8ª 26-79','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','63201','Centro de Comercio y Servicios'),
	 (88,'San Andrés','San Andrés','arne.britton@sena.edu.co ','Avenida Francisco Newball','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','85139','Despacho Dirección'),
	 (88,'San Andrés','San Andrés','arne.britton@sena.edu.co ','Avenida Francisco Newball','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','85139','Centro de Formación Turística, Gente de Mar y de Servicios'),
	 (68,'Santander','Bucaramanga','jcarrero@sena.edu.co','Calle 16 No. 27-37','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','73001','Despacho Dirección'),
	 (68,'Santander','Piedecuesta','zcadena@sena.edu.co','Piedecuesta Kl 2 Via Palogordo Vereda Guatiguara','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','73200','Centro Atención Sector Agropecuario'),
	 (68,'Santander','Giron','','Giron Kl 7 Via Rincon de Giron','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','73352','Centro Industrial de Mantenimiento Integral'),
	 (68,'Santander','Floridablanca','joramirez@sena.edu.co','K6 Autopista a Floridablanca n 55-33','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','73550','Centro Industrial del Diseño y la Manufactura'),
	 (68,'Santander','Bucaramanga','wbastos@sena.edu.co','Carrera 27 No. 42 - 68','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','73125','Centro de Servicios Empresariales y Turísticos'),
	 (68,'Santander','Barrancabermeja','enavasr@sena.edu.co','','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','73651','Centro Industrial y del Desarrollo Tecnológico');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (68,'Santander','Sangil','prodriguez@sena.edu.co','Calle 22 No. 9 - 82','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','73886','Centro Agroturístico'),
	 (68,'Santander','Malaga','ygarciar@sena.edu.co','Carrera 11 No. 13-13 Barrio Ricaute','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','74007','Centro Agroempresarial y Turístico de los Andes'),
	 (68,'Santander','Velez','javgonzalez@sena.edu.co','Calle 8 No. 2 Este Par Av. Las Cuadras','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','74100','Centro de Gestión Agroempresarial del Oriente'),
	 (70,'Sucre','Sincelejo','jamanjarresm@sena.edu.co','Calle 25B No 31-260','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','54201','Despacho Dirección'),
	 (70,'Sucre','Sincelejo','jamanjarresm@sena.edu.co','Calle 25B No 31-260','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','24201','Centro de la Innovación, la Tecnología y los Servicios'),
	 (73,'Tolima','Ibagué','mayalaj@sena.edu.co','Transversal 1ª No. 42-44','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','84256','Despacho Dirección'),
	 (73,'Tolima','Espinal ','jsotod@sena.edu.co','Kilómetro 5 Vía Espinal ','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','84650','Centro Agropecuario la Granja'),
	 (73,'Tolima','Ibagué','amontealegrer@sena.edu.co','Carrera  45 sur  No. 141-05 Sector Picaleña, contiguo a la Casa de la Moneda ','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','86050','Centro de Industria y Construcción'),
	 (73,'Tolima','Ibagué','','Transversal 1ª No. 42-44','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','84257','Centro de Comercio y Servicios'),
	 (76,'Valle','Cali','','Calle 52 No. 2 Bis 15','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','22760','Despacho Dirección');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (76,'Valle','Buga','amartinezva@sena.edu.co','Carretera Central Variante Buga - Tulúa','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','23295','Centro Agropecuario de Buga'),
	 (76,'Valle','Tulúa','dfbolanos@sena.edu.co','Carretera Central a Tulúa Kilómetro 2','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','23850','Centro Latinoamericano de Especies Menores'),
	 (76,'Valle','Buenaventura','','Avenida Simón Bolivar Kilómetro 5','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','23400','Centro Náutico Pesquero de Buenaventura'),
	 (76,'Valle','Cali','fcmontenegro@sena.edu.co','Calle 52 No. 2 Bis 15','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','22814','Centro de Electricidad y Automatización Industrial -CEAI'),
	 (76,'Valle','Cali','beatriz.cobo@sena.edu.co','Calle 34 No. 17 B 23','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','23529','Centro de la Construcción'),
	 (76,'Valle','Cali','','Calle 72K  No. 26 J - 97 El Pondaje ','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','22718','Centro de Diseño Tecnológico Industrial'),
	 (76,'Valle','Cali','cpereac@sena.edu.co','Calle 52 No. 2 Bis 15','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','22721','Centro Nacional de Asistencia Técnica a la Industria -ASTIN'),
	 (76,'Valle','Cali','','Calle 52 No. 2 Bis 15','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','22645','Centro de Gestión Tecnológica de Servicios'),
	 (76,'Valle','Cartago','mmgiraldoa@sena.edu.co','Carrera 9 No. 12 -141','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','23601','Centro de Tecnologías Agroindustriales'),
	 (76,'Valle','Palmira','svgarcia@sena.edu.co','Carrera 30 No 40 - 25','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','23738','Centro de Biotecnología Industrial');
INSERT INTO public."LINEA_ATENCION_SENA" (cod_regional,departamento,ciudad,contacto,direccion,horario_atencion,telefono,nombre_centro) VALUES
	 (97,'Vaupés','Mitu','jhagudelor@sena.edu.co','Avenida 15 No. 6 - 176 Barrio San José','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','85400','Despacho Dirección'),
	 (97,'Vaupés','Mitu','jhagudelor@sena.edu.co','Avenida 15 No. 6 - 176 Barrio San José','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','85400','Centro Agropecuario y de Servicios Ambientales "Jiri-jirimo"'),
	 (99,'Vichada','Puerto  Carreño','fbarreroc@sena.edu.co','Cra 10 Nº 15 – 71 Barrio la Primavera','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','85476','Despacho Dirección'),
	 (99,'Vichada','Puerto  Carreño','fbarreroc@sena.edu.co','Cra 10 Nº 15 – 71 Barrio la Primavera','7:00 a.m. a 12:00 m. y 1:00 p.m. a 6:00 p.m.
','85476','Centro de Producción y Transformación Agroindustrial de la Orinoquia');




--Linea de atencion ape

INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('La Guajira','Riohacha','agomezp@sena.edu.co, ebherrera@sena.edu.co, efreyle.@sena.edu.co','Riohacha Calle 21 con carrera 15 Av. Aeropuerto. Por coyuntura COVID - 19 se está brindando el servicio de manera virtual','Lunes a viernes 7:30 a.m. a 12:00 m. 2:00 p.m. a 6:00 p.m.',NULL),
	 ('La Guajira','Fonseca','efreile@misena.edu.co','Centro Agroempresarial y Acuícola Km. 1 salida a Barranca','Lunes a viernes 7:30 a.m. a 12:00 m. 2:00 p.m. a 6:00 p.m.',NULL),
	 ('La Guajira','Maicao','Inyocare9@hotmail.com','Centro Industrial y de Energías Alternativa, salidas calle 16 No. 44-46','Lunes a viernes 7:30 a.m. a 12:00 m. 2:00 p.m. a 6:00 pm',NULL),
	 ('Magdalena','Santa Marta','ape.magdalena@sena.edu.co','Avenida del Ferrocarril No. 27 - 97','Lunes a viernes de 8:00 a.m. - 12 m. y 2:00 p.m. - 6:00 p.m.',NULL),
	 ('Cesar','Valledupar','ypinto@sena.edu.co, dfgnecco@sena.edu.co, gmgarcia@sena.edu.co, jucastrom@sena.edu.co, ceherrera@sena.edu.co','Carrera 19 entre calles 14 y 15','Lunes a viernes 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 6:00 p.m.',NULL),
	 ('Cesar','Aguachica','lriojasq@sena.edu.co','Carretera al mar, vía Bucaramanga','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 6:00 p.m.',NULL),
	 ('Cesar','La Jagua de Ibirico','adiazc@sena.edu.co','Transversal 6 # 4 - 105','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.',NULL),
	 ('Cesar','Chiriguaná','mimejiap@sena.edu.co','Barrio El Senado.','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.',NULL),
	 ('Cesar','Curumaní','plgil@sena.edu.co','Calle 4 No. 20-33 Barrio Camilo Torres.','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.',NULL),
	 ('Cesar','Bosconia','mahincapie@sena.edu.co',' Carrera 14A No. 20 - 04','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.',NULL);
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Atlántico','Barranquilla',' apeatlantico@sena.edu.co','Carrera 43 No. 42-40. ','Lunes a viernes de 8:00 a.m. - 12:00 m. y 2:00 p.m. - 5:00 p.m.','O18000910270'),
	 ('Atlántico','Sabanalarga','apeatlantico@sena.edu.co','Calle 9 No. 19-120. ','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 4:00 p.m.','O18000910270'),
	 ('Atlántico','Barranquilla','apeatlantico@sena.edu.co','Calle 30 No. 3E-164. Centro Industrial','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 4:00 p.m.','O18000910270'),
	 ('Bolívar','Cartagena','apebolivar@sena.edu.co','Ternera Km 1 Vía Turbaco, Cartagena Centro Multisectorial Ternera','Lunes a viernes de 8:00 a.m. - 12:00 p.m. 1:30 p.m. - 5:30 p.m.','(5) 6539040 - Ext. 52467 '),
	 ('Bolívar','Mamonal','apebolivar@sena.edu.co','Km 5, Vía a Mamonal','Lunes a Viernes de 7:15 a.m. - 12:15 m. y 1:30 p.m. - 4:15 p.m.','(5) 6539040 - 6685519 Ext. 52711'),
	 ('Bolívar','Cartagena','apebolivar@sena.edu.co','Avenida Pedro de Heredia, Sector Tesca los 4 vientos, Centro Para la Industria Petroquímica','Lunes a Viernes de 8:00 a.m. - 12:00 m. 1:30 p.m. - 5:30 p.m.','(5) 6539040 - Ext. 52571'),
	 ('Bolívar','Mompox','apebolivar@sena.edu.co','Casa Cabildo','Lunes a Viernes de 8:00 a.m. - 12:30 m. 2:00 p.m. - 5:30 p.m.','(5) 6539040 IP 54704'),
	 ('Sucre','Sincelejo','camartinezr@sena.edu.co','Sede Boston, Calle 25B No. 31-260, Avenida Mariscal. ','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 6:00 p.m.','(5) 2804016'),
	 ('Córdoba','Montería','yhumanez@sena.edu.co; mcguerra@sena.edu.co; dzmoreno@sena.edu.co; amarquezh@sena.edu.co','Calles 24 y 27 con Avenida Circunvalar. ','Lunes a viernes 7:30 a.m. a 12:00 m. y de  2:00 p.m. a 6:00 p.m.',NULL),
	 ('Córdoba','Montelíbano','mjcalao@sena.edu.co','Carrera 23 -176, Cl. 25 #232','Lunes a viernes 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 6:00 p.m','3218774597');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Antioquia','Medellín','speantioquia@sena.edu.co','Calle 51 No. 57-70','Lunes a viernes 7:30 a.m. a 12:00 m. y de 1:00 p.m. a 4:30 p.m.',NULL),
	 ('Antioquia','Apartadó','hbarrientost@sena.edu.co','Centro Multisectorial de Urabá, Kilómetro 1 Salida Turbo','Lunes a Viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 6:00 p.m.',NULL),
	 ('Antioquia','Caucasia','apcogollo@sena.edu.co','Transversal 16 No. 33 - 102, Complejo Tecnológico Para La Gestión Agroempresarial (Bajo Cauca)','Lunes a Viernes 8:00 a.m. a 12:00 p.m. 2:00 p.m. a 6:00 p.m.',NULL),
	 ('Antioquia','Itagüí','mtballesteros@sena.edu.co','Calle 63 No. 58 B - 03, Complejo Sur, Sena Calatrava','Lunes a Viernes 7:30 a.m. a 12:00 p.m. 1:00 p.m. a 4:30 p.m.',NULL),
	 ('Antioquia','Rionegro','agiraldoso@sena.edu.co','Carrera 48 No. 49-62, Sector San Francisco, Rionegro','Lunes a viernes 8:00 a.m. a 12:00 m. 1:00 p.m. a 5:00 p.m.',NULL),
	 ('Antioquia','Santa Rosa de Osos','apalvarezp@sena.edu.co','Calle 29 No. 25-27','Lunes a viernes 8:00 a.m. a 12:30 m. 2:00 p.m. a 6:00 p.m.',NULL),
	 ('Antioquia','Santa Fé de Antioquia','jcano@sena.edu.co','Calle 11 No. 12-42, Complejo Tecnológico Turístico y Agroindustrial Del Occidente Antioqueño','Lunes a viernes 7:30 a.m. a 12:00 m. 2:00 p.m. a 5:30 p.m.',NULL),
	 ('Antioquia','Medellín Pedregal','pscastano@sena.edu.co','Complejo Norte SENA, Diagonal 104 #69 - 120','Lunes a viernes 7:30 a.m. a 12:00 m. y de 1:00 p.m. a 4:30 p.m.',NULL),
	 ('Antioquia','Caldas, La Salada','alrestrepoo@sena.edu.co','Centro de los Recursos Renovables, Km. 6 Vía la Pintada Caldas','Lunes a viernes 7:00 a.m. a 12:00 m. de 2:00 p.m. a 4:30 p.m.',NULL),
	 ('Antioquia','Puerto Berrío','smurrego@sena.edu.co','Calle 43 No. 20 - 137 Barrio la Malena - Puerto Berrío Complejo Tecnológico Minero Agroempresarial','Lunes a viernes 7:00 a.m. a 12:00 m. y de 2:00 p.m. a 6:00 p.m.',NULL);
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Antioquia','Marinilla','servicioempleo@marinilla-antioquia.gov.co','Calle 30 No. 30 - 13 Municipio de Marinilla Antioquia','Lunes a Jueves de 7:30 am a 12m y de 1:30 a 6:00 p.m. / Viernes de 7:30 a.m. a 12 p.m. y de 1:30 p.m. a 5:00 p.m.',NULL),
	 ('Norte de Santander','Cúcuta','apenortedesantander@sena.edu.co ','Calle 2N Avenida 5 Esquina Barrio Pescadero','Lunes a viernes 8:00 a.m. a 12:00 a.m. 2:00 p.m. a 6:00 p.m.','5829990 Ext. 75702'),
	 ('Norte de Santander','Ocaña','apenortedesantander@sena.edu.co ','Calle 12 No. 10-40 Barrio El Tamaco','8:00 a.m. a 12:00 m. y de 2:00 p.m. a 6:00 p.m.','5829990 Ext. 72549'),
	 ('Norte de Santander','Pamplona','apenortedesantander@sena.edu.co','Carrera 5 No. 4 - 18, Casa de las Cajas Reales','Lunes a Viernes de 7:30 a.m. - 12:00 m. y  2:00 p.m. - 6:00 p.m.','5829990 Ext. 72850'),
	 ('Norte de Santander','Cúcuta','apenortedesantander@sena.edu.co','Calle 11 No.5-49 Piso 1 Palacio Municipal','Lunes a Viernes de 8:00 a.m. a 11:00 a.m. y de 2:30 p.m. 5:00 p.m.','5829990 Ext. 72772'),
	 ('Santander','Bucaramanga, oficina principal','apesantander@sena.edu.co','Carrera 27 # 15-07, Primer piso, Bucaramanga ','Lunes a viernes de 8:00 a.m. - 12:00 m. y 2:00 p.m. - 5:00 p.m.','6076468036'),
	 ('Santander','San Gil','vepedrazap@sena.edu.co','Calle 22 N°9-82 Centro Agroturístico','Lunes a viernes de 7:30 a.m. - 12:00 m. y 2:00 p.m. - 6:00 p.m.','6076468036 Ext.73889'),
	 ('Santander','Vélez','nquirogas@sena.edu.co','Centro De Gestión Agroempresarial Del Oriente, Transversal 8 No. 8a-50','Lunes a Viernes de 7:00 a.m. - 12:30 m. y 2:00 p.m. - 5:00 p.m.','6076468036 Ext 74109'),
	 ('Santander','Málaga','apesantander@sena.edu.co','Centro Agroempresarial y Turístico De Los Andes, carrera 11 Nro. 13-13, Barrio Ricaurte','Lunes a viernes de 8:00 a.m. - 12:00 m. y 2:00 p.m. - 5:00 p.m. ','6076468036'),
	 ('Santander','Barrancabermeja',' apebarrancabermeja@sena.edu.co','Barrancabermeja, Centro Industrial Y Del Desarrollo Tecnológico, Carrera 28 No. 56-10, Barrio Galán','Lunes a viernes de 7:00 a.m. - 11:00 a.m. 2:00 p.m.- 5:30 p.m.','6076468036 Ext 73665 y 73666');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Santander','Rionegro','salonv030@gmail.com ','Carrera 12 N.º 10-23, Barrio Centro,  Alcaldía de Rionegro','Lunes a viernes de 7:30 a.m. - 12:30 m. y  2:00 p.m. - 5:00 p.m.','3106831414'),
	 ('Boyacá','Tunja','apeboy@sena.edu.co','Carrera 9 No. 28-34, Tunja, Barrio Maldonado','Lunes a viernes de 8:00 a.m. - 12:30 P.m. y 2:00 p.m. - 6:00 p.m.',' 7721313'),
	 ('Boyacá','Duitama','apeboy@sena.edu.co','Carrera 18 No. 17 – 30 Oficina 5 Antiguas instalaciones de Terminal de Transportes Duitama','Lunes a viernes de 8:00 a.m. - 12:30 p.m. y 2:00 p.m. - 6:00 p.m.','7721313'),
	 ('Boyacá','Chiquinquirá','apeboy@sena.edu.co','Carrera 8 No. 14-68, Chiquinquirá','Lunes a Viernes de 8:00 a. m. - 12:30 p.m. y 2:00 p.m. - 6:00 p.m.','7721313'),
	 ('Boyacá','Sogamoso','apeboy@sena.edu.co','Carrera 12 No. 55A-51, Centro Multisectorial de Sogamoso','Lunes a Viernes de 7:00 a.m. - 12:00 m. y 1:30 p.m. -  5:00 p.m.','7721313'),
	 ('Boyacá','Garagoa','apeboy@sena.edu.co','Calle 10 No. 9-65, Garagoa','Lunes a Viernes de 8:00 a.m. - 12:30 pm. y 2:00 p.m. - 6:00 p.m.','7721313'),
	 ('Boyacá','Miraflores',' apeboy@sena.edu.co','Carrera 6 No.  3-07, sede ESAP','Lunes a viernes de 8:00 a.m. - 12:30 p.m. y 2:00 p.m. - 6:00 p.m.','7721313'),
	 ('Boyacá','Moniquirá','apeboy@sena.edu.co','Carrera 3 # 16 - 02 SENA Moniquirá','Lunes a viernes de 8:00 a.m. - 12:30 p.m. y 2:00 p.m. - 6:00 p.m.','7721313'),
	 ('Boyacá','Nobsa',' apeboy@sena.edu.co','Carrera  4 con calle 6 51, Centro Empresarial- Nazareth','Lunes a Viernes de 8:00 a.m. - 12:30 p.m. y 2:00 p.m. - 6:00 p.m.','7721313'),
	 ('Boyacá','Paipa','apeboy@sena.edu.co',' Calle 25 # 20-08, Biblioteca Municipal- Primer Piso','Lunes a viernes de 8:00 a 12:30 p.m. y de 2:00 a 6:00 p.m.','7721313');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Cundinamarca','Sede regional','yestradam@sena.edu.co, aysantamariap@sena.edu.co','Diagonal 45 D No. 19 - 72, Bogotá','Lunes a viernes 8:00 a.m. a 5:00 p.m.','5978250 Ext. 17162-17240-17237-17244-17162-17206-17207-17225'),
	 ('Cundinamarca','Chía','mbernalm@sena.edu.co, sgomezh@sena.edu.co','Vereda Bojacá Carrera 11 Sector El Darién Lote 1 Chía  Centro de Desarrollo Agroempresarial','Lunes a viernes 8:00 a.m. a 5:00 p.m.',NULL),
	 ('Cundinamarca','Fusagasugá','agenciadeempleocae@sena.edu.co','Avenida Manuel Humberto Cárdenas Vélez con calle 16','Lunes a Viernes de 8:00 a.m. - 12:00 m. y 2:00 p.m. - 5:00 p.m.','PBX: +(57) 601 5461500 Ext:17596'),
	 ('Cundinamarca','Girardot','alruiz@sena.edu.co, ctique@sena.edu.co, jagarciar@sena.edu.co, cpmolina@sena.edu.co, soviedo@sena.edu.co, akgutierrez@sena.edu.co, jlbocanegra@sena.edu.co','Carrera 10 # 30-04 barrio Magdalena','Lunes a viernes de 8:00 a.m. - 12:30 p.m. y 2:00 p.m. - 5:30 p.m.','5978250 Ext. 18528'),
	 ('Cundinamarca','Guaduas','apeguaduas@gmail.com','Carrera  5 # 12 - 04 Sur, CERES Vía Chaguaní ','Lunes a viernes 08:00 a.m. -12:00 m. y 2:00 p.m. - 5:00 p.m. ','8466144'),
	 ('Cundinamarca','Mosquera','cperilla@sena.edu.co','Centro de Biotecnología Agropecuaria SENA, Km 7,5 Vía Bogotá.','Lunes a viernes de 8:00 a.m. - 1:00 p.m. y 2:00 p.m. - 4:00 p.m.','5462323 Ext. 17879'),
	 ('Cundinamarca','Sibaté','caduquer@sena.edu.co, ncifuentest@sena.edu.co','Subsede La Colonia - Kilómetro 2 Vía Sibaté','Lunes a viernes de 9:00 a.m. - 4:00 p.m.','5461500 Ext. 18014'),
	 ('Cundinamarca','Villeta','apevilleta@sena.edu.co, jevega@sena.edu.co','Calle 2 No 13 - 03 Barrio San Rafael','Lunes a viernes de 8:00 a.m. a 12:30 p.m. y de 2:00 a 6:00 p.m.','5461500 Ext. 17396-17395-17397'),
	 ('Cundinamarca','Gachancipá','desarrolloeconomico@gachancipa-cundinamarca.gov.co','Casa Estación del Tren, Gachancipá Cundinamarca','Lunes a viernes 7:00 a.m. a 12:30 p.m. 1:30 p.m. a 5:00 p.m.','8578146 - 3132962336'),
	 ('Bogotá','Bogotá','spedccalle65@sena.edu.co','Calle 65 # 11 -70 (primer piso) - Oficina principal. Nota: el jueves, 25 de julio 2024, no se brindará atención presencial.  Estará disponible nuestro canal virtual vía correo electrónico: spedccalle65@sena.edu.co.',' Lunes a viernes de  8:00 a.m. a 4:00 p.m., Jornada continua ','5461600');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Caldas','Manizales','aperegionalcaldas@sena.edu.co','Carrera 23 No. 25 - 32, Edificio Esponsión, Piso 3','Lunes a viernes 8:00 a.m. a 12:30 p.m. 2:00 p.m. a 6:00 p.m.','8849290 Ext. 62317'),
	 ('Caldas','La Dorada','aperegionalcaldas@sena.edu.co. ','Centro Pecuario y Agroempresarial de la Dorada, carrera 1 calle 42 esquina Barrio Alfonso Lopez','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 6:00 p.m.',NULL),
	 ('Chocó','Quibdó','jiblandon@sena.edu.co','Carrera 1 No. 28 - 71, Barrio Cristo Rey. ','Lunes a viernes 7:00 a.m. a 6:00 p.m.','604-6723800, Ext. 44423 '),
	 ('Risaralda','Pereira','aperisaralda@sena.edu.co','Carrera 8 No. 26-79, El centro. ','Lunes a viernes 8:00 a.m. a 11:30 a.m. y de 1:00 p.m. a 4:30 p.m.','(606) 349 6220 '),
	 ('Quindío','Armenia','apequindio@sena.edu.co','Calle 7 No. 18 - 21','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 6:00 p.m.',NULL),
	 ('Quindío','Calarcá','desarrolloeconomicoambientalycomunitario@calarca-quindio.gov.co','Carrera 24 # 40-19 Edificio del Concejo Municipal de Calarcá ','Lunes a viernes 9:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.',NULL),
	 ('Quindío','Filandia','lramirezcelis@gmail.com','Carrera. 6 # 6- 09','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.','3175125818'),
	 ('Valle del Cauca','Cali','apevalle@sena.edu.co','Calle 23N No. 2N-38, B/San Vicente','Lunes a viernes 7:00 a.m. a 4:30 p.m. ','  6024315800, extensiones: 23102-23103-23105-23107-23109-23112-23130-23127-23132-23133'),
	 ('Valle del Cauca','Cartago','invalencia@sena.edu.co lhinestroza@sena.edu.co','Carrera 9 No. 12 - 141, Barrio Tres Esquinas (Centro de Tecnologías Agroindustriales SENA)','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.','4315800 EXT 23618'),
	 ('Valle del Cauca','Palmira','amoreno@sena.edu.co, tsilva@sena.edu.co','Calle 40 # 30 - 44, Centro de Biotecnología Industrial','Lunes a viernes 8:00 a.m. - 12:00 a.m. 2:00 p.m. - 4:30 p.m.','  6024315800 EXT 23706');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Valle del Cauca','Buenaventura','bicaldas@sena.edu.co tcabezas@sena.edu.co ivergara@sena.edu.co','Kilometro 5 Centro Náútico Pesquero','Lunes a viernes de 8:00 a.m. - 12:00 m. y 2:00 p.m. - 4:00 p.m.','6024315800 EXT 23416'),
	 ('Valle del Cauca','Buga','mgutierrezg@sena.edu.co apecab@sena.edu.co vmesa@sena.edu.co','Carrera 19 # 6 -01 - Estación de Ferrocarril, Centro Agropecuario Buga.   ','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.','602 2366661'),
	 ('Valle del Cauca','Tuluá','mffeijoo@sena.edu.co; azuniga@sena.edu.co; vmarias@sena.edu.co','Calle 28 # 19-38  Esquina, Centro Comercial Bicentenario Plaza, 2do piso','Lunes a Viernes de 8:00 a.m. a 12:00 .m. y de  1:00 .p.m. a 5:00 p.m.','6024315800 Ext. 223952 -53-54'),
	 ('Cauca','Popayán','apecauca@sena.edu.co','Calle 4 No. 2 - 67','Lunes a viernes de 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 5:00 p.m.','6028243549'),
	 ('Cauca','Santander de Quilichao','apecauca@sena.edu.co','Carrera 11 No. 6-31, SENA Sede Zona Norte','Lunes a viernes 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 5:00 p.m.','6015461500 Ext. 22363'),
	 ('Nariño','Pasto','apenarino@sena.edu.co','Carrera 25 No 20 - 65 oficina 210 Edificio Calle Real','Lunes a viernes de 8:00 a.m. a 11:45 a.m. y de 2:00 p.m. a 5:45 p.m.',NULL),
	 ('Nariño','Ipiales','alucerom@sena.edu.co, mchingal@sena.edu.co, jerira@sena.edu.co','Carrera 7 No. 24A - 48','Lunes a viernes de 8:00 a.m. a 11:45 a.m. y de 2:00 p.m. a 5:45 p.m.','3136723890, 3104627001, 3172744520'),
	 ('Nariño','Tumaco','gandrade@sena.edu.co, dianaqui97@gmail.com, agonzales@sena.edu.co','SENA Sede Muelle, Calle del Comercio.','Lunes a viernes de 8:00 a.m. a 11:45 a.m. y de 2:00 p.m. a 5:45 p.m.','3154571631, 223883024 y 3172386674'),
	 ('Putumayo','Puerto Asís','jgzambranom@sena.edu.co,  jlpayoguaje@sena.edu.co,  doruiz@sena.edu.co, fvillalba@sena.edu.co','Centro Agroforestal y Acuícola Arapaima, calle 19ª No. 23-57 B/ 20 de Julio','Lunes a viernes de 8:00 a.m. - 12:30 m. y 2:00 p.m. - 6:00 p.m.','3208337912, 3118370944, 3156298298, 3508287442'),
	 ('Amazonas','Leticia','scortes@sena.edu.co','Km.1.5 Vía Tarapacá - Los Lagos','Lunes a viernes 7:30 a.m. a 12:00 m. 2:00 p.m. a 6:00 p.m.',NULL);
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Caquetá','Florencia','ofbonilla@sena.edu.co','Carrera 7 No. 7 -08  P-2  B/La Estrella ','Lunes a viernes 8:00 a.m. a 12:00 m. y 2:00 p.m. a 6:00 p.m.','3204813544  (WhatsApp)-  320 3833795  (WhatsApp)'),
	 ('Huila','Neiva','apehuila1@sena.edu.co,  rtovar@sena.edu.co','Carrera 5a No 16-16. ','Lunes a viernes 8:00 a.m. a 11:00 a.m. 2:00 p.m. a 5:00 p.m.','3154399971, 3112434480'),
	 ('Huila','Campoalegre','svortiz@sena.edu.co','Centro Agroindustrial La Angostura, Kl 38 vía al Sur del Huila.','Lunes a viernes 7:45 a.m. - 3:45 pm','3212431035'),
	 ('Huila','Garzón','davargasa@sena.edu.co, ferojas@sena.edu.co','Centro Agroempresarial y de Desarrollo Pecuario del Huila, Carrera 10 No. 11-22.','Lunes a viernes 8:00 a.m. a 11:00 a.m. 2:00 p.m. a 5:00 p.m.','3102873487'),
	 ('Huila','La Plata','eacabreram@sena.edu.co, jogarcia@sena.edu.co, lpliscano@sena.edu.co','Centro de Desarrollo Agroempresarial y Turístico del Huila, Carrera 7 No. 5-67.','Lunes a viernes 8:00 a.m. a 11:00 a.m. 2:00 p.m. a 5:00 p.m.','3169546951, 3134727547'),
	 ('Huila','Pitalito','yfluna@sena.edu.co, rpenah@sena.edu.co','Centro de Gestión y Desarrollo Surcolombiano, carrera 8 No. 7- 53','Lunes a viernes 8:00 a.m. a 11:00 a.m. 2:00 p.m. a 5:00 p.m.','3102326157, 3173934962'),
	 ('Tolima','Ibagué','yvparra@sena.edu.co, lmrojasg@sena.edu.co, jhmontanez@sena.edu.co, cpsantos@sena.edu.co, dfzarta@sena.edu.co, aacastillob@sena.edu.co','Avenida del Ferrocarril Transversal 1 No. 42-44.','Lunes a viernes de 7:30 a.m. - 12:00 m. y 2:00 p.m. - 6:00 p.m.','PBX: 2709600 IP 84317 – 84259 – 84350 -84335 - 84319'),
	 ('Meta','Villavicencio','spemeta@sena.edu.co','Carrera 48 No. 6-40 Urb. Guayuriba Vía Acacías','Lunes a Viernes  de 8:00 a.m. - 11:30 a.m. y 2:00 p.m. - 5:30 p.m.','5461500  -  extensión 83970'),
	 ('Meta','Puerto Gaitán','correoapemeta@sena.edu.co','Km 1 vía Villavicencio - contiguo finca el bolsillo - frente urbanización Las Margaritas','Lunes a jueves de 8:00 a.m. - 11:30 p.m. y 2:00 p.m. - 5:30 p.m. Viernes de 8:00 a.m. - 11:30 p.m. y 2:00 p.m. - 4:00 p.m.',' 5461500 - extensión 86511'),
	 ('Guaviare','San José del Guaviare','apeguaviare@sena.edu.co, lpecheverry@sena.edu.co','Carrera 24 No. 7-10, Barrio Centro','Lunes a viernes 8:00 am – 12:00 m. 2:00pm – 6:00 pm','3026698434');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Vaupés','Mitú','mapenaa@sena.edu.co','Av 15 # 6 - 176, Barrio San José. Por coyuntura COVID - 19 se está brindando el servicio de manera virtual','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:30 p.m.',NULL),
	 ('Guainía','Puerto Inírida','apeguainia@sena.edu.co','Transversal 6 No. 29A-55, Vía al Coco','Lunes a viernes 7:30 a.m. a 12:00 m. 2:00 p.m. a 6:00 p.m.',NULL),
	 ('Vichada','Puerto Carreño','oygonzalez@sena.edu.co','Carrera 10 N° 15 -41 barrio tamarindo','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.',' 3216522339'),
	 ('Casanare','Yopal',' apeyopal@sena.edu.co ','Carrera 19 Nro. 36 - 68','Lunes a viernes de 8:00 a.m. - 11:30 a.m. y 2:00 p.m. - 5:00 p.m.','5461500 ext. 84766, 84811'),
	 ('Arauca','Arauca','aperegionalarauca@sena.edu.co, o aperegionalarauca@gmail.com','Calle 24 # 19-17, barrio Córdoba','Lunes a viernes de 8:00 a.m. - 12:00 m. y  2:00 p.m. - 5:00 p.m.','3164579037 - 3167142804'),
	 ('Arauca','Tame','aperegionalarauca@sena.edu.co, o aperegionalarauca@gmail.com','Carrera 15 No. 37-95 B. Araucarias  ','Lunes a Viernes de 8:00 - 12:00 m. y    2:00 - 5:00 p.m.','3164564417'),
	 ('San Andrés y Providencia','San Andrés','moneill@sena.edu.co','SENA, Avenida Francisco Newball. Por coyuntura COVID - 19 se está brindando el servicio de manera virtual','Lunes a viernes de 8:00 a.m. - 12:00 m. y 2:00 p.m. - 6:00 p.m.','5123066 3123684029'),
	 ('Cundinamarca','Villapinzón','gobierno@villapinzon-cundinamarca.gov.co','Carrera 5 No. 4 - 25','Lunes a viernes de 8:00 a 5:30 p.m.','8565125 Ext. 320 o 323'),
	 ('Cundinamarca','Guasca','desarrolloeconomico@guasca-cundinamarca.gov.co','Calle 4 No. 3 - 48 Alcaldía de Guasca, Secretaría de Desarrollo Económico','Lunes a viernes de 8:00 a.m. - 5:00 p.m.',' 301 521 8218 y 320 288 9704'),
	 ('Cundinamarca','Sopó','oficinasopohv@gmail.com, empleo@sopo-cundinamarca.gov.co','Calle 1 No 3 - 49','Lunes a miércoles   de 7:00 a.m. 12:30 p.m.  y 2:00 p.m. a 5:00 p.m. Jueves a viernes 7:00 a.m. 12:30 p.m.  y 2:00 p.m. a 4:30 p.m.','8578146 - 3132962336');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Santander','Piedecuesta','empleoyemprendimiento@alcaldiadepiedecuesta.gov.co','Carrera 6 Nº 9 - 98','Lunes a viernes  8:00 a.m. - 1:00 pm. y 2:00 p.m. -  5:00 p.m. ','6076650444 Ext. 1712'),
	 ('Atlántico','Barranquilla',' apeatlantico@sena.edu.co','Avenida Circunvalar, Kra 15 SUR  46-500 Junto a IE Germán Vargas Cantillo','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 4:00 p.m.','O18000910270'),
	 ('Atlántico','Barranquilla','apeatlantico@sena.edu.co','Barrio Abajo, Kra 54  No. 49-09 Frente a la Casa del Carnaval','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 4:00 p.m.','O18000910270'),
	 ('Atlántico','Barranquilla',' apeatlantico@sena.edu.co','Avenida Cordialidad Kra 6 No. 60B-110 Junto a Estación de Policía El Bosque','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 4:00 p.m.','O18000910270'),
	 ('Atlántico','Barranquilla',' apeatlantico@sena.edu.co','Diagonal 136 No. 9G-20 Urbanización Villas de San Pablo','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 4:00 p.m.','O18000910270'),
	 ('Atlántico','Soledad','apeatlantico@sena.edu.co','Carrera 24 con calle 48 Junto a CDI Normandía','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 4:00 p.m.','O18000910270'),
	 ('Boyacá','Tunja','apeboy@sena.edu.co','Carrera 10 No. 16-32 segundo piso Tunja. Teatro Cultural del Centro de Empleo y Emprendimiento. Barrio Centro','Lunes a viernes  8:00 a.m. a  12:30 p.m y 2:00 p.m. a 6:00 p.m.','7721313'),
	 ('Putumayo','Mocoa','vcamilao@sena.edu.co, ymbastidas@sena.edu.co','Calle 10 N.º 13 - 50 Barrio San Agustín. Mocoa, Instalaciones del SENA sede Maguare','Lunes a viernes de 8:00 a.m. - 12:30 m. y 2:00 p.m. - 6:00 p.m.','3186276777'),
	 ('San Andrés y Providencia','Providencia ','moneill@sena.edu.co','Barrio Old Town- Pueblo viejo, Providencia Isla','Lunes a viernes: 8:00 a.m. - 1:00 pm. y 2:00 p.m. -  5:00 p.m.','5123066 3123684029'),
	 ('Arauca','Arauquita','aperegionalarauca@sena.edu.co, o aperegionalarauca@gmail.com','Calle 4ta · 7 - 36 Centro de Convivencia B. Charalá ','Lunes a viernes de 8:00 a.m. - 12:00 m. y  2:00 p.m. - 5:00 p.m','3163843145');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Arauca','Saravena','aperegionalarauca@sena.edu.co, o aperegionalarauca@gmail.com','Carrera 16A No. 28-11 B. Seis de Octubre ','Lunes a viernes de 8:00 a.m. - 12:00 m. y 2:00 p.m. - 5:00 p.m.','3176392404'),
	 ('Cundinamarca','Soacha','caduquer@sena.edu.co, ncifuentest@sena.edu.co','CIDE SOACHA - Calle 13 # 10 - 93','Lunes a viernes de 8:00 a.m. -  5:00 p.m.','5461500 Ext. 18014'),
	 ('Cundinamarca','Mosquera','secretariadecompetitividad@mosquera-cundinamarca.gov.co','Carrera 2 # 268, Mosquera','Lunes a viernes 09:00 a.m. -1:00 p.m. y de 2:00 p.m. -04:00 p.m. ',' 8270830 Ext: 4100'),
	 ('Cundinamarca','Zipaquirá','competitividad.tec@zipaquira.gov.co','Carrera 10 #  1ª- 98 Edificio SKORPIUS TOWER III, segundo piso','Lunes a viernes de 9:00 a.m. - 4:00 p.m.','3225086223'),
	 ('Cundinamarca','Madrid','oficina.empleo@madridcundinamarca.gov.co','Carrera 7 # 8 -52 barrio centro Madrid','Lunes a Viernes de 8:00 a.m. -  4:00 p.m.','7460017'),
	 ('Cundinamarca','Ricaurte','empleoyemprendimiento@ricaurte-cundinamarca.gov.co','Calle 3 No. 15 - 37 Pacande','Lunes a jueves de 7:00 a.m. -12:00 m. y 2:00 p.m. - 6:00 p.m.  Viernes de   7:00 a.m. -12:00 m. y 2:00 p.m. - 5:00 p.m. ','Teléfono: 601-8366778 / 601-8366711'),
	 ('Cundinamarca','Nemocón','empleo@nemocon-cundinamarca.gov.co','Calle 3 # 3 - 21 Centro','Lunes a viernes  7:30 a.m. - 12:30 m. y 2:00 p.m. - 5:00 p.m. ','3134739409'),
	 ('Cundinamarca','Tenjo','empleo@tenjo-cundinamarca.gov.co, generacionempleo@tenjo-cundinamarca.gov.co, sandra.talero@tenjo-cundinamarca.gov.co','Carrera 7 # 6 - 71 esquina, Polideportivo','Lunes a viernes 8:00 a.m. a 5:00 p.m.','8646337 Ext. 161'),
	 ('Cundinamarca','Cota','empleo@alcaldiacota.gov.co','Cr. 5 # 1-97 Centro Comercial Cedro Mall piso 2 SENA - Cota','Lunes a viernes 8:00 a.m.  - 5:00 p.m. ','601 3161800'),
	 ('Cundinamarca','Tabio','agenciadeempleotabio@hotmail.com','Carrera. 5 # 4-27','Lunes a viernes  7:00 a.m. - 5:00 p.m. ','3212106730');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Cundinamarca','Puerto Salgar ','empresarialyturisticopsalgar@gmail.com','Tv. 11a #11-33, Puerto Salgar, Cundinamarca','Lunes a viernes 8:00 a.m. - 1:00 pm. y 2:00 p.m. -  5:00 p.m. ','3212587404'),
	 ('Cundinamarca','Concesión Alto Magdalena','coordinaciongth@altomagdalena.com','km5 + 907 peaje Cambao- San Juan de Rioseco','Lunes a viernes 8:00 a.m. - 1:00 pm. y 2:00 p.m. -  5:00 p.m. ','3219740955'),
	 ('Cundinamarca','Nilo','empleabilidadalcaldianilocun@gmail.com','Calle 5 No. 3 -16, barrio Centro, Casa de la Cultura, tercer piso.  ','Lunes a viernes 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 5:00 p.m. ','3203199421'),
	 ('Cundinamarca','La Calera ','ude@lacalera-cundinamarca.gov.co','Carrera 3 # 6 - 10','Lunes a viernes de 8:00 a.m. a 5:00 p.m. ','3228738635'),
	 ('Cundinamarca','Chipaque','talentohumano@chipaque-cundinamarca.gov.co','Calle 5  No. 4 - 16 Palacio Municipal Chipaque','Lunes a viernes de 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 5:00 p.m. ','321 303 1954'),
	 ('Casanare','Paz de Ariporo','bcarvajal@sena.edu.co','Km 6 vía Apore , Paz de Ariporo','Lunes a viernes 8:00 a.m. -11:30 pm. y 2:00 p.m. -  5:00 p.m.','3118437792'),
	 ('Quindío','Armenia','jcariasb@sena.edu.co','Carrera 14 # 23 - 15  ','Lunes y miércoles  de 2: 00 p.m. a 6:00 p.m.',NULL),
	 ('Quindío','La Tebaida','juanc.cardona41@gmail.com','Calle 7 No. 10 - 2 ','Lunes a viernes de 8:00 a.m. a 12:00 m. ','3216161764'),
	 ('Quindío','Córdoba','apoyoempleo63212@gmail.com','Carrera 10 con calle 14 Esquina ','Lunes a viernes 8:00 a.m. a 12:00 m, y de 2:00 p.m.  a 6:00 pm','3217727182'),
	 ('Quindío','Montenegro','blms88@hotmail.com','Carrera 6 con calle 17, Esquina, tercer piso','Lunes a viernes de 8:00 a.m. a 12:00 m.',NULL);
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Quindío','Armenia','secretariaeconomico@armenia.gov.co','Punto vive digital Centenario: Comuna 1, kilómetro 1 Vía al Aeropuerto El Edén, Estadio Centenario Piso 2 Imdera','Lunes a viernes de 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 6:00 p.m. ','7417100'),
	 ('Quindío','Armenia','secretariaeconomico@armenia.gov.co','Punto vive digital Ciudad Dorada: Comuna 3, Barrio Ciudad Dorada, Manzana 16 Lote 1.','Lunes a viernes de 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 6:00 p.m.','7417100'),
	 ('Quindío','Armenia','secretariaeconomico@armenia.gov.co','Punto vive digital CDC Santander: Comuna 4 / Barrio Santander','Lunes a viernes de 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 6:00 p.m.','7417100'),
	 ('Quindío','Armenia','secretariaeconomico@armenia.gov.co','Punto vive digital Libreros: Comuna 7, Calle 20 No. 15-25 Barrio Centro.','Lunes a viernes de 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 6:00 p.m.','7417100'),
	 ('Quindío','Armenia','apegobernacionquindio@gmail.com','Gobernación del Quindío, calle 20 No. 13 - 22 ','Lunes a viernes de 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 6:00 p.m.',NULL),
	 ('Cesar','Chimichagua','apvillegas@sena.edu.co','Sector Chambacú, barrio Villa Esther','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.',NULL),
	 ('Cesar','San Alberto','abetancourtc@sena.edu.co','Calle 2B No. 16 - 26.','Lunes a viernes 8:00 a.m. a 12:00 m. 2:00 p.m. a 5:00 p.m.',NULL),
	 ('Valle del Cauca','Cali','oossa@sena.edu.co','Calle 72 K # 26 J-97, barrio El Pondaje, Centro de Diseño Tecnológico Industria','Lunes a viernes de 8:00 a.m. a  12:00 m. y de  1:00 p.m. a 4:00 p.m.','  6024315800, extensiones: 23102-23103-23105-23107-23109-23112-23130-23127-23132-23133'),
	 ('Putumayo','Orito','lumartinezvi@sena.co','Barrio Jardín diagonal a Ecopetrol','Lunes a viernes de 8:00 a.m. - 12:30 p.m. y 2:00 p.m. - 6:00 p.m.','3228562116'),
	 ('Quindío','Armenia','secretariaeconomico@armenia.gov.co','Punto vive digital CDC Las Margaritas: Comuna 5 / Barrio Las Margaritas','Lunes a viernes de 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 6:00 p.m.','7417100');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Tolima','Ibagué',' dclozano@sena.edu.co','Calle 10 No. 3-76 – Edificio Cámara de Comercio 2ª piso ','Lunes a miércoles de 08:00 a.m. a 12:00 m.  y 2:00 p.m. a 6:00 p.m. ','3052508190'),
	 ('Antioquia','El Carmen de Viboral','u.competitividad@elcarmendeviboral-antioquia.gov.co','Calle 31 No. 30 - 06 El Carmen de Viboral','Lunes a viernes 7:00 a.m. - 4:00p.m. Jornada continua',NULL),
	 ('Antioquia','Medellín','dabermudez@sena.edu.co','Calle 48 No. 28 -01 Medellín - Oficina Satélite Buenos Aires ','Lunes a viernes 7:30 am - 12:00m y 1:00 pm a 4:30 p.m.',NULL),
	 ('Antioquia','San Roque','ape@sanroque-antioquia.gov.co','Carrera 20 No. 20 - 59 Parque Educativo San Roque Antioquia','Lunes, martes, jueves y viernes de 8:00 a.m. a 12:00 m, y de 2:00 p.m. a 6:00 p.m. miércoles y sábado de 8:00 a.m. a 2:00 p.m.',NULL),
	 ('Antioquia','Yondó','apesenayondo@gmail.com','Carrera 55 No. 46 A -16 Barrio Colonia Sur Yondó','Lunes a viernes de 8:00 a.m. - 12:00 p.m. y 2:00 p.m. - 5:00 p.m.',NULL),
	 ('Antioquia','Medellín','lsaenzh@sena.edu.co','Calle 76 No. 39 - 152 Barrio Manrique - Oficina Satélite Pomar','Lunes a Viernes 7:30 a.m. a 12:00 p.m. 1:00 p.m. a 4:30 p.m.',NULL),
	 ('Santander','Floridablanca','empleo@floridablanca.gov.co','Calle 6 # 10 - 36, Casco Antiguo de Floridablanca, Centro Comercial Mía, piso 3',NULL,' 607-6911050 ext. 2604'),
	 ('Putumayo','Valle del Sibundoy','ldhernandez@sena.edu.co','Vereda Machindinoy','Lunes a viernes de 8:00 a.m. - 12:30 m. y 2:00 p.m. - 6:00 p.m.','3209082131'),
	 ('Tolima','Melgar ','djsandoval@sena.edu.co','Carrera 22 No. 5 - 72','Lunes a viernes de 7:30 a.m. - 12:00 m. y 2:00 p.m. - 6:00 p.m.','3042110794'),
	 ('Bogotá','Bogotá',NULL,'Centro de Centro de Formación en Actividad Física, y Cultura del SENA. Transversal 78J No. 41 D - 15 Sur - Primer piso Localidad de Kennedy -Oficina satélite','Lunes a viernes 8:00 a.m. a 4:00 p.m. jornada continua','5461600');
INSERT INTO public."LINEA_ATENCION_APE" (departamento,ciudad,contacto,direccion,horario_atencion,telefono) VALUES
	 ('Cundinamarca','Cajicá',NULL,'Carrera 4 No 3 - 07','Lunes a viernes 7:00 a.m. a 01:00 p.m. y de 02:00 p.m. a 4:30 p.m.','3154130692'),
	 ('Cundinamarca','El Colegio','planeacion@elcolegio-cundinamarca.gov.co','Calle 10 No. 6 - 40 ','Lunes a jueves de  7:00 a.m. -12:00 m. y 2:00 p.m. - 6:00 p.m.  Viernes de   7:00 a.m. -12:00 m. y 2:00 p.m. - 5:00 p.m. ','3185321927'),
	 ('Cundinamarca','Sesquilé','emprendimiento@sesquile-cundinamarca.gov.co','Calle 6 con Carrera 8 2do. Piso','Lunes a viernes 8:00 a.m. a 12:00 m. y de 2:00 p.m. a 5:00 p.m. ','3206688935'),
	 ('Cundinamarca','Ubaté','tec.cultura@ubate-cundinamarca.gov.co','Cl. 6 # 8 - 79, Ubaté, Villa de San Diego de Ubaté, Cundinamarca','Lunes a viernes 8:00 a.m. a 5:00 p.m.','3204244230 - 3115238004');