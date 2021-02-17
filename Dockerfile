FROM cm2network/steamcmd:root

ENV SERVER_NAME=VizcarraVacunero
ENV MAP=TheIsland

COPY start.sh /home/steam/start.sh
RUN chmod +x /home/steam/start.sh && \
    ulimit -n 100000 && \
    su - steam && \
    /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/arkserver +app_update 376030 +quit

VOLUME /home/steam/arkserver/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

WORKDIR /home/steam/arkserver/ShooterGame/Binaries/Linux

EXPOSE 7777
EXPOSE 27015

CMD ["/home/steam/start.sh", "${MAP}", "${SERVER_NAME}"]