class Aee < Formula
  desc "Another Easy Editor"
  homepage "https://archive.org/details/tucows_8034_Another_Easy_Editor"
  url "https://archive.org/download/tucows_8034_Another_Easy_Editor/aee-2.2.15b.tar.gz"
  sha256 "7abbaffe35018f9de87c8685f9bee2ea3f261e88ce60674f1a5a9a3a0f54d752"
  version "2.2.15b"

  def install
    system "sed -i .bak 's|mkdir |mkdir -p |;s|/usr/local|#{prefix}|g;s|#{prefix}/aee|#{prefix}/lib/aee|g' install-sh"
    system "for i in aee.1 aee.msg catalog.aee help.c localize.c; do sed -i .bak 's|/usr/local/lib/help.ae|/usr/local/lib/aee/help.ae|g' $i; done"
    system "make localaee && make && make install"
  end

  test do
    system "false"
  end
end
