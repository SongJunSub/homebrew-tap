# SongJunSub/homebrew-tap

[Homebrew](https://brew.sh) tap for [**MangoLove IDEA**](https://github.com/SongJunSub/mangolove-idea)
— a worktree-based local dev orchestrator (Electron desktop app, macOS arm64).

## Install

```bash
brew tap SongJunSub/tap
brew trust SongJunSub/tap          # one-time: the cask runs a post-install step
brew install --cask mangolove-idea
```

The build is **unsigned** (Apple notarization requires a paid Apple Developer account).
The cask's `postflight` strips the Gatekeeper quarantine right after install, so the app
opens **without** the "unidentified developer" prompt — no flag needed (Homebrew removed
the old `--no-quarantine` flag; the cask does the equivalent itself).

Because that post-install step runs code, Homebrew **requires a one-time
`brew trust SongJunSub/tap`** before installing (otherwise it refuses the cask). After
trusting once, every `install`/`upgrade` is clean — no Gatekeeper prompt, ever.

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
