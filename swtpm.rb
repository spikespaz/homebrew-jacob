class Swtpm < Formula
  desc "Libtpms-based TPM emulator with socket, character device, and Linux CUSE interface."
  homepage "https://github.com/stefanberger/swtpm"
  url "https://github.com/stefanberger/swtpm/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "bed41871ad42ec852c450f5764be36b6c16456b943b912351eca9c29ce382976"
  license :cannot_represent

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "socat" => :build
  depends_on "gawk" => :build
  depends_on "json-glib" => :build
  depends_on "discoteq/discoteq/flock" => :build
  depends_on "spikespaz/jacob/libtpms"
  depends_on "openssl@1.1"
  # depends_on "openssl@3"
  depends_on "libtasn1"
  depends_on "gnutls"
  depends_on "glib"

  def install
    system "./autogen.sh", "--prefix=#{prefix}", "--with-openssl"
    system "make"
    system "make install"
  end

  test do
    assert_equal shell_output("#{bin}/swtpm --version").strip, "TPM emulator version 0.7.0, Copyright (c) 2014-2021 IBM Corp."
  end
end
