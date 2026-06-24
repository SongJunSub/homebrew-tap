# SongJunSub/homebrew-tap

[Homebrew](https://brew.sh) tap for [**MangoLove IDEA**](https://github.com/SongJunSub/mangolove-idea)
— a worktree-based local dev orchestrator (Electron desktop app, macOS arm64).

## Install

```bash
brew tap SongJunSub/tap
brew install --cask --no-quarantine mangolove-idea
```

`--no-quarantine` is needed because the build is **unsigned** (Apple notarization
requires a paid Apple Developer account). It tells Gatekeeper to trust the app so it
opens without the "unidentified developer" prompt. Omit the flag and you'll get the
prompt on first launch (clear it once via System Settings → Privacy & Security → "Open
Anyway"). The app itself is unaffected either way.

## Upgrade / uninstall

```bash
brew upgrade --cask mangolove-idea
brew uninstall --cask mangolove-idea          # add --zap to also remove app data
```

## Maintainer note

The cask is pinned per release (`version` + `sha256`). On a new MangoLove IDEA release,
bump both in `Casks/mangolove-idea.rb` (the `sha256` is of the published
`MangoLove.IDEA-<version>-arm64.dmg`). `brew livecheck mangolove-idea` reports new
upstream versions.
