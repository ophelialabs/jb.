# Best Practice
###### Using Yum repository for backwards compatability ######
sudo yum update -y && sudo yum upgrade -y

# If using a linux subsystem, SVR/VM w/o GUI, or SSH 
# Skip Desktop install commands such as Podman Desktop, VS Code, etc.
# Suggest using Vim/Nano/Cat for editing and creating files, or using VS Code with the Remote - SSH extension.

# Tools
sudo yum install -y NetworkManager-tui nm-connection-editor yum-utils goprofng drgn corelens lynx

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
sudo yum install -y nodejs npm java-21-openjdk java-21-openjdk-devel php
# sudo alternatives --config java 
sudo yum module enable -y nodejs:22 && sudo yum update -y
npm install -g npm@11.3.0 @angular/cli gulp-cli appcenter-cli yo generator-hottowel express mocha corepack axios
curl -fsSL https://rpm.nodesource.com/setup_23.x -o nodesource_setup.sh 
sudo bash nodesource_setup.sh 
# run following command in new bash window
appcenter login

# Terraform
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

# Virtualization 
# Using the curl cmd approach from the quickstart guide allows you to 
# bypass putting in your password 6x
sudo yum install -y cockpit-machines qemu-kvm libvirt virt-install virt-viewer dotnet-sdk-10.0
for drv in qemu network nodedev nwfilter secret storage interface; do systemctl start virt${drv}d{,-ro,-admin}.socket; done 
virt-host-validate

# Cockpit
systemctl enable --now cockpit.socket

# Check if /etc/cockpit/cockpit.conf exists, create it if not
# Touch only creates a new file if it doesn't already exist and doesn't modify if it does
  sudo touch /etc/cockpit/cockpit.conf

# Create /etc/issue.cockpit (prefer /etc/cockpit/issue.cockpit so both are in the same dir)
cat <<EOF | sudo tee /etc/cockpit/issue.cockpit
Welcome to Your Server Dashboard!
$ sudo nano (or vi) /etc/cockpit/issue.cockpit
for custom display notifications to users
does not compile
EOF

# Edit /etc/cockpit/cockpit.conf to set the banner
cat <<EOF | sudo tee /etc/cockpit/cockpit.conf
[Session]
Banner=/etc/cockpit/issue.cockpit
EOF

sudo systemctl try-restart cockpit


# Kubernetes
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
sudo yum install -y kubelet kubeadm kubectl cri-tools kubernetes-cni --disableexcludes=kubernetes
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
sudo yum install -y cockpit-podman container-tools podman podman-docker 
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y --user flathub io.podman_desktop.PodmanDesktop
gnome-terminal -- -c flatpak run io.podman_desktop.PodmanDesktop
xterm -e flatpak run io.podman_desktop.PodmanDesktop || \
echo "Failed to launch Podman Desktop. Please run 'flatpak run io.podman_desktop.PodmanDesktop' manually."

# Go (Arch dependant linux/amd64 or linux/arm64)
# Go install can be used to install other versions of Go.
echo "Proceeding with Go installation..."
sudo yum install -y golang

# Verify Go installation and PATH configuration
if ! command -v go &> /dev/null; then
  echo "Error: Go is not installed or not in PATH. Please check the installation."
fi
echo "Go environment is properly set up."
echo "$(go version)"
# (go get not supported outside of module)
# go get -u gorm.io/gorm github.com/gin-gonic/gin 
# go get -u github.com/volatiletech/authboss/v3

# VS Code 
# Enable the Microsoft repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

# Prompt the user to choose between VS Code, VS Code Insiders, IntelliJ
echo "Choose the IDEs to install:"
echo "1) Visual Studio Code (Stable)"
echo "2) Visual Studio Code Insiders"
echo "3) Both VS Code and Insiders"
echo "4) Skip Install"
read -p "Enter your choice (1/2/3/4): " choice
case $choice in
  1)
    echo "Installing Visual Studio Code (Stable)..."
    sudo yum install -y code
    ;;
  2)
    echo "Installing Visual Studio Code Insiders..."
    sudo yum install -y code-insiders
    ;;
  3)
    echo "Installing Both..."
    sudo yum install -y code code-insiders
    ;;
  *)
    echo "Skipping."
    exit 0
    ;;
esac

## Setup CLIs so that it is not dependant upon architecture, os, or version (WSL-->Mac)
## Azure, GCP, AWS, IBM, OCI

# Azure CLI
# Get RHEL/CentOS major version Parse os-release is an option
# Combine with uname -m to get architecture and version, add winget and brew
VERSION=$(rpm -q --queryformat '%{VERSION}' redhat-release 2>/dev/null || echo "unknown")
# Optional: Get kernel version (for reference, not used in logic)
KERNEL_VER=$(uname -r)

if [ "$VERSION" -ge 10 ] 2>/dev/null; then
    sudo rpm --import https://packages.microsoft.com/keys/microsoft-2025.asc
    sudo dnf install -y https://packages.microsoft.com/config/rhel/10/packages-microsoft-prod.rpm
elif [ "$VERSION" -ge 9 ] 2>/dev/null; then
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
else
    echo "Unsupported RHEL/CentOS version: $VERSION (Kernel: $KERNEL_VER)"
fi
# Install Azure CLI
sudo dnf install -y azure-cli

# GCLI
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el9-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
sudo yum install -y google-cloud-cli
gcloud init

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
cat <<EOF | sudo tee /awscliv2.zip/gpg.txt
-----BEGIN PGP PUBLIC KEY BLOCK-----

mQINBF2Cr7UBEADJZHcgusOJl7ENSyumXh85z0TRV0xJorM2B/JL0kHOyigQluUG
ZMLhENaG0bYatdrKP+3H91lvK050pXwnO/R7fB/FSTouki4ciIx5OuLlnJZIxSzx
PqGl0mkxImLNbGWoi6Lto0LYxqHN2iQtzlwTVmq9733zd3XfcXrZ3+LblHAgEt5G
TfNxEKJ8soPLyWmwDH6HWCnjZ/aIQRBTIQ05uVeEoYxSh6wOai7ss/KveoSNBbYz
gbdzoqI2Y8cgH2nbfgp3DSasaLZEdCSsIsK1u05CinE7k2qZ7KgKAUIcT/cR/grk
C6VwsnDU0OUCideXcQ8WeHutqvgZH1JgKDbznoIzeQHJD238GEu+eKhRHcz8/jeG
94zkcgJOz3KbZGYMiTh277Fvj9zzvZsbMBCedV1BTg3TqgvdX4bdkhf5cH+7NtWO
lrFj6UwAsGukBTAOxC0l/dnSmZhJ7Z1KmEWilro/gOrjtOxqRQutlIqG22TaqoPG
fYVN+en3Zwbt97kcgZDwqbuykNt64oZWc4XKCa3mprEGC3IbJTBFqglXmZ7l9ywG
EEUJYOlb2XrSuPWml39beWdKM8kzr1OjnlOm6+lpTRCBfo0wa9F8YZRhHPAkwKkX
XDeOGpWRj4ohOx0d2GWkyV5xyN14p2tQOCdOODmz80yUTgRpPVQUtOEhXQARAQAB
tCFBV1MgQ0xJIFRlYW0gPGF3cy1jbGlAYW1hem9uLmNvbT6JAlQEEwEIAD4CGwMF
CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQT7Xbd/1cEYuAURraimMQrMRnJHXAUC
aGveYQUJDMpiLAAKCRCmMQrMRnJHXKBYD/9Ab0qQdGiO5hObchG8xh8Rpb4Mjyf6
0JrVo6m8GNjNj6BHkSc8fuTQJ/FaEhaQxj3pjZ3GXPrXjIIVChmICLlFuRXYzrXc
Pw0lniybypsZEVai5kO0tCNBCCFuMN9RsmmRG8mf7lC4FSTbUDmxG/QlYK+0IV/l
uJkzxWa+rySkdpm0JdqumjegNRgObdXHAQDWlubWQHWyZyIQ2B4U7AxqSpcdJp6I
S4Zds4wVLd1WE5pquYQ8vS2cNlDm4QNg8wTj58e3lKN47hXHMIb6CHxRnb947oJa
pg189LLPR5koh+EorNkA1wu5mAJtJvy5YMsppy2y/kIjp3lyY6AmPT1posgGk70Z
CmToEZ5rbd7ARExtlh76A0cabMDFlEHDIK8RNUOSRr7L64+KxOUegKBfQHb9dADY
qqiKqpCbKgvtWlds909Ms74JBgr2KwZCSY1HaOxnIr4CY43QRqAq5YHOay/mU+6w
hhmdF18vpyK0vfkvvGresWtSXbag7Hkt3XjaEw76BzxQH21EBDqU8WJVjHgU6ru+
DJTs+SxgJbaT3hb/vyjlw0lK+hFfhWKRwgOXH8vqducF95NRSUxtS4fpqxWVaw3Q
V2OWSjbne99A5EPEySzryFTKbMGwaTlAwMCwYevt4YT6eb7NmFhTx0Fis4TalUs+
j+c7Kg92pDx2uQ==
=OBAt
-----END PGP PUBLIC KEY BLOCK-----
EOF
gpg --import /awscliv2/gpg.txt
curl -o awscliv2.sig https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip.sig
gpg --verify awscliv2.sig awscliv2.zip
unzip -u awscliv2.zip
sudo ./aws/install
aws --version

# IBM CLI
curl -fsSL https://clis.cloud.ibm.com/install/linux | sh

# Oracle Cloud CLI
sudo dnf -y install oraclelinux-developer-release-el9
sudo dnf install python39-oci-cli
# Initialize Oracle Cloud CLI
oci setup config
# Install Oracle Cloud CLI plugins
oci os ns get --auth instance_principal
# Install OCI CLI plugins
oci os object bulk-upload --help
# Install OCI CLI Data Science plugin
oci ds model list --help
# Install OCI CLI Database plugin
oci db autonomous-database list --help
# Install OCI CLI Resource Manager plugin
oci resource-manager stack list --help
# Install OCI CLI Logging plugin
oci logging log-group list --help
# Install OCI CLI Monitoring plugin
oci monitoring metric list --help
# Install OCI CLI Networking plugin
oci network vcn list --help
# Install OCI CLI Identity plugins
oci iam user list --help
# Install OCI CLI Block Volume plugin
oci bv volume list --help
# Install OCI CLI Object Storage plugin
oci os bucket list --help
# Install OCI CLI Functions plugin
oci fn application list --help
# Install OCI CLI Events plugin
oci events rule list --help
# Install OCI CLI Notifications plugin
oci ons topic list --help
# Install OCI CLI Resource Manager plugin
oci resource-manager stack list --help
# Install OCI CLI Vault plugin
oci vault secret list --help
# Install OCI CLI Data Catalog plugin
oci data-catalog catalog list --help
# Install OCI CLI Data Flow plugin
oci data-flow application list --help
# Install OCI CLI Data Integration plugin
oci data-integration workspace list --help

# Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-21-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins

# Add Jenkins as an exception
YOURPORT=8080
PERM="--permanent"
SERV="$PERM --service=jenkins"

firewall-cmd $PERM --new-service=jenkins
firewall-cmd $SERV --set-short="Jenkins ports"
firewall-cmd $SERV --set-description="Jenkins port exceptions"
firewall-cmd $SERV --add-port=$YOURPORT/tcp
firewall-cmd $PERM --add-service=jenkins
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload

# After downloading, installing, and running, post-install wizard begins
gnome-terminal -- c sudo systemctl start jenkins
echo "use this password to sign in to Jenkins"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Open new terminal to see if it exits sudo 
echo "Sign up for ULN"
gnome-terminal -- -c browser run "https://linux.oracle.com/ords/f?p=101:30" + "https://docs.oracle.com/en/operating-systems/oracle-linux/9/"    # Open in new tab
# If you have a ULN account, you can use the following command to register your system:
# sudo uln_register --username <your-username> --password <your-password>
# If previous code de-escalates sudo, ctr+f "Launch browser portals" in this file to use the browser run command

# Launch Browser Portals
systemctl enable --now grafana-server.service
# Ifconfig command to get the IP address and print if using a linux subsystem, SVR/VM w/o GUI, or SSH 
echo "Browser: localhost:9090 localhost:8080"


