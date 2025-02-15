FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        gawk \
        wget \
        git-core \
        subversion \
        diffstat \
        unzip \
        sysstat \
        texinfo \
        build-essential \
        chrpath \
        socat \
        python3 \
        python3-pip \
        python3-pexpect \
        python3-virtualenv \
        xz-utils  \
        locales \
        cpio \
        screen \
        tmux \
        sudo \
        iputils-ping \
        python3-git \
        python3-jinja2 \
        pylint \
        xterm \
        iproute2 \
        fluxbox \
        tightvncserver \
        lz4 \
        zstd \
        file && \
    case ${TARGETPLATFORM} in \
        "linux/amd64") \
            DEBIAN_FRONTEND=noninteractive apt-get install -y \
                gcc-multilib \
                g++-multilib \
            ;; \
    esac && \
    cp -af /etc/skel/ /etc/vncskel/ && \
    echo "export DISPLAY=1" >>/etc/vncskel/.bashrc && \
    mkdir  /etc/vncskel/.vnc && \
    echo "" | vncpasswd -f > /etc/vncskel/.vnc/passwd && \
    chmod 0600 /etc/vncskel/.vnc/passwd && \
    useradd -U -m yoctouser && \
    /usr/sbin/locale-gen en_US.UTF-8 && \
    echo 'dash dash/sh boolean false' | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

WORKDIR /tannhauser

RUN git clone -b kirkstone https://git.yoctoproject.org/poky

COPY . .

CMD ["bash", "-c", "source poky/oe-init-build-env build && bitbake tannhauser-image"]