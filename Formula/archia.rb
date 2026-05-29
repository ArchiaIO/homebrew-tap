class Archia < Formula
  desc "Command-line interface for Archia"
  homepage "https://archia.app"
  version "0.20.0-rc1"
  license :cannot_represent

  if OS.mac? && Hardware::CPU.arm?
    url "https://archia-distribution.s3.us-east-1.amazonaws.com/archia-cli/archia-0.20.0-rc1-aarch64-apple-darwin.tar.gz"
    sha256 "48029a85b20fd42e4085843b752b2f6e7fa72cec780b820ef4661e8a8f4a7b0c"
  else
    odie "Archia Homebrew RC1 currently supports Apple Silicon Macs only."
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
