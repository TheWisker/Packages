#!/bin/bash
echo Package name:
read _package
if ! test -f "./build/$_package/PKGBUILD"; then
    echo "No PKGBUILD found!"
    exit 0
fi
echo "PKGBUILD found!"
mkdir -v "./bin/$_package"
cp "./build/$_package/." "./bin/$_package/"
cd "./bin/$_package"
makepkg -sr --sign
cp -v *.{tar.zst,tar.zst.sig} ../../x86_64
cd ../../
echo "Update repository (Y,n):"
read _update
if ${_update,,} == "n"; then
    echo "All done!"
    exit 0
fi
cd ./x86_64
repo-add --verify --sign wisker.db.tar.gz *.pkg.tar.zst
echo "All done!"