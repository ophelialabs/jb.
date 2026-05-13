# Shell QuickStart Developer Script for Ubuntu 
sudo apt update && apt upgrade

apt install dotnet-sdk-10.0
# Node.js
# https://nodejs.org/en/download/current
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 24
# Verify the Node.js version:
node -v # Should print "v22.14.0".
nvm current # Should print "v22.14.0".
# Verify npm version:
npm -v # Should print "10.9.2".

# Java/NPM/PHP
sudo apt install -y nodejs npm java-21-openjdk java-21-openjdk-devel php
# sudo alternatives --config java 
sudo apt module enable -y nodejs:22 && sudo apt update -y
npm install -g npm@11.3.0 @angular/cli gulp-cli appcenter-cli yo generator-hottowel express mocha corepack axios
curl -fsSL https://rpm.nodesource.com/setup_23.x -o nodesource_setup.sh 
sudo bash nodesource_setup.sh 
# run following command in new bash window
appcenter login

# Kubernetes
cat <<EOF | sudo tee /etc/apt.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
sudo apt install -y kubelet kubeadm kubectl cri-tools kubernetes-cni --disableexcludes=kubernetes
systemctl enable --now kubelet
# Kind
ARCH=$(uname -m)
case "$ARCH" in
  x86_64)
    URL="https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64"
    ;;
  aarch64)
    URL="https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-arm64"
    ;;
  *)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac
curl -Lo ./kind "$URL"
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Minikube
ARCH=$(uname -m)
case "$ARCH" in
    x86_64)
        URL="https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm"
        ;;
    aarch64)
        URL="https://storage.googleapis.com/minikube/releases/latest/minikube-latest.aarch64.rpm"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 0
        ;;
esac

# Download and install the appropriate package
curl -LO "$URL"
RPM_FILE=$(basename "$URL")
sudo rpm -Uvh "$RPM_FILE" && rm -f "$RPM_FILE"

# Podman 
sudo apt install -y cockpit-podman container-tools podman podman-docker 
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y --user flathub io.podman_desktop.PodmanDesktop
gnome-terminal -- -c flatpak run io.podman_desktop.PodmanDesktop
xterm -e flatpak run io.podman_desktop.PodmanDesktop || \
echo "Failed to launch Podman Desktop. Please run 'flatpak run io.podman_desktop.PodmanDesktop' manually."

# Go install can be used to install other versions of Go.
echo "Proceeding with Go installation..."
sudo apt install -y golang

# Verify Go installation and PATH configuration
if ! command -v go &> /dev/null; then
  echo "Error: Go is not installed or not in PATH. Please check the installation."
fi
echo "Go environment is properly set up."
echo "$(go version)"
# (go get not supported outside of module)
# go get -u gorm.io/gorm github.com/gin-gonic/gin 
# go get -u github.com/volatiletech/authboss/v3

# Terraform
sudo apt-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo apt -y install terraform

# VS Code 
# Enable the Microsoft repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/aptrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/apt.repos.d/vscode.repo > /dev/null

# Prompt the user to choose VS Code and VS Code Insiders
echo "Choose the version of Visual Studio Code to install:"
echo "1) Visual Studio Code (Stable)"
echo "2) Visual Studio Code Insiders"
echo "3) Install Both VS Code and Insiders"
echo "4) Skip Install"
read -p "Enter your choice (1/2/3): " choice
case $choice in
  1)
    echo "Installing Visual Studio Code (Stable)..."
    sudo apt install -y code
    ;;
  2)
    echo "Installing Visual Studio Code Insiders..."
    sudo apt install -y code-insiders
    ;;
  3)
    echo "Installing Both VS Code and Insiders..."
    sudo apt install -y code code-insiders
    ;;
  *)
    echo "Skipping."
    exit 0
    ;;
esac

# JetBrains Toolbox
ARCH=$(uname -m)
case "$ARCH" in
    x86_64)
        URL="https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linux"
        ;;
    aarch64)
        URL="https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linuxARM64"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 0
        ;;
esac

# Then download and install the appropriate package
curl -LO "$URL"
tar -xzf jetbrains-toolbox-<build>.tar.gz && cd jetbrains-toolbox-<build>/bin && ./jetbrains-toolbox

# Eclipse
browser run "https://www.eclipse.org/downloads/"