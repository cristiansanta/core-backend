package victimas

import (
    "SEARCHBYDOCUMENT/internal/domain"
)

func (s *VictimaService) GetVictimaByDocumento(documento string) (*domain.Victima, error) {
    return s.repo.GetVictimaByDocumento(documento)
}
