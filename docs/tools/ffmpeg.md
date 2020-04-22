# ffmpeg

* To mp3

```bash
ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.mkv}to.mp3
```

* Extract frames

```bash
ffmpeg -i file.mpg -r 1/1 $filename%03d.bmp
```

## Refs

<https://ffmpeg.org/>

<https://stackoverflow.com/questions/10957412/fastest-way-to-extract-frames-using-ffmpeg>