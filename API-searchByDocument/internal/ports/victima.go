package ports

import "SEARCHBYDOCUMENT/internal/domain"

type VictimaRepository interface {
    CreateVictima(victima *domain.Victima) error
    GetVictimaByDocumento(documento string) (*domain.Victima, error)
}