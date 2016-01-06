FROM ubuntu

RUN \
    apt-get update && \
    RUNLEVEL=1 apt-get install -y icecc 

# Run icecc daemon in verbose mode
CMD ["iceccd","-v"]

# iceccd port
EXPOSE 10245 8765/TCP 8765/UDP 8766
