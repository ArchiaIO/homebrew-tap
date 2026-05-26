class Archia < Formula
  desc "Archia CLI"
  homepage "https://archia.io"
  version "0.19.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://archia-distribution.s3.us-east-1.amazonaws.com/archia-cli/archia-v0.19.1-darwin-arm64.tar.gz"
    sha256 "8f2895d5ee5c3f257e66f0397baa48b02bbbc715d1272dea3761129dbbeb6ee1"
  else
    odie "Archia only supports Apple Silicon Macs."
  end

  def install
    bin.install "archia"
  end

  test do
    system "#{bin}/archia", "--version"
  end
end