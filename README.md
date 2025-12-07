<div align = "center">

# Twilight

<table style="width: 100%; table-layout: fixed;">
   <tr>
      <td colspan="5"><img alt="Desktop" src="docs/image/Desktop.jpg" style="max-width: 100%;"></td>
   </tr>
   <tr>
      <td><img alt="Mobile_4" src="docs/image/Mobile_4.jpg" style="max-width: 100%;"></td>
      <td><img alt="Mobile_2" src="docs/image/Mobile_2.jpg" style="max-width: 100%;"></td>
      <td><img alt="Mobile_1" src="docs/image/Mobile_1.jpg" style="max-width: 100%;"></td>
      <td><img alt="Mobile_3" src="docs/image/Mobile_3.jpg" style="max-width: 100%;"></td>
      <td><img alt="Mobile_5" src="docs/image/Mobile_5.jpg" style="max-width: 100%;"></td>
   </tr>
</table>

A CMS integrated static blog template built with [Astro](https://astro.build) framework.

[![Bilibili](https://img.shields.io/badge/Bilibili-v1.0%20Intro-blue?logo=Bilibili&style=for-the-badge)](https://www.bilibili.com/video/BV18VsUzNEmL)&nbsp;
[![YouTube](https://img.shields.io/badge/YouTube-v1.0%20Intro-red?logo=YouTube&style=for-the-badge)](https://www.youtube.com/watch?v=VVEiOK8WAK0)

[**🖥️ Live Demo**](https://twilight.spr-aachen.com)
[**📝 Documentation**](https://docs.twilight.spr-aachen.com/en)

English | [**中文**](docs/README_ZH.md)

</div>

Forked from: https://github.com/Spr-Aachen/Twilight with a demo at https://twilight.spr-aachen.com/

```sh
#make help
make dev #pnpm dev --host
```

You now need two servers running for **local Decap CMS development**:

1. Astro dev server: `make dev` (port 4321)
2. Decap CMS proxy server: `npx decap-server` (port 8081)

> Go to `localhost:4321` to view your blog and to `/admin` to manage your blog via [DecapCMS](https://github.com/decaporg/decap-cms).

Configure Decap to work locally via `./public/admin/config.yml`

![alt text](z-snaps/decapcms-local.png)

![alt text](z-snaps/decapcms-admin-ui.png)

Media goes to `public/images` folder

![alt text](z-snaps/decap-media.png)

![alt text](public/images/decap-cms-working-locally.png)

And you can edit via:

![alt text](z-snaps/decap-post-editor.png)

That gets reflected back into the code:

![alt text](z-snaps/decap-post-md-changes.png)

---

## 📦 Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Spr-Aachen/Twilight.git
   cd Twilight
   ```

2. **Install dependencies:**
   ```bash
   # Install pnpm if not already installed
   npm install -g pnpm
   
   # Install project dependencies
   pnpm install
   ```

3. **Configure your blog:**
   - [Customize blog settings](https://docs.twilight.spr-aachen.com/en/config/core) inside `src/config.ts`
   - [Support CMS functionality](https://docs.twilight.spr-aachen.com/en/config/cms) inside `.env`
   - [Support Umami analytics](https://docs.twilight.spr-aachen.com/en/config/analytics) inside `.env`
   - [Update site information](https://docs.twilight.spr-aachen.com/en/config/data) inside `src/data`

4. **Start the development server:**
   ```bash
   pnpm dev
   ```


## 🚀 Deployment

Deploy your blog to any static hosting platform


## ⚡ Commands

| Command                    | Action                                  |
|:---------------------------|:----------------------------------------|
| `pnpm install`             | Install dependencies                    |
| `pnpm dev`                 | Start local dev server                  |
| `pnpm build`               | Build production site to `./dist/`      |
| `pnpm preview`             | Preview build locally before deployment |
| `pnpm check`               | Run Astro error checking                |
| `pnpm format`              | Format code with Biome                  |
| `pnpm lint`                | Check and fix code issues               |
| `pnpm new-post <filename>` | Create a new blog post                  |
| `pnpm astro ...`           | Run Astro CLI commands                  |


## 🙏 Acknowledgements

- Based on the original [Fuwari](https://github.com/saicaca/fuwari) template
- Inspired by [Yukina](https://github.com/WhitePaper233/yukina) & [Mizuki](https://github.com/matsuzaka-yuki/Mizuki) templates
- CMS functionality powered by [astro-decap-cms-oauth](https://github.com/dorukgezici/astro-decap-cms-oauth)
- Translation functionality powered by [translate](https://gitee.com/mail_osc/translate)