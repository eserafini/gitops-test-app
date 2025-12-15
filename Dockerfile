# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Install yarn
RUN corepack enable && corepack prepare yarn@stable --activate

# Copy package files
COPY package.json yarn.lock* ./

# Install dependencies
RUN yarn install --immutable

# Copy source code
COPY . .

# Build TypeScript
RUN yarn build

# Production stage
FROM node:20-alpine

WORKDIR /app

# Install yarn
RUN corepack enable && corepack prepare yarn@stable --activate

# Copy package files
COPY package.json yarn.lock* ./

# Install dependencies
# Nota: Yarn moderno não suporta --production diretamente
# Instalamos tudo (devDependencies não são usadas em runtime, apenas ocupam espaço)
ENV NODE_ENV=production
RUN yarn install --immutable

# Copy built files from builder
COPY --from=builder /app/dist ./dist

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

USER nodejs

EXPOSE 3000

ENV NODE_ENV=production
ENV PORT=3000

CMD ["node", "dist/index.js"]

