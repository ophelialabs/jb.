# Quick Start Guide - Interactive Periodic Table

## 🚀 Get Started in 30 Seconds

### Step 1: Start the Server
```bash
cd /Users/jesse/Desktop/Company/Tools/PeriodicTable/HTML/html2
python3 server.py
```

You should see:
```
✨ Interactive Periodic Table
📍 Server running at http://localhost:8000
🌐 Open your browser and navigate to http://localhost:8000
⌨️  Press Ctrl+C to stop the server

🔗 Browser opened automatically!
```

### Step 2: Open Your Browser
The browser should open automatically to `http://localhost:8000`

If not, manually open: **http://localhost:8000**

### Step 3: Explore!
- **Click any element** to see detailed information
- **View 3D models** of the atomic structure
- **Check out spectral bands** and element images
- **Read Wikipedia summaries** for each element

---

## 📁 Files Overview

| File | Purpose |
|------|---------|
| `index.html` | Main web page structure |
| `styles.css` | All styling and layout |
| `script.js` | Interactive functionality |
| `server.py` | Local development server |
| `Periodic-Table-JSON-master/` | Data directory |

---

## 🎨 Features at a Glance

✅ **118 Elements** - Complete periodic table
✅ **Color Coded** - By element category
✅ **3D Models** - Interactive Bohr models
✅ **Responsive** - Works on mobile, tablet, desktop
✅ **Detailed Info** - Atomic properties and more
✅ **No Installation** - Just Python and a browser!

---

## ⚠️ Troubleshooting

### "Periodic table didn't load"
**Solution:** Make sure you're using `http://localhost:8000` (not `file://`)

### "3D models not showing"
**Solution:** Check your internet connection (models load from Google's servers)

### "Server won't start"
**Solution:** Check if port 8000 is already in use:
```bash
python3 server.py  # Try a different port
# Or kill the process using port 8000
```

---

## 💡 Tips

- **Keyboard Navigation**: Press `Escape` to close the modal
- **Mobile Friendly**: The grid adapts for smaller screens
- **AR Support**: On compatible devices, you can view elements in augmented reality!
- **Dark Mode**: Coming soon!

---

## 📖 More Information

See `README_INTERACTIVE.md` for comprehensive documentation.

Happy exploring! 🧪✨
