class Relay < Formula
  desc "Get started developing Relay Workflows"
  version "0.0.4"
  homepage "https://api-docs.relaypro.com/"
  url "https://relaygo.link/packages/relay-v0.0.4/relay-v0.0.4.tar.gz"
  sha256 "5e0c2ebeb9cfe9f7b59e4d21a3d6beea53898d7848b3909d53b0453e3cc8a1f0"
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
