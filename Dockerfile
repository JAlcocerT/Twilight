FROM node:20-alpine AS base

# Install pnpm
RUN corepack enable && corepack prepare pnpm@9.14.4 --activate

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy source code
COPY . .

# Expose ports
# 4321 for Astro dev server
# 8081 for Decap CMS proxy server
EXPOSE 4321 8081

# Default command (can be overridden in docker-compose)
CMD ["pnpm", "dev"]
