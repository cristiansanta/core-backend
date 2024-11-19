package victimas

import (
    "database/sql"
    "SEARCHBYDOCUMENT/internal/domain"
    "SEARCHBYDOCUMENT/internal/ports"
)

type PostgresVictimaRepository struct {
    db *sql.DB
}

func NewPostgresVictimaRepository(db *sql.DB) ports.VictimaRepository {
    return &PostgresVictimaRepository{db: db}
}

func (r *PostgresVictimaRepository) CreateVictima(victima *domain.Victima) error {
    sqlStatement := `
        INSERT INTO public.ruv_victimas (
            ORIGEN, FUENTE, PROGRAMA, ID_PERSONA, ID_HOGAR, TIPO_DOCUMENTO, DOCUMENTO,
            PRIMERNOMBRE, SEGUNDONOMBRE, PRIMERAPELLIDO, SEGUNDOAPELLIDO, FECHANACIMIENTO,
            EXPEDICIONDOCUMENTO, FECHAEXPEDICIONDOCUMENTO, PERTENENCIAETNICA, GENERO,
            TIPOHECHO, HECHO, FECHAOCURRENCIA, CODDANEMUNICIPIOOCURRENCIA, ZONAOCURRENCIA,
            UBICACIONOCURRENCIA, PRESUNTOACTOR, PRESUNTOVICTIMIZANTE, FECHAREPORTE, TIPOPOBLACION,
            TIPOVICTIMA, PAIS, CIUDAD, CODDANEMUNICIPIORESIDENCIA, ZONARESIDENCIA, UBICACIONRESIDENCIA,
            DIRECCION, NUMTELEFONOFIJO, NUMTELEFONOCELULAR, EMAIL, FECHAVALORACION, ESTADOVICTIMA,
            NOMBRECOMPLETO, IDSINIESTRO, IDMIJEFE, TIPODESPLAZAMIENTO, REGISTRADURIA,
            VIGENCIADOCUMENTO, CONSPERSONA, RELACION, CODDANEDECLARACION, CODDANELLEGADA,
            CODIGOHECHO, DISCAPACIDAD, DESCRIPCIONDISCAPACIDAD, FUD_FICHA, AFECTACIONES
        ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21,
                  $22, $23, $24, $25, $26, $27, $28, $29, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $40, $41,
                  $42, $43, $44, $45, $46, $47, $48, $49, $50, $51, $52, $53)
    `

    _, err := r.db.Exec(sqlStatement,
        victima.Origen, victima.Fuente, victima.Programa, victima.IdPersona, victima.IdHogar,
        victima.TipoDocumento, victima.Documento, victima.PrimerNombre, victima.SegundoNombre,
        victima.PrimerApellido, victima.SegundoApellido, victima.FechaNacimiento, victima.ExpedicionDocumento,
        victima.FechaExpedicionDocumento, victima.PertenenciaEtnica, victima.Genero, victima.TipoHecho,
        victima.Hecho, victima.FechaOcurrencia, victima.CodDaneMunicipioOcurrencia, victima.ZonaOcurrencia,
        victima.UbicacionOcurrencia, victima.PresuntoActor, victima.PresuntoVictimizante, victima.FechaReporte,
        victima.TipoPoblacion, victima.TipoVictima, victima.Pais, victima.Ciudad,
        victima.CodDaneMunicipioResidencia, victima.ZonaResidencia, victima.UbicacionResidencia,
        victima.Direccion, victima.NumTelefonoFijo, victima.NumTelefonoCelular, victima.Email,
        victima.FechaValoracion, victima.EstadoVictima, victima.NombreCompleto, victima.IdSiniestro,
        victima.IdMiJefe, victima.TipoDesplazamiento, victima.Registraduria, victima.VigenciaDocumento,
        victima.ConsPersona, victima.Relacion, victima.CodDaneDeclaracion, victima.CodDaneLlegada,
        victima.CodigoHecho, victima.Discapacidad, victima.DescripcionDiscapacidad, victima.FudFicha,
        victima.Afectaciones)
    
    return err
}

func (r *PostgresVictimaRepository) GetVictimaByDocumento(documento string) (*domain.Victima, error) {
    var victima domain.Victima
    err := r.db.QueryRow(`
        SELECT 
            ORIGEN, FUENTE, PROGRAMA, ID_PERSONA, ID_HOGAR, TIPO_DOCUMENTO, DOCUMENTO, 
            PRIMERNOMBRE, SEGUNDONOMBRE, PRIMERAPELLIDO, SEGUNDOAPELLIDO, FECHANACIMIENTO, 
            EXPEDICIONDOCUMENTO, FECHAEXPEDICIONDOCUMENTO, PERTENENCIAETNICA, GENERO, 
            TIPOHECHO, HECHO, FECHAOCURRENCIA, CODDANEMUNICIPIOOCURRENCIA, ZONAOCURRENCIA, 
            UBICACIONOCURRENCIA, PRESUNTOACTOR, PRESUNTOVICTIMIZANTE, FECHAREPORTE, TIPOPOBLACION, 
            TIPOVICTIMA, PAIS, CIUDAD, CODDANEMUNICIPIORESIDENCIA, ZONARESIDENCIA, UBICACIONRESIDENCIA, 
            DIRECCION, NUMTELEFONOFIJO, NUMTELEFONOCELULAR, EMAIL, FECHAVALORACION, ESTADOVICTIMA, 
            NOMBRECOMPLETO, IDSINIESTRO, IDMIJEFE, TIPODESPLAZAMIENTO, REGISTRADURIA, 
            VIGENCIADOCUMENTO, CONSPERSONA, RELACION, CODDANEDECLARACION, CODDANELLEGADA, 
            CODIGOHECHO, DISCAPACIDAD, DESCRIPCIONDISCAPACIDAD, FUD_FICHA, AFECTACIONES
        FROM public.ruv_victimas
        WHERE DOCUMENTO = $1
    `, documento).
        Scan(
            &victima.Origen, &victima.Fuente, &victima.Programa, &victima.IdPersona, &victima.IdHogar, &victima.TipoDocumento, &victima.Documento,
            &victima.PrimerNombre, &victima.SegundoNombre, &victima.PrimerApellido, &victima.SegundoApellido, &victima.FechaNacimiento,
            &victima.ExpedicionDocumento, &victima.FechaExpedicionDocumento, &victima.PertenenciaEtnica, &victima.Genero,
            &victima.TipoHecho, &victima.Hecho, &victima.FechaOcurrencia, &victima.CodDaneMunicipioOcurrencia, &victima.ZonaOcurrencia,
            &victima.UbicacionOcurrencia, &victima.PresuntoActor, &victima.PresuntoVictimizante, &victima.FechaReporte, &victima.TipoPoblacion,
            &victima.TipoVictima, &victima.Pais, &victima.Ciudad, &victima.CodDaneMunicipioResidencia, &victima.ZonaResidencia, &victima.UbicacionResidencia,
            &victima.Direccion, &victima.NumTelefonoFijo, &victima.NumTelefonoCelular, &victima.Email, &victima.FechaValoracion, &victima.EstadoVictima,
            &victima.NombreCompleto, &victima.IdSiniestro, &victima.IdMiJefe, &victima.TipoDesplazamiento, &victima.Registraduria,
            &victima.VigenciaDocumento, &victima.ConsPersona, &victima.Relacion, &victima.CodDaneDeclaracion, &victima.CodDaneLlegada,
            &victima.CodigoHecho, &victima.Discapacidad, &victima.DescripcionDiscapacidad, &victima.FudFicha, &victima.Afectaciones)

    if err != nil {
        return nil, err
    }
    return &victima, nil
}
