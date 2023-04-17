# Others

- https://www.thewindowsclub.com/window-auto-tuning-in-windows-10

## Auto fix

```
Dism /Online /Cleanup-Image /CheckHealth
Dism /Online /Cleanup-Image /ScanHealth
Dism /Online /Cleanup-Image /RestoreHealth

sfc /scannow
```
