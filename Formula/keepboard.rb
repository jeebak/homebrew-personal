class Keepboard < Formula
  desc "Cross-platform clipboard manager. Saves clipboard history."
  homepage "https://sourceforge.net/projects/keepboard/"
  url "http://downloads.sourceforge.net/project/keepboard/Keepboard_Linux_5.1.zip"
  sha256 "312d749fb8e8b4fca629ac43d7802cbc48e0cd196f35151937c3ce9e3150981e"

  def install
    libexec.install "jar.jar"

    (bin/"keepboard").write <<-EOS.undent
      #!/usr/bin/env bash
      [[ ! -d "$HOME/.config/keepboard" ]] && mkdir -p "$HOME/.config/keepboard"
      cd "$HOME/.config/keepboard"
      exec java -jar "#{libexec}/jar.jar" "$@"
    EOS
  end

  test do
    system "#{bin}/hexeditor"
  end
end
