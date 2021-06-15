class Relay < Formula
  desc "Get started developing Relay Workflows"
  version "0.1.0"
  homepage "https://api-docs.relaypro.com/"
  url "https://relaygo.link/packages/relay-v0.1.1/relay-v0.1.1.tar.gz"
  sha256 "e59056f40c609776bef5b1f26c68c89f6fcf96175e9ef187fea5cc2eddc37fc0"
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
