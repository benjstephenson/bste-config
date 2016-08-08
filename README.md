udev Rules
==========
So the brightness scripts work, we need to add the following udev rule to set permissions on the /sys/ files

File: /etc/udev/rules.d/90-backlight.rule
```
SUBSYSTEM=="backlight", ACTION=="add", RUN+="/bin/chgrp i3 /sys/class/backlight/%k/brightness"
SUBSYSTEM=="backlight", ACTION=="add", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"
```

