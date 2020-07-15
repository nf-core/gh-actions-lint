#!/bin/bash

set -ex
set -o pipefail

nf-core-lint() {
    nf-core lint ${GITHUB_WORKSPACE}
}

markdown-lint() {
    markdownlint ${GITHUB_WORKSPACE} -c ${GITHUB_WORKSPACE}/.github/markdownlint.yml
}

yaml-lint(){
    yamllint $(find ${GITHUB_WORKSPACE} -type f -name "*.yml")
}

nf-core-lint
markdown-lint
yaml-lint