# SimpleRareElite

Display **Boss**, **Elite**, **Rare**, and **RareElite** indicator textures on unit frames.

Fork of [SimpleRareElite](https://legacy.curseforge.com/wow/addons/simplerareelite) by Meky, updated for latest WoW Retail.

## Changes from original

The original addon stopped working after a WoW patch. This fork includes:

- **Updated TOC** — interface version bumped to latest Retail
- **Code refactor** — split into `Core.lua` and `Config.lua` for maintainability
- **Modern Settings API** — migrated from deprecated `InterfaceOptions_AddCategory` to `Settings.RegisterVerticalLayoutCategory` with proper dropdown controls
- **Fixed ElvUI/SUF/Tukui detection** — target frame globals are now resolved at `PLAYER_LOGIN` instead of load time, fixing a race condition
- **Fixed saved variables** — dropdowns now correctly reflect saved `skin` and `fl` values after reload
- **Colored sidebar** — addon name in options panel uses miint color (`|cFF1ABC9C`)
- **Localized metadata** — added `## Name`, `## Category-*`, `## Notes-*` in multiple languages
- **Texture styles** — 4 styles available: Blurry, Classic, Modern, Tiny

## Supported Unit Frames

- [ElvUI](https://tukui.org/elvui)
- [Shadowed Unit Frames](https://www.curseforge.com/wow/addons/shadowed-unit-frames)
- [Tukui](https://tukui.org/tukui)

## Usage

- `/sre` or `/simplerareelite` — opens the settings panel
- Change target to see the texture update

## Installation

1. `git clone https://github.com/Kirri777/SimpleRareElite.git`
2. Copy `SimpleRareElite` folder to `World of Warcraft\_retail_\Interface\AddOns\`
3. Restart WoW or `/reload`

Or download the [latest release](https://github.com/Kirri777/SimpleRareElite/releases/latest) and extract to `Interface\AddOns\`.

## Credits

- **Meky** — original author
- **Hati** — contributions
- **Eskiso** — SUF support
- **Kirri** — Retail updates and maintenance