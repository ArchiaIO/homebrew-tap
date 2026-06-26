class Archia < Formula
  desc "Command-line interface for Archia"
  homepage "https://archia.app"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://archia-distribution.s3.us-east-1.amazonaws.com/archia-cli/archia-0.24.1-aarch64-apple-darwin.tar.gz"
    sha256 "d9c5766a8b80e739acd4432cd62e8c2c90a19ff11d85900f784000a4b33fbad8"
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
