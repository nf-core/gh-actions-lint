FROM nfcore/base:1.9
LABEL authors="Maxime Borry"
LABEL description="Docker image for nf-core gh-action"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]