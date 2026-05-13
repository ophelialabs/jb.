# Interactive Periodic Table of Elements

An interactive, modern periodic table web application featuring 3D visualizations and detailed element information. Built with HTML, CSS, and JavaScript.

## Features

✨ **Interactive Periodic Table Grid**
- Click any element to view detailed information
- Color-coded by element category (alkali metals, halogens, noble gases, etc.)
- Responsive grid layout that adapts to different screen sizes
- Hover effects and smooth animations

🔬 **3D Bohr Model Visualization**
- Interactive 3D models of each element's Bohr model
- Powered by Google's model-viewer
- AR support (on compatible devices)
- Auto-rotating with camera controls

📊 **Multiple Visualization Tabs**
- **Bohr Model 3D**: Interactive 3D atomic structure
- **Element Image**: Physical representation of the element
- **Spectral Bands**: Spectral analysis visualization

📋 **Comprehensive Element Information**
- Atomic mass, period, group, and phase
- Melting and boiling points
- Electron configuration
- Electronegativity (Pauling scale)
- Density information
- Discovery information
- Wikipedia summaries and source links

## File Structure

```
html2/
├── index.html              # Main HTML file
├── styles.css              # Complete styling
├── script.js               # Application logic
├── periodic-data.js        # Periodic table data (auto-generated)
├── server.py               # Local development server
└── Periodic-Table-JSON-master/
    └── PeriodicTableJSON.json  # Source data
```

## Quick Start

### Option 1: Using Python Server (Recommended)

```bash
# Navigate to the html2 directory
cd html2

# Run the server
python3 server.py
```

The server will start on `http://localhost:8000` and automatically open in your browser.

### Option 2: Using Node.js/npm

```bash
# Install a simple HTTP server
npm install -g http-server

# Run it
http-server .
```

### Option 3: Using PHP

```bash
php -S localhost:8000
```

### Option 4: Direct File Opening

You can open `index.html` directly in your browser (Note: Some features may not work due to CORS restrictions)

## Usage

1. **Browse Elements**: The periodic table displays all 118 elements in their correct positions
2. **Select an Element**: Click any element to open the detailed modal
3. **View 3D Model**: Rotate, zoom, and interact with the 3D Bohr model
4. **Switch Tabs**: Use the tabs to view different visualizations:
   - 3D model (interactive)
   - Element image with attribution
   - Spectral bands
5. **Read Information**: View comprehensive data including:
   - Atomic properties
   - Physical properties
   - Historical information
   - Wikipedia source
6. **Close Modal**: Click the X button, click outside, or press Escape

## Color Legend

- 🔴 **Alkali Metals** - Highly reactive metals
- 🟠 **Alkaline Earth Metals** - Reactive metals
- 🟣 **Transition Metals** - Central block metals
- 🟣 **Lanthanides** - Rare earth elements
- 🟣 **Actinides** - Heavy rare earth elements
- ⚫ **Post-transition Metals** - Less reactive metals
- 🟤 **Semimetals** - Properties between metals and nonmetals
- 🟢 **Nonmetals** - Non-reactive elements
- 🟡 **Halogens** - Highly reactive nonmetals
- 🔵 **Noble Gases** - Unreactive gases

## Features Explained

### 3D Model Viewer
- **Powered by**: Google's model-viewer component
- **Format**: .glb (GL Transmission Format)
- **Interaction**: 
  - Drag to rotate
  - Scroll to zoom
  - Two-finger pinch on mobile to zoom
  - View in AR (if supported by your device)

### Data Source
- **Source**: Comprehensive periodic table JSON dataset
- **Elements**: All 118 confirmed elements
- **Data includes**: Atomic properties, physical properties, images, 3D models, spectral data

### Responsive Design
- Desktop (1200px+): Full layout with side-by-side visualization and info
- Tablet (768px-1199px): Stacked layout adapts gracefully
- Mobile (480px-767px): Compact periodic table with optimized spacing
- Small mobile (<480px): Ultra-compact 8-column grid

## Browser Compatibility

- Chrome/Chromium 90+
- Firefox 88+
- Safari 14.1+
- Edge 90+

Note: The 3D model viewer requires WebGL support.

## Development

### Modifying the Periodic Table

To add or modify elements:
1. Edit `Periodic-Table-JSON-master/PeriodicTableJSON.json`
2. Run the data conversion script:
   ```bash
   python3 convert_data.py
   ```
3. Refresh the browser

### Adding New Features

The JavaScript file (`script.js`) handles:
- Periodic table rendering
- Modal interactions
- Tab switching
- Data formatting and display

CSS (`styles.css`) provides:
- Responsive grid layout
- Color-coded categories
- Modal styling
- Animation effects

## Known Limitations

1. Some 3D models may not load if external CDN is unavailable
2. AR functionality requires a compatible device and browser
3. Spectral images may not be available for all elements
4. Some historical data may be null for undiscovered or synthetic elements

## Future Enhancements

- [ ] Search functionality for elements
- [ ] Filter by category or properties
- [ ] Comparison mode for multiple elements
- [ ] Dark mode toggle
- [ ] Element trends visualization
- [ ] Interactive electron shell visualization
- [ ] Periodic table game/quiz mode
- [ ] Export element data as PDF

## Credits

- **Data Source**: Periodic Table JSON Project
- **3D Models**: Google Periodic Table (glb format)
- **3D Viewer**: Google's model-viewer component
- **Images**: Various open-source chemical databases

## License

This project uses the periodic table data under its original license. The interface and code are provided as-is for educational and personal use.

## Support

For issues or questions:
1. Check browser console (F12) for errors
2. Ensure all files are in the correct directory
3. Try a different browser
4. Verify internet connection (for CDN resources)

---

Enjoy exploring the elements! 🧪✨
