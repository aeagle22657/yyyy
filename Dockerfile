FROM ubuntu
RUN apt update


ADD https://github.com/gdraheim/docker-systemctl-replacement/raw/v1.5.4260/files/docker/systemctl.py /usr/bin/fake-systemctl
RUN set -eux; \
    sed -i \
        -e '/^\s*logg.error("the ..include. syntax is deprecated. Use x.service.d. drop-in files!")$/d' \
        -e '/Loaded:/ s/({filename}, {enabled})/({filename}; {enabled})/' \
        /usr/bin/fake-systemctl; \
    chmod 755 /usr/bin/fake-systemctl; \
    :
run apt install openssh-server -y
run sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config
run useradd -m -p EncryptedPasswordHere username
run apt install tar unzip -y
run sh -c 'echo root:password | chpasswd'
run wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
run unzip ngrok-stable-linux-amd64.zip
run ./ngrok authtoken 1gSmdSM67EqAIQ6im0SrFdKJqzm_7qjPw3Co76B94F7i63Yzc
run ./ngrok tcp 22

















