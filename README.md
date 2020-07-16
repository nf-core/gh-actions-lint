# nf-core-gh-action

GitHub action for nf-core

## Inputs

### `nextflow_version`

[Nextflow](https://www.nextflow.io/) version. Default: install latest version

### `nfcore_version`

[nf-core tools](https://github.com/nf-core/tools/) version. Default: install latest version

### `mode`

[nf-core tools](https://github.com/nf-core/tools/) linting mode:
- `''`: normal mode (default)
- `'release`: for releases

## Example usage

```bash
name: nf-core  CI

on: [push, pull_request]
    
jobs:
  nf-core linting:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: nf-core CI
      env:
          GITHUB_COMMENTS_URL: ${{ github.event.pull_request.comments_url }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GITHUB_PR_COMMIT: ${{ github.event.pull_request.head.sha }}
      uses: maxibor/nf-core-gh-action@master
      with:
          nextflow_version: '20.04.1'
          nfcore_version: '1.9'
          mode: 'release'
```