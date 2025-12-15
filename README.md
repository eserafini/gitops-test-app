# GitOps Test App

Uma aplicação TypeScript para testar GitOps com ArgoCD.

## Características

- ✅ TypeScript com configuração strict
- ✅ Express.js
- ✅ Dockerfile multi-stage
- ✅ Helm Chart para Kubernetes
- ✅ GitHub Actions para CI/CD
- ✅ Suporte a PR Environments

## Estrutura

```
gitops-test-app/
├── src/
│   └── index.ts          # Código fonte
├── chart/                # Helm Chart
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
├── values/               # Valores por ambiente
│   ├── prod.yaml
│   └── preview.yaml
├── .github/
│   └── workflows/        # GitHub Actions
├── Dockerfile
├── package.json
└── tsconfig.json
```

## Desenvolvimento

```bash
# Instalar dependências
npm install

# Desenvolvimento com hot reload
npm run dev

# Build
npm run build

# Executar
npm start

# Lint
npm run lint

# Type check
npm run type-check
```

## Endpoints

- `GET /` - Informações da API
- `GET /health` - Health check
- `GET /api/hello` - Endpoint de exemplo

## Docker

```bash
# Build
docker build -t gitops-test-app:latest .

# Run
docker run -p 3000:3000 gitops-test-app:latest
```

## Kubernetes

Deploy via ArgoCD usando o Helm Chart em `chart/`.
