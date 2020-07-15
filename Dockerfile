FROM nfcore/base:1.9
LABEL authors="Maxime Borry"
LABEL description="Docker image for nf-core gh-action"

RUN conda install -c conda-forge nodejs
RUN npm install -g markdownlint-cli
RUN npm install -g yaml-lint

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]