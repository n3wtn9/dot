# This is the easiest setup so far

[ref](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-14-04)

```
sudo apt-get update
sudo apt-get install xfce4 xfce4-goodies tightvncserver
```

In $HOME/.vnc/xstartup

```
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
```

chmod +x your xstartup

In /etc/init.d/vncserver
* replace user

```
#!/bin/bash
PATH="$PATH:/usr/bin/"
export USER="user"
DISPLAY="1"
DEPTH="16"
GEOMETRY="1024x768"
OPTIONS="-depth ${DEPTH} -geometry ${GEOMETRY} :${DISPLAY} -localhost"
. /lib/lsb/init-functions

case "$1" in
start)
log_action_begin_msg "Starting vncserver for user '${USER}' on localhost:${DISPLAY}"
su ${USER} -c "/usr/bin/vncserver ${OPTIONS}"
;;
stop)
log_action_begin_msg "Stopping vncserver for user '${USER}' on localhost:${DISPLAY}"
su ${USER} -c "/usr/bin/vncserver -kill :${DISPLAY}"
;;
restart)
$0 stop
$0 start
;;
esac
exit 0
```

chmod +x /etc/init.d/vncserver

Create a ssh tunnel from your local

```
ssh -L 5901:127.0.0.1:5901 -N -f -l user server_ip_address
```
