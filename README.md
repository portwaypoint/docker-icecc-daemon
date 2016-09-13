# docker-icecc-daemon
Docker: Ice Cream - Distributed compiler

Runs iceccd -v on alpine:3.4

No bells or whistles, this uses the default scheduler name and thus can be used to seed a icecream farm by running this image on multiple hosts.

Best way (only at the moment) to run this appears to be using --net=host ; this ensures that the iceccd uses the hosts IP address for responses. I have as of yet been unable to get this working with port exposure on the container since it appears to broadcast the internal container IP address which of course no one can connect to:

Works:
```
    $ docker run --net=host -p ::10245/tcp -p ::8765/tcp -p ::8766/tcp -p ::8765/udp point/icecc-daemon
```
Doesn't:
```
    $ docker -p ::10245/tcp -p ::8765/tcp -p ::8766/tcp -p ::8765/udp point/icecc-daemon
```
