FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install php nginx unzip wget zsh vim git ssh openssh-server -y

EXPOSE 22/tcp
EXPOSE 22/tcp

EXPOSE 443/udp
EXPOSE 443/udp

EXPOSE 80/tcp
EXPOSE 80/udp

RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN chsh -s /bin/zsh
COPY oxide.zsh-theme /root/.oh-my-zsh/themes/oxide.zsh-theme
COPY .zshrc /root/.zshrc
COPY rxvt-unicode-256color-debian-linux-gnu /root/.zkbd/rxvt-unicode-256color-debian-linux-gnu
RUN git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf
RUN /root/.fzf/install --all


COPY id_rsa /root/.ssh/id_rsa
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN mkdir /run/sshd

RUN ssh-keyscan github.com >> githubKey && ssh-keygen -lf githubKey && echo `cat githubKey` >> /root/.ssh/known_hosts && rm -rf githubKey
RUN cd /root && git clone git@github.com:Ukio-G/ft_server.git
