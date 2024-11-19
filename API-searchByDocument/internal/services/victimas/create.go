package victimas

import (
    "SEARCHBYDOCUMENT/internal/domain"
    "SEARCHBYDOCUMENT/internal/ports"
)

type VictimaService struct {
    repo ports.VictimaRepository
}

func NewVictimaService(repo ports.VictimaRepository) *VictimaService {
    return &VictimaService{repo: repo}
}

func (s *VictimaService) CreateVictima(victima *domain.Victima) error {
    return s.repo.CreateVictima(victima)
}
