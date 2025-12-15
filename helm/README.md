# Helm Chart

Este diretório contém o Helm Chart para deploy no Kubernetes.

## Estrutura

```
helm/
├── Chart.yaml                # Metadados do chart
├── values.yaml              # Valores padrão
├── templates/               # Templates Kubernetes
│   ├── deployment.yaml
│   ├── service.yaml
│   └── serviceaccount.yaml
│
└── values/                  # Configurações por ambiente
    ├── prod/
    │   └── values.yaml      # Valores para produção
    └── preview/
        └── values.yaml      # Valores para PR environments
```

## Ambientes

### Produção (`values/prod/`)

Configuração otimizada para produção:

- Múltiplas réplicas (2+)
- Autoscaling habilitado
- Recursos maiores
- Health checks configurados

### Preview (`values/preview/`)

Configuração para ambientes efêmeros de PR:

- 1 réplica
- Recursos reduzidos
- Sem autoscaling
- Otimizado para testes rápidos

## Uso

O ArgoCD usa esta estrutura para fazer deploy:

- **Produção**: `helm` com `helm/values/prod/values.yaml`
- **Preview**: `helm` com `helm/values/preview/values.yaml`

## Adicionar novo ambiente

1. Criar pasta em `values/<nome-ambiente>/`
2. Criar `values.yaml` com configurações específicas
3. Atualizar Application no ArgoCD para usar o novo ambiente

## Boas Práticas do Helm

Esta estrutura segue as convenções do Helm:

- ✅ Chart na raiz do diretório `helm/`
- ✅ Templates em `helm/templates/`
- ✅ Valores padrão em `helm/values.yaml`
- ✅ Valores por ambiente em `helm/values/<env>/`
- ✅ Separação clara entre chart e configurações
