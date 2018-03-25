FROM debian:stretch
MAINTAINER Fábrica de Software Libre

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get --force-yes install -y neovim vim \
       python3 python2.7 \
       python-dev python3-dev \
       python-pip python3-pip \
       curl exuberant-ctags git ack-grep \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip2 install --user neovim
RUN pip3 install --user neovim
RUN pip2 install pep8 flake8 pyflakes pylint isort
RUN pip3 install pep8 flake8 pyflakes pylint isort

RUN mkdir -p ~/.config/nvim/UltiSnips/
ADD ./UltiSnips/ /root/.config/nvim/UltiSnips/
ADD ./config/init.vim /root/.config/nvim/
RUN timeout 5m nvim || true


CMD ["nvim", "/src"] 
