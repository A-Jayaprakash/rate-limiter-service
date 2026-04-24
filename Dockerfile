FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run test:unit

FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY --from=builder /app/src ./src
COPY --from=builder /app/config ./config
COPY --from=builder /app/demo-api ./demo-api
EXPOSE 3000
CMD ["node", "demo-api/server.js"]
