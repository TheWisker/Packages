#!/bin/bash
echo Package name:
read _name
if ! test -f "./build/$_name/PKGBUILD"; then
    echo "No PKGBUILD found!"
    exit 0
fi
echo "PKGBUILD found!"
mkdir -v "./aur/$_name"
cp "./build/$_name/PKGBUILD" "./aur/$_name/PKGBUILD"
cd "./aur/$_name/"
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
echo "Commit message:"
read _message
git commit -m "$_message"
git push 