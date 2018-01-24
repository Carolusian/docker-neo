FROM ubuntu:16.04
MAINTAINER Carolusian <https://github.com/carolusion/>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y mininet netcat curl wget unzip less python screen
RUN apt-get install -y ca-certificates apt-transport-https
RUN apt-get install -y libleveldb-dev sqlite3 libsqlite3-dev

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list

RUN apt-get update && apt-get install -y dotnet-sdk-2.0.0

RUN apt-get install -y expect

RUN wget -O /opt/neo-cli.zip https://github.com/neo-project/neo-cli/releases/download/v2.5.2/neo-cli-ubuntu.16.04-x64.zip

RUN unzip -d /opt /opt/neo-cli.zip

COPY entrypoint.sh /entrypoint.sh
COPY start_cli.sh /start_cli.sh

RUN chmod +x /entrypoint.sh
RUN chmod +x /start_cli.sh


ENTRYPOINT ["/entrypoint.sh"]
