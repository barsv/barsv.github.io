---
layout: post
title: "How to Manually Install a GNOME Extension on Pop!_OS 22.04"
date: 2025-03-29
categories: [linux]
tags: [gnome, popos, workaround]
---

Installing GNOME Shell extensions on Pop!_OS (or Ubuntu) is supposed to be easy. 
[Documentation says](https://pop-os.github.io/docs/customize-pop/gnome-tweaks-extensions/gnome-extensions.html) that 
there is an extension manager. But not all extensions are there. 
The Install button on the 
[extension page](https://extensions.gnome.org/extension/5282/alttab-scroll-workaround/) also didn't 
work for me because I wasn't able to install `gnome-browser-connector` that [replaced](https://gnome.pages.gitlab.gnome.org/gnome-browser-integration/pages/installation-guide.html#chrome_gnome_shell_and_gnome_browser_connector) the chrome-gnome-shell package.

After trying several suggestions from ChatGPT I installed it manually with the following steps:

```bash
# 1. Find current GNOME version to download the corrent zip from the extension page:
gnome-shell --version

# 2. Create the extensions directory if it doesn't exist
mkdir -p ~/.local/share/gnome-shell/extensions

# 3. Unzip the archive to a temporary folder
unzip alttab-scroll-workaroundlucasresck.github.io.v4.shell-extension.zip -d ~/.local/share/gnome-shell/extensions/temp

# 4. Get UUID of the extension
vi ~/.local/share/gnome-shell/extensions/temp/metadata.json

# 4. Rename the folder to match the extension's UUID
mv ~/.local/share/gnome-shell/extensions/temp ~/.local/share/gnome-shell/extensions/alt-tab-scroll-workaround@lucasresck.github.io

# 5. Restart GNOME Shell on X11:
Alt+F2, type 'r', press Enter

# 6. Enable the extension
gnome-extensions enable alt-tab-scroll-workaround@lucasresck.github.io
```

---

**What Can Go Wrong:**
- If `gnome-extensions enable` says "does not exist", check that the folder name matches the `uuid` inside `metadata.json`.
- Ensure your `metadata.json` has a matching GNOME Shell version, e.g.,:

```json
"shell-version": ["42", "43"]
```

- After adding a new extension folder, GNOME won't detect it until the session is restarted.
