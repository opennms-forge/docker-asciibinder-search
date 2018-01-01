FROM opennms/asciibinder

LABEL maintainer "Ronny Trommer <ronny@opennms.org>"

ARG ASCIIBINDER_SEARCH_PLUGIN_REPO_URL=git+https://github.com/gluster/ascii_binder_search_plugin.git

USER root

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y install epel-release && \
    yum -y install python34 python34-pip && \
    pip3 install ${ASCIIBINDER_SEARCH_PLUGIN_REPO_URL} && \
    yum clean all && \
    rm -rf /var/cache/yum

WORKDIR /docs

VOLUME ["/docs"]

ENTRYPOINT ["/usr/bin/ascii_binder_search"]

CMD ["--help"]
