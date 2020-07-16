# nf-core-gh-action

GitHub action for nf-core

## Inputs

### `nextflow_version`

[Nextflow](https://www.nextflow.io/) version. Default: install latest version

### `nfcore_version`

[nf-core tools](https://github.com/nf-core/tools/) version. Default: install latest version

## Example usage

```bash
name: nf-core CI

on: [push, pull_request]
    
jobs:
  nf-core-linting:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: maxibor/nf-core-gh-action@master
    - name: Markdownlint
      run: markdownlint ${GITHUB_WORKSPACE} -c ${GITHUB_WORKSPACE}/.github/markdownlint.yml
    - name: yaml-lint
      run: yamllint $(find ${GITHUB_WORKSPACE} -type f -name "*.yml")
    - name: nf-core linting
      with:
          nextflow_version: '20.04.1'
          nfcore_version: '1.9'
      env:
          GITHUB_COMMENTS_URL: ${{ github.event.pull_request.comments_url }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GITHUB_PR_COMMIT: ${{ github.event.pull_request.head.sha }}
      run: nf-core lint ${GITHUB_WORKSPACE}
```