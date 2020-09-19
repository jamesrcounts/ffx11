FROM ubuntu:20.04

COPY library-scripts/desktop-lite-debian.sh /tmp/library-scripts/

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    bash /tmp/library-scripts/desktop-lite-debian.sh developer 1234

ENV DBUS_SESSION_BUS_ADDRESS="autolaunch:" DISPLAY=":1" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"
ENTRYPOINT ["/usr/local/share/desktop-init.sh"]
CMD ["sleep", "infinity"]