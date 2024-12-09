-- lineas de atencion
-- CREATE SEQUENCE IF NOT EXISTS linea_atencion_ape;
-- CREATE SEQUENCE IF NOT EXISTS linea_atencion_sena;
-- CREATE SEQUENCE IF NOT EXISTS tags_id_seq;

-- CREATE TABLE IF NOT EXISTS public."LINEA_ATENCION_APE" (
--     id BIGINT DEFAULT nextval('linea_atencion_ape'::regclass) NOT NULL,
--     departamento varchar(200) NOT NULL,
--     ciudad varchar(200) NOT NULL,
--     contacto varchar(200) NULL,
--     direccion text NULL,
--     horario_atencion varchar(255) NULL,
--     telefono varchar(200) NULL,
--     CONSTRAINT "LINEA_ATENCION_APE_PK" PRIMARY KEY (id)
-- );


-- CREATE TABLE IF NOT EXISTS public."LINEA_ATENCION_SENA" (
--     id BIGINT DEFAULT nextval('linea_atencion_sena'::regclass) NOT NULL,
--     cod_regional int4 NOT NULL,
--     departamento varchar(100) NOT NULL,
--     ciudad varchar(100) NOT NULL,
--     contacto varchar(100) NULL,
--     direccion text NULL,
--     horario_atencion varchar(255) NULL,
--     telefono varchar(50) NULL,
--     nombre_centro varchar(255) NULL,
--     CONSTRAINT "LINEA_ATENCION_SENA_PK" PRIMARY KEY (id)
-- );

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

-- CREATE TABLE IF NOT EXISTS users (
--     id SERIAL PRIMARY KEY,
--     name TEXT NOT NULL,
--     email TEXT NOT NULL,
--     password TEXT NOT NULL,
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--     updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--     deleted_at TIMESTAMP WITH TIME ZONE
-- );


-- CREATE TABLE IF NOT EXISTS public.tickets (
--     "ID" INT4 DEFAULT nextval('tags_id_seq'::regclass) NOT NULL,
--     "ID_TICKET" BIGINT NOT NULL,
--     "TITULO" VARCHAR NOT NULL,
--     "CONTENIDO" VARCHAR NOT NULL,
--     "PALABRAS_CLAVES" VARCHAR NOT NULL,
--     "NUMERO_DOCUMENTO" VARCHAR NOT NULL,
--     "ID_USUARIO" INT4 NOT NULL,
--     "FECHA_HORA" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
--     CONSTRAINT TAGS_PK PRIMARY KEY ("ID")
-- );


