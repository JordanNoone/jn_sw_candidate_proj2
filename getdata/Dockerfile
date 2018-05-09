FROM ubuntu
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install curl -y
COPY pullAndPushData.bash /etc/getdata/pullAndPushData.bash
ENTRYPOINT /bin/bash "/etc/getdata/pullAndPushData.bash"
