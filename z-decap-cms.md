# Decap CMS Self-Hosting Guide

This guide covers different ways to self-host Decap CMS (formerly Netlify CMS) with your Astro site.

## Table of Contents

- [Local Development Setup](#local-development-setup)
- [Git Gateway (Netlify)](#git-gateway-netlify)
- [Self-Hosted Git Server](#self-hosted-git-server)
- [Custom Proxy Server](#custom-proxy-server)
- [Static Site Hosting](#static-site-hosting)

## Local Development Setup

Easiest way to get started without authentication:

1. Edit `public/admin/config.yml`:
   ```yaml
   backend:
     name: git-gateway
     local_backend: true  # Enables local backend
   ```

2. Start the development server:
   ```bash
   pnpm dev
   ```

3. Access the CMS at `http://localhost:4321/admin`

## Git Gateway (Netlify)

For production use with Netlify's authentication:

```yaml
backend:
  name: git-gateway
  branch: main  # your default branch
  commit_messages:
    create: "Create {{collection}} '{{slug}}'"
    update: "Update {{collection}} '{{slug}}'"
    delete: "Delete {{collection}} '{{slug}}'"
```

## Self-Hosted Git Server

Works with Gitea, GitLab CE, Gogs, etc.:

```yaml
backend:
  name: git-gateway
  repo: your-username/your-repo  # format: username/repo
  branch: main
  api_root: https://your-git-instance.com/api/v1  # for Gitea/Gogs
  site_domain: your-site.com
```

## Custom Proxy Server

For complete control over authentication:

1. Create a simple Node.js server (`server.js`):
   ```javascript
   const express = require('express');
   const { GitHubBackend } = require('decap-cms-backend-github');
   const app = express();
   
   // Your authentication middleware
   app.use('/api', (req, res, next) => {
     // Add your auth logic here
     next();
   });
   
   app.listen(3000, () => {
     console.log('CMS Proxy Server running on port 3000');
   });
   ```

2. Update `config.yml`:
   ```yaml
   backend:
     name: proxy
     proxy_url: http://localhost:3000/api
   ```

## Static Site Hosting

### Vercel
```yaml
backend:
  name: vercel
  repo: your-username/your-repo
  branch: main
  base_url: https://your-site.vercel.app
```

### Cloudflare Pages
```yaml
backend:
  name: git-gateway
  branch: main
  # Enable in Cloudflare Pages settings
  # Add GIT_GATEWAY_API_URL in environment variables
```

## Authentication Methods

### Basic Auth
```yaml
backend:
  name: git-gateway
  auth_scope: repo  # or 'public_repo' for public repositories
```

### OAuth (GitHub/GitLab)
```yaml
backend:
  name: git-gateway
  auth_endpoint: https://your-auth-server.com/oauth/authorize
```

## Environment Variables

For sensitive data, use environment variables in `config.yml`:

```yaml
backend:
  name: git-gateway
  repo: ${REPOSITORY}
  branch: ${BRANCH}
```

## Troubleshooting

1. **CORS Issues**
   - Ensure your server sends proper CORS headers
   - Example for Express:
     ```javascript
     app.use((req, res, next) => {
       res.header('Access-Control-Allow-Origin', '*');
       res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
       next();
     });
     ```

2. **Authentication Problems**
   - Double-check OAuth credentials
   - Verify callback URLs
   - Check server logs for errors

## Security Considerations

1. Always use HTTPS in production
2. Implement rate limiting
3. Keep dependencies updated
4. Use environment variables for sensitive data
5. Regularly backup your content

## Resources
- [Official Decap CMS Documentation](https://decapcms.org/docs/intro/)
- [GitHub Repository](https://github.com/decaporg/decap-cms)
- [Community Forum](https://github.com/decaporg/decap-cms/discussions)
