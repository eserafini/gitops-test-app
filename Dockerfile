# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Install yarn 1.x (compatível com yarn.lock existente)
RUN apk add --no-cache yarn

# Copy package files
COPY package.json yarn.lock* ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy source code
COPY . .

# Build TypeScript
RUN yarn build

# Production stage
FROM node:20-alpine

WORKDIR /app

# Install yarn 1.x (compatível com yarn.lock existente)
RUN apk add --no-cache yarn

# Copy package files
COPY package.json yarn.lock* ./

# Install only production dependencies
ENV NODE_ENV=production
RUN yarn install --frozen-lockfile --production

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

