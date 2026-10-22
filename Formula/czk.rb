class Czk < Formula
  include Language::Python::Virtualenv

  desc "CLI wrapper around czkawka_cli for duplicate media workflows"
  homepage "https://github.com/manojkarthick/czk"
  url "https://files.pythonhosted.org/packages/f9/f7/a5e1f15ae511eb5515cea7bdccd8e8985825e28ad991e3d72be407d3014d/czk_tool-2.0.0.tar.gz"
  sha256 "7deba34791cd54b450fde5034c0a1eb7ab78bb31fc1b40f3968502ad3edfdd22"
  version "2.0.0"
  license "MIT"

  depends_on "python@3.14"
  depends_on "czkawka"
  depends_on "duckdb"

  resource "czk-tool" do
    url "https://files.pythonhosted.org/packages/f9/f7/a5e1f15ae511eb5515cea7bdccd8e8985825e28ad991e3d72be407d3014d/czk_tool-2.0.0.tar.gz"
    sha256 "7deba34791cd54b450fde5034c0a1eb7ab78bb31fc1b40f3968502ad3edfdd22"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "Send2Trash" do
    url "https://files.pythonhosted.org/packages/c5/f0/184b4b5f8d00f2a92cf96eec8967a3d550b52cf94362dad1100df9e48d57/send2trash-2.1.0.tar.gz"
    sha256 "1c72b39f09457db3c05ce1d19158c2cbef4c32b8bedd02c155e49282b7ea7459"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/czk"
  end

  test do
    assert_match "2.0.0", shell_output("#{bin}/czk --version")
  end
end
