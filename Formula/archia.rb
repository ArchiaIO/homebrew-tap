class Archia < Formula
  desc "Command-line interface for Archia"
  homepage "https://archia.app"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://archia-distribution.s3.us-east-1.amazonaws.com/archia-cli/archia-0.35.1-aarch64-apple-darwin.tar.gz"
    sha256 "9cd5572450a6e07fdd5d7d214eb5fa11c49d07adb214b3e96d7fd59118742951"
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
