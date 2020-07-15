FROM nfcore/base:1.9
LABEL authors="Maxime Borry"
LABEL description="Docker image for nf-core gh-action"

RUN conda install -c bioconda nextflow="$INPUT_NEXTFLOW_VERSION"
ENV PATH /opt/conda/bin:$PATH
RUN pip install nf-core=="$INPUT_NFCORE_VERSION"
RUN pip install pymarkdownlint==0.3.1
RUN pip install yamllint==1.23.0

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]