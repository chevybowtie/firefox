# Firefox in a container
Container'ized image of Firefox - for those environments where you want control over your browser and you just may not have it. 

# Credits:
See more about running GUI apps in Docker containers: 
* https://medium.com/better-programming/running-desktop-apps-in-docker-43a70a5265c4
* jessfraz on GitHub

# X server: 
You will need an X Server for the GUI to be visible. Here are good candidates
* https://sourceforge.net/projects/vcxsrv/  (Windows, accept all installation defaults)
* https://www.xquartz.org/ (MacOS, untested myself)


## USE
CLONE:
```
$ git clone https://github.com/chevybowtie/firefox.git
```

EDIT:
You will want to edit your prefrences so the container will start up in the desired state. Edit the `Dockerfile` to include your own.
* https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/A_brief_guide_to_Mozilla_preferences
* https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/Preference_reference
* about:config

BUILD: 
```
$ docker build . -t chevybowtie/firefox:latest
```

WINDOWS HOST RUN: 
```
$ docker run --rm -ti --net=host -e DISPLAY=host.docker.internal:0 chevybowtie/firefox:latest
```

if you want to mount your host system into the image, use `-v` volume flags:
```
		-v "${HOME}/.firefox/cache:/root/.cache/mozilla" \
		-v "${HOME}/.firefox/mozilla:/root/.mozilla" \
		-v "${HOME}/Downloads:/root/Downloads" \
```

LUNUX HOST RUN: 
```
$ docker run --rm -ti --net=host -e DISPLAY=:0 chevybowtie/firefox:latest
```
