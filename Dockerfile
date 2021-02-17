FROM cm2network/steamcmd

ENV SERVER_NAME=VizcarraVacunero
ENV MAP=TheIsland

RUN ulimit -n 100000 && \
    /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/arkserver +app_update 376030 +quit

VOLUME /home/steam/arkserver/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

WORKDIR /home/steam/arkserver/ShooterGame/Binaries/Linux

COPY start.sh /home/steam/start.sh
RUN chmod +x /home/steam/start.sh

EXPOSE 7777
EXPOSE 27015

CMD ["/home/steam/start.sh", "${MAP}", "${SERVER_NAME}"]