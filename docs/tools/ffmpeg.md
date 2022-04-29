# ffmpeg

* To mp3

```bash
ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.mkv}to.mp3
```

* Extract frames

```bash
ffmpeg -i file.mpg -r 1/1 $filename%03d.bmp
```

## GIF

```bash linenums="1"
ffmpeg -i IN.mp4 -filter_complex "[0:v] palettegen" palette.png
ffmpeg -i IN.mp4 -i palette.png -filter_complex "[0:v][1:v] paletteuse" OUT.gif
```

http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html
https://engineering.giphy.com/how-to-make-gifs-with-ffmpeg/
https://ffmpeg.org/ffmpeg-filters.html#palettegen-1

## Refs

<https://ffmpeg.org/>

<https://stackoverflow.com/questions/10957412/fastest-way-to-extract-frames-using-ffmpeg>