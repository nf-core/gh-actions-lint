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

install_nextflow
install_nf_core_tools