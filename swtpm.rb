# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Swtpm < Formula
  desc "Libtpms-based TPM emulator with socket, character device, and Linux CUSE interface."
  homepage ""
  url "https://github.com/stefanberger/swtpm/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "bed41871ad42ec852c450f5764be36b6c16456b943b912351eca9c29ce382976"
  license "NOASSERTION"

  # depends_on "cmake" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "socat"
  depends_on "gawk"
  depends_on "gnutls"
  depends_on "json-glib"
  depends_on "discoteq/discoteq/flock"
  depends_on "spikespaz/jacob/libtpms"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args

    system "./autogen.sh", "--prefix=#{prefix}", "--with-openssl"
    system "make"
    system "make install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test swtpm`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
