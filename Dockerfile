FROM ubuntu
RUN mkdir manip
WORKDIR /manip
COPY zsh setuid.so ./
RUN apt update &&\
    apt install zsh -y &&\
    useradd --no-create-home user &&\
    useradd --no-create-home administrator &&\
    chown administrator:administrator zsh &&\
    chmod +sx zsh &&\
    chmod +x setuid.so &&\
    chown user:user setuid.so &&\
    chown administrator:administrator secret &&\
    echo "top secret" > secret &&\
    chmod 600 secret &&\
CMD su user
