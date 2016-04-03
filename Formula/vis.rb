class Vis < Formula
  desc ""
  homepage ""
  url "https://github.com/martanne/vis/archive/v0.2.tar.gz"
  version "0.2"
  sha256 "3e5b81d760849c56ee378421e9ba0f653c641bf78e7594f71d85357be99a752d"

  depends_on "libtermkey"
  depends_on "luarocks"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    system "luarocks", "install", "lpeg"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test vis`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
