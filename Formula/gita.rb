class Gita < Formula
  include Language::Python::Virtualenv

  desc "Manage many git repos with sanity 从容管理多个git库"
  homepage "https://github.com/nosarthur/gita"
  url "https://github.com/nosarthur/gita/archive/refs/tags/v0.16.7.2.tar.gz"
  sha256 "9ae73a3fda7cc242017f496ccc7494d18e2ccc1f1d82eed137a1f7d6c2b7de03"
  license "MIT"
  head "https://github.com/nosarthur/gita.git", branch: "master"

  depends_on "python@3.12"

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/5f/39/27605e133e7f4bb0c8e48c9a6b87101515e3446003e0442761f6a02ac35e/argcomplete-3.5.1.tar.gz"
    sha256 "eb1ee355aa2557bd3d0145de7b06b2a45b0ce461e1e7813f5d066039ab4177b4"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "false"
  end
end
