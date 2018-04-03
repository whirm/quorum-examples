FROM ubuntu

RUN apt update

RUN apt install -y software-properties-common wget git

COPY examples/5nodesRTGS/bootstrap.sh /tmp

RUN cd /tmp && /tmp/bootstrap.sh

RUN rm -fR /tmp/*

RUN adduser user

USER user

COPY examples/5nodesRTGS /home/user/

RUN cd && ./raft-init.sh

CMD cd && ./raft-start.sh && bash
