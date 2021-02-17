FROM ubuntu:18.04

ENV USER_PASSWORD=gbvftyh040998
ENV SERVER_NAME=VizcarraVacunero
ENV MAP=TheIsland

RUN apt update && apt upgrade && \
    apt-get install software-properties-common vim && \
    add-apt-repository multiverse  && \
    dpkg --add-architecture i386  && \
    apt update && apt-get install -y lib32gcc1 steamcmd

COPY sysctl.conf /etc/sysctl.conf
COPY limits.conf /etc/security/limits.conf

RUN ulimit -n 100000 && \
    useradd --create-home --shell /bin/bash --password ${USER_PASSWORD} steam && \
    su - steam && \
    ln -s /usr/games/steamcmd steamcmd && \
    steamcmd +login anonymous +force_install_dir /home/steam/arkserver +app_update 376030 +quit

COPY GameUserSettings.ini /home/steam/arkserver/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

VOLUME /home/steam/arkserver/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

WORKDIR /home/steam/arkserver/ShooterGame/Binaries/Linux

COPY start.sh /home/steam/start.sh
RUN chmod +x /home/steam/start.sh

EXPOSE 7777
EXPOSE 27015

CMD ["/home/steam/start.sh"]