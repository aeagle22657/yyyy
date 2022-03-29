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
run sed -i 's/PermitRootLogin yes/PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config
run cat /etc/ssh/sshd_config



















