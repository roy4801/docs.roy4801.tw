# raspberry pi

* check camera
```
vcgencmd get_camera
```

```bash
sudo apt update && sudo apt upgrade -y
sudo rpi-update
sudo modprobe bcm2835-v4l2
```

## raspistill

* Take a pic

```
raspistill -o <name>.jpg
```

## Ref

https://www.raspberrypi.org/forums/viewtopic.php?t=194311
