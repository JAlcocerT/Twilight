.PHONY: dev build preview check format lint new-post install clean

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
