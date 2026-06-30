cask "mangolove-idea" do
  version "0.1.18"
  sha256 "82e7c74de48262dcc5466b0479cb2707711a9b636d6820625211165f2badb041"

  url "https://github.com/SongJunSub/mangolove-idea/releases/download/v#{version}/MangoLove.IDEA-#{version}-arm64.dmg"
  name "MangoLove IDEA"
  desc "Local dev orchestrator for parallel git-worktree work beside IntelliJ IDEA"
  homepage "https://github.com/SongJunSub/mangolove-idea"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "MangoLove IDEA.app"

  # The build is UNSIGNED (Apple notarization needs a paid Developer account). Homebrew
  # always quarantines cask artifacts, which would trip Gatekeeper's "unidentified
  # developer" prompt on first launch. Strip the quarantine attribute post-install so the
  # app opens directly — exactly what `xattr -dr com.apple.quarantine <app>` does by hand.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MangoLove IDEA.app"]
  end

  zap trash: [
    "~/Library/Application Support/MangoLove IDEA",
    "~/Library/Caches/me.onda.mangolove-idea",
    "~/Library/Preferences/me.onda.mangolove-idea.plist",
    "~/Library/Saved Application State/me.onda.mangolove-idea.savedState",
  ]
end
