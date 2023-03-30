# gh-actions-lint

GitHub action for linting nf-core pipelines with [nf-core tools](https://github.com/nf-core/tools/)

## Inputs

### `nextflow_version`

[Nextflow](https://www.nextflow.io/) version. Default: install latest version

### `nfcore_version`

[nf-core tools](https://github.com/nf-core/tools/) version. Default: install latest version

### `mode`

[nf-core tools](https://github.com/nf-core/tools/) linting mode:

- `''`: normal mode (default)
- `'release`: for releases

### `GITHUB_COMMENTS_URL`

Github PR comments URL: `${{ github.event.pull_request.comments_url }}`
Default: `''`

### `GITHUB_TOKEN`

Github Token: `${{ secrets.GITHUB_TOKEN }}`
Default: `''`

### `GITHUB_PR_COMMIT`

Github PR commit SHA: `${{ github.event.pull_request.head.sha }}`
Default: `''`

## Example usage

```yaml
name: nf-core  CI

on: [push, pull_request]

jobs:
  nf-core linting:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Run nf-core linting
      uses: nf-core/gh-actions-lint@master
      with:
          nextflow_version: '20.04.1'
          nfcore_version: '1.9'
          mode: 'release'
          GITHUB_COMMENTS_URL: ${{ github.event.pull_request.comments_url }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GITHUB_PR_COMMIT: ${{ github.event.pull_request.head.sha }}
```
