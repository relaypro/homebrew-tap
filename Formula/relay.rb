class Relay < Formula
  desc "Get started developing Relay Workflows"
  version "0.0.1"
  homepage "https://api-docs.relaypro.com/"
  url "https://relaygo.link/packages/relay-v0.0.1/relay-v0.0.1.tar.gz"
  sha256 "556b2764c39cd371444b64fe39ceed9d591eb3fd4c7f9efa1550cebec1af50cc"
  depends_on "node@14"

  def install
    inreplace "bin/relay", /^CLIENT_HOME=/, "export RELAY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/relay", "\"$DIR/node\"", "#{Formula["node@14"].bin}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/relay"
  end

  def caveats; <<~EOS

  EOS
  end

  test do
    system bin/"relay", "version"
  end
end
