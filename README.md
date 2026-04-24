# Rate Limiter

A production-grade, Redis-backed distributed rate limiter for Node.js/Express.

## Quick Start

```bash
cp .env.example .env
docker-compose up
```

## Usage

```js
const { createRateLimiter } = require('./src/middleware/rateLimiter');
app.use(createRateLimiter({ bucketCapacity: 100, refillRate: 10, store: redisStore }));
```

## Documentation

- [Requirements (PRD)](docs/PRD.md)
- [Project Structure](docs/STRUCTURE.md)
- [High-Level Design](docs/HLD.md)
- [Algorithm Trade-offs](docs/ALGORITHMS.md)
