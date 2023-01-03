#!/bin/sh
set -eo pipefail

# required elements to be copied
required_elms=(
    LICENSE
    README.md
    requirements.yml
    defaults
    files
    filter_plugins
    handlers
    library
    meta
    tasks
    templates
    test_plugins
    vars
)

cd "$(dirname $0)"
rm -rf roles/

# update roles
for src_dir in ../roles/aisbergg.*; do
    role="$(basename "$src_dir")"
    role="${role##*.}"

    echo "Copying $src_dir to roles/$role."
    mkdir -p "roles/$role"
    for elm in "${required_elms[@]}"; do
        if [[ -d "$src_dir/$elm" ]] ; then
            cp -af "$src_dir/$elm" "roles/$role/$elm"
        elif [[ -f "$src_dir/$elm" || -L "$src_dir/$elm" ]] ; then
            cp "$src_dir/$elm" "roles/$role/$elm"
        fi
    done
done

# update collection requirements
echo "---" > requirements.yml
echo "collections:" >> requirements.yml
cat roles/*/requirements.yml | grep '  - name: ' | grep -v aisbergg | sort | uniq >> requirements.yml
