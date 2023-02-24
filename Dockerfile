FROM ubuntu:latest
LABEL description="Using cloudflared access for tcp tunnels using service auth"

ENV CF_CLIENT_ID="" \
    CF_CLIENT_SECRET="" \
    CF_HOSTNAME="" \
    CF_PORT=8888 \
    LOGLEVEL=info

# copy needed files
COPY . .

RUN ["/bin/bash", "./install.sh"]

EXPOSE 8888/tcp

# command / entrypoint of container
ENTRYPOINT ["/bin/bash"]
# CMD [ "./main.sh","${CF_HOSTNAME}","${CF_PORT}","${CF_CLIENT_ID}","${CF_CLIENT_SECRET}","${LOGLEVEL}" ]
CMD [ "./main.sh" ]