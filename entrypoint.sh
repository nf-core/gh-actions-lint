#!/bin/bash

set -ex
set -o pipefail

install_nextflow(){
    if [ -z "$INPUT_NEXTFLOW_VERSION" ]
    then
        conda install -c bioconda nextflow
    else
        conda install -c bioconda nextflow=${INPUT_NEXTFLOW_VERSION}
    fi
    
}

install_nf_core_tools(){
    if [ -z "$INPUT_NFCORE_VERSION" ]
    then
        pip install nf-core
    else
        pip install nf-core==${INPUT_NFCORE_VERSION}
    fi
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