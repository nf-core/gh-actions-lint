# nf-core-gh-action

GitHub action for nf-core

## Inputs

### `nextflow_version`

[Nextflow](https://www.nextflow.io/) version. Default=20.04.1

### `nfcore_version`

[nf-core tools](https://github.com/nf-core/tools/) version. Default= 1.9

## Example usage

```bash
name: nf-core  CI

on: [push, pull_request]
    
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: nf-core CI
      uses: maxibor/nf-core-gh-action@master
```