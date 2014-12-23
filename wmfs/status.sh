(conky -c ~/.config/wmfs/conkyrc | while true; read line; do wmfs -c status "default $line"; done)
