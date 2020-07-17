class Subread < Formula
  # cite Liao_2013: "https://doi.org/10.1093/nar/gkt214"
  desc "High-performance read alignment, quantification and mutation discovery"
  homepage "https://academic.oup.com/nar/article/41/10/e108/1075719"
  url "https://cfhcable.dl.sourceforge.net/project/subread/subread-2.0.1/subread-2.0.1-source.tar.gz"
  sha256 "d808eb5b1823c572cb45a97c95a3c5acb3d8e29aa47ec74e3ca1eb345787c17b"

  bottle do
    cellar :any_skip_relocation
    root_url "https://linuxbrew.bintray.com/bottles-bio"
    sha256 "632afd9717234c43b98b916515f1619cc7aa5e08a92ef4c9b7c46f7411d0399a" => :mojave
    sha256 "7b9dc00896b75d340e779082e8850ecdd0655babf4d8d3c370a4246d9f0fafc8" => :x86_64_linux
  end

  uses_from_macos "zlib"

  def install
    cd "src" do
      if OS.mac?
        system "make", "-f", "Makefile.MacOS"
      else
        system "make", "-f", "Makefile.Linux"
      end

      bin.install Dir["../bin/sub*"]
      bin.install "../bin/exactSNP"
      bin.install "../bin/featureCounts"
      bin.install Dir["../bin/utilities/*"]
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/featureCounts -v 2>&1")
  end
end
