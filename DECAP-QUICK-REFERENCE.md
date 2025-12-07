# Decap CMS Quick Reference

## Why Two Processes?

### The Problem

Browsers **cannot directly access your file system** for security reasons. When you edit a blog post in Decap CMS (which runs in your browser), it needs a way to save that markdown file to your computer.

### The Solution

**Two separate processes work together:**

1. **Astro Dev Server** (Port 4321)
   - Serves your website
   - Provides the Decap CMS admin interface at `/admin`
   - Hot-reloads when files change

2. **Decap CMS Proxy Server** (Port 8081)
   - Provides an API for file operations
   - Reads/writes markdown files
   - Handles image uploads
   - Makes Git commits

### The Flow

```
You edit in browser → Decap CMS → API call to proxy → Proxy writes file → Astro detects change → Browser refreshes
```

## Running Locally

### Option 1: Bare Metal (Two Terminals)

**Terminal 1:**

```bash
make dev
```

**Terminal 2:**
```bash
npx decap-server
```

### Option 2: Docker (One Command)

```bash
make docker-dev
```

## Common Commands

### Bare Metal
```bash
# Install dependencies
pnpm install

# Start Astro dev server
make dev

# Start Decap proxy (in another terminal)
npx decap-server

# Create new post
make new-post title="My Post Title"
```

### Docker
```bash
# Start everything
make docker-dev

# View logs
make docker-logs

# Stop everything
make docker-down

# Rebuild containers
make docker-build
```

## File Locations

| What | Where |
|------|-------|
| Blog posts | `src/content/posts/*.md` |
| Uploaded images | `public/images/` |
| CMS config | `public/admin/config.yml` |
| Site config | `src/config.ts` |

## Decap CMS Config

**For local development** (`public/admin/config.yml`):

```yaml
backend:
  name: git-gateway
  branch: main

local_backend: true  # Enables local proxy server

collections:
  - name: "posts"
    label: "Posts"
    folder: "src/content/posts"
    create: true
```

**For production** (GitHub):
```yaml
backend:
  name: github
  repo: username/repository
  branch: main

# No local_backend needed
```

## Troubleshooting

### "Failed to load entries: Not Found"
**Problem:** Decap proxy server is not running

**Solution:**
```bash
# Bare metal: Start proxy in second terminal
npx decap-server

# Docker: Ensure both containers are running
make docker-logs
```

### "Port 4321 already in use"

**Problem:** Another process is using the port

**Solution:**
```bash
# Find and kill the process
lsof -i :4321
kill -9 <PID>

# Or use a different port
pnpm dev --port 3000
```

### Changes not showing in CMS

**Problem:** Browser cache or proxy not syncing

**Solution:**
```bash
# Hard refresh browser
Ctrl+Shift+R (or Cmd+Shift+R on Mac)

# Restart proxy server
# Ctrl+C to stop, then:
npx decap-server
```

## Production Deployment

In production, you **don't need the proxy server**. Decap CMS talks directly to your Git provider (GitHub, GitLab, etc.).

**Steps:**
1. Build your site: `make build`
2. Deploy to hosting (Vercel, Netlify, Cloudflare Pages)
3. Configure OAuth for Decap CMS
4. Update `config.yml` to use GitHub backend

## Key Differences: Development vs Production

| Aspect | Development | Production |
|--------|-------------|------------|
| Backend | Local proxy server | GitHub/GitLab API |
| Authentication | None (local) | OAuth |
| Processes | 2 (Astro + Proxy) | 1 (Static hosting) |
| Git commits | Automatic via proxy | Via GitHub API |

## Quick Tips

✅ **DO:**
- Run both processes for local CMS development
- Use Docker for simpler setup
- Commit your changes regularly
- Test CMS functionality locally before deploying

❌ **DON'T:**
- Try to use CMS without the proxy server running
- Edit files directly while CMS is open (conflicts)
- Forget to configure OAuth for production
- Commit sensitive data in `config.yml`

## Resources

- [Decap CMS Docs](https://decapcms.org/docs/intro/)
- [Astro Docs](https://docs.astro.build/)
- [Docker Compose Docs](https://docs.docker.com/compose/)
- [Full Docker Setup Guide](DOCKER.md)