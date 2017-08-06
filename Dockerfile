FROM pybombs/pybombs-prefix
MAINTAINER Yan Grunenberger <yan@grunenberger.net>
RUN apt-get -qy update
RUN pybombs install openlte
RUN /pybombs/lib/uhd/utils/uhd_images_downloader.py
# FIXME : fix the environement setting before calling the eNB softmodem
RUN echo "LTE_fdd_enodeb" >> /pybombs/setup_env.sh
ENTRYPOINT ["/bin/bash","-c","source /pybombs/setup_env.sh"]