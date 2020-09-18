FROM ubuntu:14.04

# Packages:
# firefox - a web browser
# xvfb - a 'fake' display https://en.wikipedia.org/wiki/Xvfb
# x11vnc - VNC server https://en.wikipedia.org/wiki/X11vnc
RUN apt-get update && \
    apt-get install -y \
        firefox \
        xvfb \
        x11vnc

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
ENV HOME /home/developer
# CMD /usr/bin/firefox