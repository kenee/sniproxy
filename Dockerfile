FROM    debian

RUN     apt-get update && \
        apt-get install -y autotools-dev cdbs debhelper dh-autoreconf dpkg-dev gettext libev-dev libpcre3-dev libudns-dev pkg-config wget unzip && \
        apt-get autoremove && apt-get clean && \
        wget https://github.com/dlundquist/sniproxy/archive/master.zip  && \
        unzip master.zip  && \
        cd sniproxy-master/  && \
        dpkg-buildpackage  && \
        cd ..  && \
        dpkg -i *.deb