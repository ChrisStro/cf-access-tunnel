FROM ubuntu:latest
LABEL description="Using cloudflared access for tcp tunnels using service auth"

ENV CF_CLIENT_ID="" \
    CF_CLIENT_SECRET="" \
    CF_HOSTNAME="" \
    CF_PORT=8888 \
    LOGLEVEL=info

# copy needed files
COPY install.sh main.sh ./

RUN ["/bin/bash", "./install.sh"]

EXPOSE 8888/tcp

# command / entrypoint of container
ENTRYPOINT ["/bin/bash"]
CMD [ "./main.sh" ]