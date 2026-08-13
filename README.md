# Paycheck Allocator

A refined, ledger-style web app that calculates how much to set aside from each biweekly paycheck to cover monthly bills. Vanilla HTML / CSS / JS — no build step, no frameworks, no npm.

## Run locally

**Easiest:** double-click `index.html`. It works offline and stores your data in `localStorage`.

> Note: Service Worker registration only works over `http(s)://` (or `localhost`). If you open the file via `file://`, the app still works fully — it just won't install as a PWA until served. To test the PWA locally:
>
> ```bash
> # any static server works, e.g.:
> npx serve .
> # or
> python -m http.server 8000
> ```
> Then visit `http://localhost:8000`.

## Hosting

Drop the folder onto any static host:

- **GitHub Pages** — push the folder to a repo, enable Pages on the branch.
- **Netlify / Vercel / Cloudflare Pages** — drag-and-drop deploy.
- **Apache / Nginx / S3** — copy files to the web root.

No server-side code required.

## Install as a PWA

### iOS (Safari)
1. Open the hosted URL in Safari.
2. Tap the **Share** button.
3. Choose **Add to Home Screen**.
4. Confirm the name and tap **Add**. Launch from the home-screen icon for full-screen mode.

### Android (Chrome / Edge)
1. Open the hosted URL.
2. Tap the **⋮** menu.
3. Choose **Install app** (or **Add to Home Screen**).
4. Confirm. The app launches like a native app.

### Desktop (Chrome / Edge)
1. Visit the URL.
2. Click the install icon (⊕) in the address bar, or **Menu → Install Paycheck Allocator**.

## Tests

Open the app, scroll to the bottom of any view, expand **▸ Run tests**, and click **Run**. Assertions on the allocation engine print pass / fail.

## Files

```
paycheck-allocator/
├── index.html              # The app — HTML, CSS, JS inline
├── manifest.webmanifest    # PWA manifest
├── service-worker.js       # Cache-first SW for offline support
├── icon.svg                # PWA icon (vector, scales to any size)
└── README.md
```

## Data

- Bills: `localStorage["paycheck_allocator.bills"]` (JSON array)
- Pay start date: `localStorage["paycheck_allocator.pay_start"]` (ISO date)
- Frequency: `localStorage["paycheck_allocator.frequency"]`
- Theme: `localStorage["paycheck_allocator.theme"]` (`light` / `dark` / `auto`)

Use **Settings → Export** to back up, **Import** to restore, **Clear all** to reset.
