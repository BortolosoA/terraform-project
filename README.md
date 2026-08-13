## <center>Desafio Técnico Korp</center>
---
## Sobre
Este projeto tem a finalidade de explorar o meu conhecimento de automação e deploy de aplicação em nuvem utilizando Terraform. Criando a Infraestrutura na AWS e configurando-a com Ansible.

## Tecnologias

| Tecnologia | Finalidade |
|---|---|
| **Go** | Desenvolvimento da aplicação HTTP |
| **Docker** | Containerização dos serviços |
| **Docker Compose** | Orquestração do ambiente |
| **Nginx** | Reverse proxy |
| **Nginx Prometheus Exporter** | Exportação de métricas do Nginx |
| **Prometheus** | Coleta e armazenamento de métricas |
| **Grafana** | Visualização e dashboards |
| **Ansible** | Automação e configuração da infraestrutura |
| **Terraform** | IaC - Criação da infraestrutura |

---

### Estrutura de diretórios
```bash
projeto-korp
├── README.md
├── ansible
│   ├── ansible.cfg
│   ├── inventory
│   │   ├── group_vars
│   │   │   └── all.yaml
│   │   └── inventory.ini
│   ├── playbooks
│   │   ├── korp.yml
│   │   └── templates
│   │       └── http-server-projeto-korp.conf.j2
│   └── requirements.yml
├── app
│   ├── Dockerfile
│   ├── go.mod
│   ├── go.sum
│   └── main.go
├── docker-compose.yml
├── grafana
│   ├── dashboards
│   │   └── projeto-korp.json
│   └── provisioning
│       ├── dashboards
│       │   └── dashboard.yml
│       └── datasources
│           └── datasource.yml
└── prometheus
    └── prometheus.yml
```