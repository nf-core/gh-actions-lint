#!/bin/bash

set -ex
set -o pipefail

install_nextflow(){
    conda install -c bioconda nextflow=${NEXTFLOW_VERSION}
}

install_nf_core_tools(){
    pip install nf-core==${NFCORE_VERSION}
}

nf-core-lint() {
    nf-core lint ${GITHUB_WORKSPACE}
}

markdown-lint() {
    markdownlint ${GITHUB_WORKSPACE} -c ${GITHUB_WORKSPACE}/.github/markdownlint.yml
}

yaml-lint(){
    yamllint $(find ${GITHUB_WORKSPACE} -type f -name "*.yml")
}

install_nextflow
install_nf_core_tools
nf-core-lint
markdown-lint
yaml-lint