# This is the easiest setup so far

[ref](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-14-04)

```
sudo apt-get update
sudo apt-get install xfce4 xfce4-goodies tightvncserver
```

Setup xstartup
* copy xstartup to $HOME/.vnc/xstartup
* chmod +x your xstartup

Setup service
* copy vncserver to /etc/init.d/vncserver
* replace user with real username
* chmod +x /etc/init.d/vncserver

```
sudo service vncserver start
```

Create a ssh tunnel from your local
```
ssh -L 5901:127.0.0.1:5901 -N -f -l user server_ip_address
```

setup default on boot
```
sudo update-rc.d vncserver defaults
```
