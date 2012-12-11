if pgrep nm-applet; then
  echo not
else
  nm-applet --sm-disable
fi

if pgrep dropbox; then
  echo not
else
  ionice -c 3 dropbox start -i
fi


