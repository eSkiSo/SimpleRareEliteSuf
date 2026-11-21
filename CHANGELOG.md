# Changelog

## [1.30] - 2026-06-12

### Changed
- Full code refactor: split into Core.lua and Config.lua
- Migrated options GUI to modern Settings API (`Settings.RegisterVerticalLayoutCategory`)
- Added `## Name` and localized `## Category` / `## Notes` to TOC
- Updated TOC interface to latest Retail versions
- Colored addon title in settings sidebar (`|cFF1ABC9CSimpleRareElite|r`)

### Fixed
- Options dropdowns now correctly reflect saved skin/frame level values
- ElvUI / Shadowed Unit Frames / Tukui target frame detection (timing issue on load)
- Various linter warnings suppressed via diagnostic comments
- Duplicate `SlashCmdList.SRE` error
- Removed unused `SRE_VERSION` global

## [1.29a] - 2026-06-12

### Changed
- Updated Interface version for latest Retail (120005, 120007)
- Updated dependencies

## [1.29] - 2025

### Fixed
- Options panel not working correctly

## [1.0] - Initial release
- Display Boss/Elite/Rare/RareElite textures on unit frames
- Support for Shadowed Unit Frames, ElvUI, and Tukui
- Multiple texture styles: Blurry, Classic, Modern, Tiny
