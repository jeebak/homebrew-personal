class Gita < Formula
  include Language::Python::Virtualenv

  desc "Manage many git repos with sanity 从容管理多个git库"
  homepage "https://github.com/nosarthur/gita"
  url "https://github.com/nosarthur/gita/archive/refs/tags/v0.16.2.tar.gz"
  sha256 "a292ac7e7dbf36959e9a0e349a2a672a480dfe5dab03d87b53fc552ee070a2af"
  license "MIT"
  head "https://github.com/nosarthur/gita.git", branch: "master"

  # https://github.com/nosarthur/gita/issues/91
  depends_on "python@3.9"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "false"
  end
end
