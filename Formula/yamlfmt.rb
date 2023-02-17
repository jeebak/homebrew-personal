class Yamlfmt < Formula
  desc "An extensible command line tool or library to format yaml files."
  homepage "https://github.com/google/yamlfmt"
  url "https://github.com/google/yamlfmt/releases/download/v0.7.1/yamlfmt_0.7.1_Darwin_x86_64.tar.gz"
  sha256 "0843c0a822674d76c9c4f3114d8d0fce721b019eeb73897af85cb726f6b1fbe4"
  version "v0.7.1"

  def install
    bin.install "yamlfmt"
  end

  test do
    system "false"
  end
end
