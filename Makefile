.PHONY: dev build preview check format lint new-post install clean docker-up docker-down docker-build docker-logs docker-dev

# Install dependencies
install:
	pnpm install

# Start development server
dev:
	pnpm dev

# Build for production
build:
	pnpm build

# Preview production build
preview:
	pnpm preview

# Type checking
check:
	pnpm check

# Format code
format:
	pnpm format

# Lint code
lint:
	pnpm lint

# Create a new blog post
new-post:
	@if [ -z "$(title)" ]; then \
		echo "Please provide a title: make new-post title='My Post Title'"; \
		exit 1; \
	fi
	pnpm new-post "$(title)"

# Clean build artifacts
clean:
	rm -rf dist/ .astro/ node_modules/

# Install dependencies and start dev server
setup: install dev

# Help command
help:
	@echo "Available commands:"
	@echo "  make install     - Install dependencies"
	@echo "  make dev        - Start development server"
	@echo "  make build      - Build for production"
	@echo "  make preview    - Preview production build"
	@echo "  make check      - Run type checking"
	@echo "  make format     - Format code"
	@echo "  make lint       - Lint code"
	@echo "  make new-post   - Create a new blog post (title='Post Title')"
	@echo "  make clean      - Remove build artifacts and dependencies"
	@echo "  make setup      - Install dependencies and start dev server"
	@echo ""
	@echo "Docker commands:"
	@echo "  make docker-build - Build Docker images"
	@echo "  make docker-up    - Start containers (Astro + Decap CMS proxy)"
	@echo "  make docker-down  - Stop and remove containers"
	@echo "  make docker-logs  - View container logs"
	@echo "  make docker-dev   - Build and start containers in one command"

# Docker commands
docker-build:
	docker compose build

docker-up:
	docker compose up -d

docker-down:
	docker compose down

docker-logs:
	docker compose logs -f

docker-dev: docker-build docker-up
	@echo "Containers started! Access:"
	@echo "  - Blog: http://localhost:4321"
	@echo "  - Decap CMS Admin: http://localhost:4321/admin"
	@echo "  - Decap Proxy: http://localhost:8081"
	@echo ""
	@echo "Run 'make docker-logs' to view logs"
	@echo "Run 'make docker-down' to stop containers"
