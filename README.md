# Orbit Hub

Themes, setups, skins and plugins for [Orbit](https://github.com/0xSnww/roblox-client), the Roblox launcher. Browse and install them from Orbit's **Customize → Hub**.

## What's here

| Folder | What | Made in Orbit with |
| --- | --- | --- |
| `themes/` | Colour themes (`.json`) | Customize → Theme → Customize this theme (files land in `%LOCALAPPDATA%\Orbit\themes`) |
| `setups/` | A whole look: theme, backdrop, Home layout, HUD (`.orbit`) | Customize → Share → Save as file |
| `skins/` | Texture, sound and cursor packs (`.orbitskin`) | Customize → Skins → Pack my Mods folder |
| `plugins/` | Luau plugins (`main.luau`) | Customize → Plugins → New plugin |

## Submitting something

1. Fork this repo and add your file to the right folder.
2. Add an entry for it to `catalog.json`:

   ```json
   {
     "id": "my-theme",
     "kind": "theme",
     "name": "My theme",
     "author": "you",
     "description": "One sentence about it.",
     "file": "themes/my-theme.json"
   }
   ```

   `id` is lowercase letters, digits and dashes. `kind` is `theme`, `setup`, `skin` or `plugin`. Plugins also list their `permissions` and a `version`; a skin's `name` must match its `skin.json`.
3. Open a pull request. Don't edit `index.signed`.

Setups never carry FastFlags here, and plugins only get the permissions you grant them in Orbit.

## How Orbit trusts this repo

Orbit reads only `index.signed`: a signature line, then the index. It uses the index only when the signature is valid for the hub key built into Orbit. The index lists every file's size and SHA-256, and Orbit checks each download against it. So a change to this repo that isn't signed (including a malicious pull request merged by mistake) never reaches anyone.

Signed means "listed by the maintainer", not "can't do harm": Orbit still shows a setup's changes before applying it, checks skins file by file, and installs plugins switched off with their permissions shown.

After merging submissions, the maintainer runs `orbit-sign hub <this folder> <hub key>` to check every item and re-sign the index.
