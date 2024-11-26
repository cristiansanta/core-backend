package victimas

import (
    "database/sql"
    "net/http"

    "SEARCHBYDOCUMENT/internal/domain"
    "github.com/gin-gonic/gin"
)

func GetEventByCedula(c *gin.Context, db *sql.DB) {
    documento := c.Param("cedula")

    var victima domain.Victima
    err := db.QueryRow(`
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

    if err == sql.ErrNoRows {
        c.JSON(http.StatusNotFound, gin.H{"error": "Registro no encontrado"})
        return
    } else if err != nil {
        c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al buscar el registro: " + err.Error()})
        return
    }

    c.JSON(http.StatusOK, victima)
}
