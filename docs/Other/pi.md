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

## fswebcam

* Take a pic

```bash
fswebcam -r 1280x720 --no-banner name.jpg
```

## Ref

https://www.raspberrypi.org/forums/viewtopic.php?t=194311<br>

Using a standard USB webcam<br>
<https://www.raspberrypi.org/documentation/usage/webcams/>