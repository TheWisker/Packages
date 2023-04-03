#!/bin/bash
repo_updated=false
echo -n > "./build/.wlock"
while read -r _hook; do
    while IFS='|' read -ra hook; do
        hash=$(git ls-remote ${hook[1]} HEAD | grep -e HEAD | sort -u | sed -e 's/\s.*$//')
        echo "${hook[0]}|${hook[1]}|$hash" >> "./build/.wlock"
        if [ ! -n "$hash" ]; then
            echo "Could not obtain hash of ${hook[0]}!"
            exit
        fi
        if [ $hash == ${hook[2]} ]; then
            echo "${hook[0]} already up to date!" 
            continue
        fi
        repo_updated=true
        if [ -d "./build/${hook[0]}" ]; then
            rm -fr "./build/${hook[0]}"
        fi
        mkdir -v "./build/${hook[0]}"
        echo "${hook[0]} updating..."
        git clone ${hook[1]} "./build/${hook[0]}"
        rm -fr "./build/${hook[0]}/.git"
        echo "${hook[0]} git repository downloaded!"
        if [ -d "./bin/${hook[0]}" ]; then
            echo "Removing previous build leftovers of ${hook[0]}!"
            rm -fr "./bin/${hook[0]}"
        fi
        cp -r "./build/${hook[0]}" "./bin/${hook[0]}"
        cd "./bin/${hook[0]}"
        echo "Compiling ${hook[0]}..."
        makepkg -sr --sign
        echo "${hook[0]} finished compiling..."
        echo "Moving package ${hook[0]} to main repository folder..."
        cp -v *.{tar.zst,tar.zst.sig} ../../x86_64
        echo "Package ${hook[0]} moved!"
        cd ../../
    done <<< $_hook
done < "./build/hooks"
if $repo_updated; then
    rm -fr "./bin/"
    mkdir "./bin"
    cat "./build/.wlock" > "./build/hooks"
    cd ./x86_64
    echo "Updating repository database!"
    repo-add --verify --sign wisker.db.tar.gz *.pkg.tar.zst
    echo "Repository successfully updated!"
    cd ../
else
    echo "Repository did not update: no updates needed!"
fi