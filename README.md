# Firefox in a container
Container'ized image of Firefox - for those environments where you want control over your browser and you just may not have it. 

# Credits:
See more about running GUI apps in Docker containers: 
* https://medium.com/better-programming/running-desktop-apps-in-docker-43a70a5265c4
* jessfraz on GitHub

# X server: 
You will need an X Server for the GUI to be visible. Here are good candidates
* https://sourceforge.net/projects/vcxsrv/  (Windows)
* https://www.xquartz.org/ (MacOS)


## USE
BUILD: 
```
$ docker build . -t chevybowtie/firefox:latest
```

WINDOWS HOST RUN: 
```
$ docker run --rm -ti --net=host -e DISPLAY=host.docker.internal:0 chevybowtie/firefox:latest
```

LUNUX HOST RUN: 
```
$ docker run --rm -ti --net=host -e DISPLAY=:0 chevybowtie/firefox:latest
```
