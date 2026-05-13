check what's currently using port #
```
lsof -i :5000 | head -20
```
**On macOS Monterey and later, port 5000 is often reserved by the AirPlay Receiver service.**
