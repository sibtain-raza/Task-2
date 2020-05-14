FROM ubuntu:18.04
MAINTAINER sibtain

# Install cron
RUN apt-get update && apt-get install -y cron
# Add files
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x  /entrypoint.sh
ENTRYPOINT /entrypoint.sh
RUN cd root
WORKDIR /root
ADD Alias /root
 
RUN bash alias.sh

