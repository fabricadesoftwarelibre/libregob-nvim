FROM ubuntu:16.04
MAINTAINER Fábrica de Software Libre

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y neovim 

RUN apt-get install -y \
        git python3 python2.7 \
        python-dev python3-dev \
        curl exuberant-ctags git \
        silversearcher-ag

RUN apt-get install -y python3-pip

RUN addgroup --gid 1000 docker && \
    adduser --uid 1000 --ingroup docker --home /home/docker --shell /bin/sh --disabled-password --gecos "" docker

RUN USER=docker && \
    GROUP=docker && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.1/fixuid-0.1-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

USER docker:docker
RUN pip3 install --user yapf jedi psutil setproctitle pep8 flake8 pyflakes pylint isort
RUN pip3 install --user neovim==0.2.2

USER root:root
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN chown -R docker:docker /home/docker/
RUN mkdir -p /home/docker/.config/nvim/UltiSnips/
ADD ./UltiSnips/ /home/docker/.config/nvim/UltiSnips/
ADD ./config/init.vim /home/docker/.config/nvim/
ADD gitconfig /etc/gitconfig
RUN chown -R docker:docker /home/docker/
RUN chown -R docker:docker /etc/gitconfig

USER root:root
RUN mkdir /src
RUN chown -R docker:docker /src

USER docker:docker
RUN timeout 5m nvim || true
ENTRYPOINT ["fixuid"]
CMD ["nvim","/src"]
