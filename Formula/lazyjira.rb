class Lazyjira < Formula
  desc "Terminal UI for Jira"
  homepage "https://github.com/textfuel/lazyjira"
  head "https://github.com/textfuel/lazyjira.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    commit = Utils.git_short_head
    ldflags = "-s -w -X main.version=#{commit}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/lazyjira"
  end

  test do
    assert_match "lazyjira", shell_output("#{bin}/lazyjira --version")
  end
end
