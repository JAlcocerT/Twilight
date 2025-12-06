# Local Decap CMS Setup Guide

This guide explains how to set up Decap CMS for local development, allowing you to edit content through a web interface while keeping your theme development in VS Code.

## Changes from Original Setup

### 1. Configuration Changes
- Added `local_backend: true` to enable local file system editing
- Removed GitHub OAuth and production-specific settings
- Simplified the backend configuration

### 2. New Files
- `z-local.md` (this file)

### 3. Updated Files
- `public/admin/config.yml` - Modified backend configuration
- `package.json` - Added new scripts (see below)

## Setup Instructions

### 1. Install Dependencies

```bash
pnpm add -D @decaporg/decap-cms-proxy-server
```

### 2. Update package.json Scripts

Add these scripts to your `package.json`:

```json"scripts": {
  "cms": "astro dev --host",
  "dev": "astro dev",
  "cms:standalone": "npx @decaporg/decap-cms-proxy-server"
}
```

### 3. Run the Local CMS

In one terminal, start the CMS proxy:
```bash
pnpm cms:standalone
```

In another terminal, start the development server:
```bash
pnpm cms
```

Access the CMS at: `http://localhost:4321/admin`

## Workflow

1. **Edit Content**
   - Make changes through the CMS interface at `http://localhost:4321/admin`
   - Changes are saved directly to your local files

2. **Review Changes**
   - All changes are reflected in your local files
   - Use VS Code to review the changes before committing

3. **Version Control**
   - Stage and commit your changes as usual
   - Push to GitHub when ready

## Security Notes

- This setup is for **local development only**
- The CMS is not protected by authentication when running locally
- Never commit sensitive information or credentials
- The `local_backend` setting is automatically ignored in production builds

## Troubleshooting

### CMS Not Loading
- Ensure both the proxy and dev server are running
- Check the browser console for errors
- Verify your `config.yml` has the correct indentation

### Changes Not Saving
- Make sure you have write permissions to the project directory
- Check that the file paths in `config.yml` are correct
- Look for errors in the terminal where the proxy is running

## Reverting to Production Setup

To switch back to the production configuration, simply remove or comment out the `local_backend` line in `public/admin/config.yml` and restore any production-specific settings.
