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

RUN apt-get install -y python-pip python3-pip
RUN pip2 install --user yapf jedi psutil setproctitle pep8 flake8 pyflakes pylint isort
RUN pip3 install --user yapf jedi psutil setproctitle pep8 flake8 pyflakes pylint isort
RUN pip3 install --user neovim==0.2.2
RUN pip2 install --user neovim==0.2.2
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir -p ~/.config/nvim/UltiSnips/
ADD ./UltiSnips/ /root/.config/nvim/UltiSnips/
ADD ./config/init.vim /root/.config/nvim/
ADD gitconfig /etc/gitconfig
RUN timeout 5m nvim || true

ENTRYPOINT ["nvim", "/src"]
