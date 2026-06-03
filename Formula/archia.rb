class Archia < Formula
  desc "Command-line interface for Archia"
  homepage "https://archia.app"
  version "0.20.1"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArchiaIO/core/releases/download/v0.20.1/archia-0.20.1-aarch64-apple-darwin.tar.gz"
    sha256 "8fc37b9ebcf08adce2763db0cd6b42c39161151dbf673175e1de9fa7dd102d81"
  else
    odie "Archia Homebrew currently supports Apple Silicon Macs only."
  end

  def install
    bin.install "bin/archia"
    man1.install "share/man/man1/archia.1"
    bash_completion.install "share/bash-completion/completions/archia"
    zsh_completion.install "share/zsh/site-functions/_archia"
    fish_completion.install "share/fish/vendor_completions.d/archia.fish"
  end

  test do
    assert_match "ARCHIA(1)", shell_output("#{bin}/archia man")
    assert_match "_archia", shell_output("#{bin}/archia completion zsh")
  end
end
