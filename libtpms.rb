# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Libtpms < Formula
  desc "The libtpms library provides software emulation of a Trusted Platform Module (TPM 1.2 and TPM 2.0)"
  homepage "https://github.com/stefanberger/swtpm"
  url "https://github.com/stefanberger/libtpms/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "9a4d1ed07b78142c394faad1a1481771d470048f5859e80593fe42c82e5635a5"
  license :cannot_represent

  # depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "openssl@3"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args

    system "./autogen.sh", "--prefix=#{prefix}", "--with-openssl", "--with-tpm2"
    system "make"
    system "make install"

    # prefix.install "README"
    # prefix.install "LICENSE"
    # prefix.install "CHANGES"
    prefix.install "CREDITS"
  end
end
