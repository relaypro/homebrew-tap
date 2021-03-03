class Relay < Formula
  desc "Get started developing Relay Workflows"
  version "0.0.3"
  homepage "https://api-docs.relaypro.com/"
  url "https://relaygo.link/packages/relay-v0.0.3/relay-v0.0.3.tar.gz"
  sha256 "ec7cca23b5dc9374fb0dc17a3e06cd59967c27026eed4addf31763c570cb748d"
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
