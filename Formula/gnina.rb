class Gnina < Formula
  desc "Molecular docking program with integrated CNN support"
  homepage "https://github.com/gnina/gnina"
  url "https://github.com/gnina/gnina/archive/refs/tags/v1.3.tar.gz"
  sha256 "79630705190576669c9613cc3e1e63f1122cba4e363e73c3a0bd7e21f76f443f"
  license all_of: ["GPL-3.0-only", "Apache-2.0"]
  head "https://github.com/gnina/gnina.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "eigen"
  depends_on "glog"
  depends_on "protobuf"
  depends_on "hdf5"
  depends_on "openblas"
  depends_on "jsoncpp"
  depends_on "open-babel"
  depends_on "rdkit"
  depends_on "python@3.11" => [:build, :test]

  on_linux do
    def install
        system "cmake", ".", *std_cmake_args
        system "make", "install"
    end

    test do
        output = shell_output("#{bin}/gnina --version")
        assert_match "gnina", output
    end
  end
end
