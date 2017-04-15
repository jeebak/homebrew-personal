class Jasspa < Formula
  desc "Jasspa's MicroEmacs"
  homepage "http://www.jasspa.com/"
  url "http://www.jasspa.com/release_20090909/jasspa-mesrc-20091011.tar.gz"
  sha256 "44109a9118da34a1d026450ec85a3f85d983c4015c97db2b9abbad69e8d90889"
  version "20091011"

  depends_on :x11

  resource "metree" do
    url "http://www.jasspa.com/release_20090909/jasspa-metree-20091017.tar.gz"
    sha256 "761d3bda7a7e124ce8028b8d3514c6d8412ea4a5cb1e8d0173973c5a028de52d"
  end

  def install
    cd 'src' do
      system "./build"
      system "mv me mecw #{prefix}"
      bin.install "#{prefix}/me"
      bin.install "#{prefix}/mecw"
    end

    (share/"jasspa").install resource("metree")
  end

  test do
    system "false"
  end
end
