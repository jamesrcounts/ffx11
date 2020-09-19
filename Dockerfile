FROM ubuntu:20.04

COPY library-scripts/*.sh /tmp/library-scripts/
RUN chmod +x /tmp/library-scripts/show-init-log.sh

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    bash /tmp/library-scripts/desktop-lite-debian.sh vscode 1234

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y firefox

ENV DBUS_SESSION_BUS_ADDRESS="autolaunch:" DISPLAY=":1" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"
ENTRYPOINT ["/usr/local/share/desktop-init.sh"]

# Note: Chaining scripts did not work because it broke the "sleep inifity" call and the contianer exited
# ENTRYPOINT ["/usr/local/share/desktop-init.sh", "/tmp/library-scripts/show-init-log.sh"]
CMD ["sleep", "infinity"]