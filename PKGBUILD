pkgname=ame
pkgver=1.0.0
pkgrel=1
pkgdesc="A Nix, pacman, distrobox, flatpak and snap wrapper for AntisOS"
arch=('x86_64')
url="https://example.com/project-homepage"
license=('GPL')
# Use 'depends' for dependencies required at runtime
depends=()
# Use 'makedepends' for dependencies only needed to build the package (e.g., git, cmake, g++)
makedepends=(pyinstaller)
# List the source files, usually a tarball URL or a git repository
source=("git+https://github.com/franiekidos/amo.git")
# Optional: Add integrity checks for the source file
sha256sums=(SKIP)

build() {
    cd $srcdir
    sh ./compile.sh
}

package() {
    install -Dm755 $srcdir/amo-dist/amo ${pkgdir}/usr/bin/amo
}