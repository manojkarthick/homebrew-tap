class Czk < Formula
  include Language::Python::Virtualenv

  desc "CLI wrapper around czkawka_cli for duplicate media workflows"
  homepage "https://github.com/manojkarthick/czk"
  url "https://files.pythonhosted.org/packages/14/d1/fce0d461eae77c76b54fba721685dc0de9736bb6a753f3c07234a28e6c94/czk_tool-1.0.9.tar.gz"
  sha256 "96c6faa05a5a7eb0686d1b149c4caf631dbc9337b1f47aff24e11c659f9d7599"
  version "1.0.9"
  license "MIT"

  depends_on "python@3.14"
  depends_on "czkawka"
  depends_on "duckdb"

  resource "czk-tool" do
    url "https://files.pythonhosted.org/packages/14/d1/fce0d461eae77c76b54fba721685dc0de9736bb6a753f3c07234a28e6c94/czk_tool-1.0.9.tar.gz"
    sha256 "96c6faa05a5a7eb0686d1b149c4caf631dbc9337b1f47aff24e11c659f9d7599"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c/pygments-2.20.0.tar.gz"
    sha256 "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/b3/c6/f3b320c27991c46f43ee9d856302c70dc2d0fb2dba4842ff739d5f46b393/rich-14.3.3.tar.gz"
    sha256 "b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "1.0.9", shell_output("#{bin}/czk --version")
  end
end
