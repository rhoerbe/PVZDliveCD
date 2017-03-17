# --nochroot: make files from the build environment available
%post --nochroot

# get source dir
read PROJHOME < PROJHOMEvar
echo "PROJHOME is $PROJHOME"

# copy install dir to /opt for later distribution in chroot mode
mkdir -p $INSTALL_ROOT/opt
cp -r $PROJHOME/install $INSTALL_ROOT/opt/
cp $PROJHOME/BUILD $INSTALL_ROOT/opt/

# add app scripts
cp -r $PROJHOME/install/scripts/*.sh $INSTALL_ROOT/usr/local/bin/
chmod a+x $INSTALL_ROOT/usr/local/bin/*.sh
mkdir -p $INSTALL_ROOT/usr/local/doc/pvzd

#configure sudoers
cp -r $PROJHOME/install/sudoers.d/predocker $INSTALL_ROOT/etc/sudoers.d/predocker
chown root:root $INSTALL_ROOT/etc/sudoers.d/predocker

# default theme for xfce4-terminal windows
mkdir -p $INSTALL_ROOT/usr/share/applications/xfce4/terminal
cp -p $PROJHOME/install/xfce4-terminal-config/terminalrc $INSTALL_ROOT/usr/share/applications/xfce4/terminal/

%end