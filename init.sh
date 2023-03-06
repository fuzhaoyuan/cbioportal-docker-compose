#!/usr/bin/env bash
for d in config data study; do
    cd $d; ./init.sh
    cd ..
done

# add override docker file for arm64
# see https://github.com/cBioPortal/cbioportal/issues/9829
if [[ ! -f "docker-compose.override.yml" ]] && [[ "$(uname -s)" == "Darwin" ]] && [[ "$(sysctl -n machdep.cpu.brand_string)" =~ M.* ]]; then
    cp docker-compose.arm64.yml docker-compose.override.yml
fi
