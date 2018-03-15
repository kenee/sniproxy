FROM    debian

RUN     apt-get update && \
        apt-get install -y autotools-dev cdbs debhelper dh-autoreconf dpkg-dev gettext libev-dev libpcre3-dev libudns-dev pkg-config wget unzip && \
        wget https://github.com/dlundquist/sniproxy/archive/master.zip  && \
        unzip master.zip  && \
        cd sniproxy-master/  && \
        dpkg-buildpackage  && \
        cd ..  && \
        dpkg -i *.deb && \
        rm -rf sniproxy-master/  && rm -f master.zip && rm -f *.deb && rm -f sniproxy*
#RUN     apt-get autoremove --yes autotools-dev cdbs debhelper dh-autoreconf dpkg-dev gettext libev-dev libpcre3-dev libudns-dev pkg-config wget unzip &&  apt-get clean
RUN     apt-get autoremove &&  apt-get clean