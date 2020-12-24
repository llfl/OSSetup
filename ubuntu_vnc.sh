#!/bin/bash

sudo apt update && sudo apt install -y xfce4 xfce4-goodies tightvncserver && mkdir ~/.vnc && cat << EOF | tee -a ~/.vnc/xstartup
#!/bin/bash

[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xfdesktop &
xfsettingsd &
xfce4-menu-plugin &
xfwm4 &
EOF