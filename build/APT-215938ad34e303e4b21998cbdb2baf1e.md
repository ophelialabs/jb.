## Astronomer's Proposal Tool
To run the Astronomer's Proposal Tool (APT) on Linux, you typically use the provided installation script followed by an executable script created during the setup process.
- Refer to Linux Setup .sh to detect profile and create the **script** 

## Important Notes
- Version Specifics: Some versions are specific to certain observatories (e.g., Roman vs. HST/JWST). Ensure the INSTALLER_URL in the script matches the specific mission version you need from the [STScI Download Page](https://www.stsci.edu/scientific-community/software/astronomers-proposal-tool-apt).
- Dependencies: Ensure curl is installed on your system (sudo apt install curl) so the script can fetch the installer.
- On modern versions of Ubuntu/Gnome, right-click the new icon on your desktop and select "Allow Launching" to activate it.**

## Summary of Key Components
- **Terminal=true**: This ensures a terminal window opens so you can see the update progress before the main GUI appears.
- **Categories**: Adding Science;Astronomy; helps the system categorize the app in your application menu if you copy the file to ~/.local/share/applications/.

### 1. Install Script
After downloading the installer from the [STSci Linux APT page](https://www.stsci.edu/scientific-community/software/astronomers-proposal-tool-apt/linux), open a terminal and run the install shell script
```
bash
sh install-linux-apt.sh
```

### 2. Execution Script
Once installed, the tool is invoked via a script named APT located in the installation directory. By default, this is usually in your home directory. 

**To run APT directly:**
```
bash
# navigate to your installation folder (example path)
cd ~/APT_2025.6.1/
./APT
```

### 3. Creating a Symlink
To run APT from any directory without typing the full path, you can create a symbolic link in your home directory (remember RHCSA):
```
bash
ln -s ~/APT_2025.6.1/APT ~/apt
```
After creating this link, you can start the tool by simply typing ./apt from your home directory.

### Summary of APT Compatibility
Operating System 	Support Details
Linux	Supported on RHEL 7+, Ubuntu 18.04+, and other major distros.
Observatories	HST, JWST, and Roman Space Telescope.

## Add to system's PATH
To add the Astronomer's Proposal Tool (APT) to your system's PATH, you need to modify your shell's config file. This allows you to launch the tool by simply typing APT in any terminal window. 

### 1. Identify your Shell
```
bash
echo $SHELL
```

- **If it says /bin/bash**: You will edit ~/.bashrc
- **If it says /bin/zsh**: You will edit ~/.zshrc

### 2. Add the Directory to your PATH
use a text editor (nano or vim) to open the appropriate config file and append the path to the APT install directory:

1. Open the file
```
bash
nano (or vim) ~/.profile
```

2. Add this line at the very bottom:
```
bash
export PATH="$PATH:~/APT_2025.6.1"
```

3. **Save and exit**: Press Ctrl+O, Enter, the Ctrl+X.

## 3. Apply the Changes
```
bash
source ~/.profile
```
After this, you can launch the tool from any directory by just typing APT.

## System-Wide Access (All Users)
If you want every user on the system to have access to APT, you can create a symlink in a standard system directory like /usr/local/bin, which is already in the system PATH
```
bash
sudo ln -s /[full_path_to_apt_folder]/APT /usr/local/bin/APT
```

## APT Wrapper & Auto-Updater Script
To manage the Astronomer's Proposal Tool (APT) efficiently, you can use a wrapper script. Because APT is a standalone **Java**-based application installed via a **Shell** script rather than a standard package manager (like apt-get), "updating" typically involves re-running the latest installer from [STSci](https://www.stsci.edu/scientific-community/software/astronomers-proposal-tool-apt/linux).

The following script checks for a new version of the installer, downloads it if necessary, and then launches the application. 

Save this code as run_apt.sh
```
bash
#!/bin/bash

# --- CONFIGURATION ---
# Path wher you want APT installed
APT_DIR="$HOME/APT"
# URL for the latest Linux installer (Check STScI for the most current link)
INSTALLER_URL="https://apst.stsci.edu"
INSTALLER_NAME="install-linux-apt.sh"

# 1. CHECK FOR UPDATES
echo "Checking for APT updates..."
# Download the latest installer script to a temporary location
curl -s -O $INSTALLER_URL

# Compare with existing installer if it exists to see if there's a change
if [ -f "$APT_DIR/$INSTALLER_NAME" ]; then
    if cmp -s "$INSTALLER_NAME" "$APT_DIR/$INSTALLER_NAME"; then
        echo "APT is already up to date."
        rm "$INSTALLER_NAME"
    else
        echo "New version found. Installing..."
        sh "$INSTALLER_NAME" -q -dir "$APT_DIR"
        mv "$INSTALLER_NAME" "$APT_DIR/$INSTALLER_NAME"
    fi
else
    echo "APT not found. Performing first-time installation..."
    mkdir -p "$APT_DIR"
    sh "$INSTALLER_NAME" -q -dir "$APT_DIR"
    mv "$INSTALLER_NAME" "$APT_DIR/$INSTALLER_NAME"
fi

# 2. EXECUTION
echo "Launching Astronomer's Proposal Tool..."
if [ -f "$APT_DIR/APT" ]; then
    "$APT_DIR/APT" "$@"
else
    echo "Error: APT executable not found in $APT_DIR"
    exit 1
fi

# 3. Make it Executable
chmod +x run_apt.sh

# 4. Move to your PATH
mkdir -p ~/bin
mv run_apt.sh ~/bin/apt-tool
# Ensure ~/bin is in your PATH (see previous instructions)
```

Now simply type apt-tool in your terminal. The script will handle checking for a newer installer before launching the GUI.

## Now Create a Unified Wrapper Script
This script will check for the latest installer from [STSci], update if needed, create a one-click launcher and then launch the app. You will need two files: a bash script to handle the logic and a .desktop file to create the icon. 
## Replace this with cat EOF
```
bash
# Create the file in a stable folder (e.g., ~/bin/ or ~/APT/):
#!/bin/bash
# Configuration
APT_DIR="$HOME/APT"
INSTALLER_URL="https://apst.stsci.edu"
INSTALLER_NAME="install-linux-apt.sh"

mkdir -p "$APT_DIR"
cd "$APT_DIR"

# 1. Update Check
echo "Checking for updates..."
curl -s -O $INSTALLER_URL
if [ ! -f "APT" ] || ! cmp -s "$INSTALLER_NAME" "last_installer.sh"; then
    echo "New version found. Installing..."
    sh "$INSTALLER_NAME" -q -dir "$APT_DIR"
    mv "$INSTALLER_NAME" "last_installer.sh"
else
    echo "APT is up to date."
    rm "$INSTALLER_NAME"
fi

# 2. Launch
echo "Launching APT..."
./APT "$@"

# 3. Make it executable
chmod +x ~/APT/apt_manager.sh

# 4. Create the Desktop Icon
# You must create a .desktop file to tell your Linux environment how to display and run the script.

# Again, replace with cat
nano ~/Desktop/APT.desktop

# Paste the following (replace [your-user] with your actual username which you can find by typing whoami in the terminal.)*:
ini
[Desktop Entry]
Version=1.0
Type=Application
Name=Astronomer Tool
Comment=Update and Launch APT
Exec=/home/[your-user]/APT/apt_manager.sh
Icon=utilities-terminal
Terminal=true
Categories=Science;Astronomy;
```
If you don't already have a high-resolution logo, you can download the official Space Telescope Science Institute (STScI) logo to your APT directory:

```
# 1. Download the STScI logo to your APT folder
wget -O ~/APT/apt_icon.png https://upload.wikimedia.org

# 2. Update Your .desktop File 
nano ~/Desktop/APT.desktop

# 3. Update the Icon line
Icon=/home/[your-user]/APT/apt_icon.png

# 4. Move to Applications Menu
# Either ask user or make it auto
cp ~/Desktop/APT.desktop ~/.local/share/applications/
```

This updated script now verifies the presence of the icon and retrieves it from the STScI Media assets if it's missing.
1. Updated apt_manager.sh
Update your ~/APT/apt_manager.sh with this code:
```
#!/bin/bash
# Configuration
APT_DIR="$HOME/APT"
ICON_PATH="$APT_DIR/apt_icon.png"
ICON_URL="https://upload.wikimedia.org"
INSTALLER_URL="https://apst.stsci.edu"
INSTALLER_NAME="install-linux-apt.sh"

mkdir -p "$APT_DIR"
cd "$APT_DIR"

# 1. ICON CHECK
if [ ! -f "$ICON_PATH" ]; then
    echo "Icon missing. Downloading from STScI assets..."
    curl -s -L -o "$ICON_PATH" "$ICON_URL"
fi

# 2. UPDATE CHECK
echo "Checking for APT updates..."
curl -s -O $INSTALLER_URL
if [ ! -f "APT" ] || ! cmp -s "$INSTALLER_NAME" "last_installer.sh"; then
    echo "New version found. Installing..."
    sh "$INSTALLER_NAME" -q -dir "$APT_DIR"
    mv "$INSTALLER_NAME" "last_installer.sh"
else
    echo "APT is up to date."
    rm "$INSTALLER_NAME"
fi

# 3. LAUNCH
echo "Launching APT..."
./APT "$@"

# 4. Verify the Desktop Entry
Ensure your ~/Desktop/APT.desktop file points to that specific path:
Icon=/home/YOUR_USER/APT/apt_icon.png

# 5. update the placeholder in your desktop file with your current Linux username
sed -i "s/\[your-user\]/$USER/g" ~/Desktop/APT.desktop

# 6. Refresh Gnome Desktop Shell
update-desktop-database ~/.local/share/applications/
```

**The final .desktop file**
```
[Desktop Entry]
Version=1.0
Type=Application
Name=Astronomer Tool
Comment=Update and Launch APT
Exec=/home/[your-user]/APT/apt_manager.sh
Icon=/home/[your-user]/APT/apt_icon.png
Terminal=true
Categories=Science;Astronomy;
```



