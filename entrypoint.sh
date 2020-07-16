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
    if ["$INPUT_MODE" = "release"]
    then
        nf-core lint --release ${GITHUB_WORKSPACE}
    else
        nf-core lint ${GITHUB_WORKSPACE}
    fi
}


install_nextflow
install_nf_core_tools
nf-core-lint

echo $GITHUB_COMMENTS_URL
echo $GITHUB_TOKEN
echo $GITHUB_PR_COMMIT
echo $INPUT_NEXTFLOW_VERSION
echo "TEST"