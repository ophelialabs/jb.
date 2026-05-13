# [RHEL9 Docs](https://docs.oracle.com/en/operating-systems/oracle-linux/9/)

- ###### Using Yum repository for backwards compatability ######

---

## Network and Development Tools
- java, javac, node.js, php, lynx
---

---

## [Terraform](https://developer.hashicorp.com/terraform/install)
```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```

---

## [Cockpit](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html-single/managing_systems_using_the_rhel_9_web_console/index)
Cockpit supports Ubuntu Focal (20.04), ROS-Noetic, and Gazebo (Gazebo not supported on RHEL9).
```bash
$ systemctl enable --now cockpit.socket
$ sudo dnf install -y cockpit-machines
```

---

## [VPN Config Guide](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/configuring_and_managing_networking/configuring-a-vpn-connection_configuring-and-managing-networking)
- Cockpit supports WireGuard VPN (requires FIPS disabled). For production, use Libreswan (Openswan IPsec fork). 

---

## [Virtualization Setup](https://docs.oracle.com/en/operating-systems/oracle-linux/kvm-user/kvm-InstallingVirtualizationPackages.html)
Install virtualization packages:
```bash
$ sudo dnf group install "Virtualization Host"
$ sudo dnf install qemu-kvm libvirt virt-install virt-viewer
$ for drv in qemu network nodedev nwfilter secret storage interface; do systemctl start virt${drv}d{,-ro,-admin}.socket; done
$ virt-host-validate
$ sudo dnf update -y
$ sudo dnf install -y pip
```

---

## [Install Go](https://go.dev/doc/install) 
```bash
$ sudo dnf install -y go
```
AMD/INTEL
```bash
$ curl -LO https://go.dev/dl/go1.24.2.linux-amd64.tar.gz
$ rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz
$ export PATH=$PATH:/usr/local/go/bin
```
ARM
```bash
$ curl https://go.dev/dl/go1.24.2.linux-arm64.tar.gz
$ rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.2.linux-arm64.tar.gz
$ export PATH=$PATH:/usr/local/go/bin
```

---

## [VS Code - Insiders](https://code.visualstudio.com/insiders/)
```bash
$ sudo dnf install -y code-insiders
```
or
```bash
$ cd Downloads && ls
$ sudo dnf install (code-insiders).rpm && sudo rm (code-insiders).rpm
```
## Github-SSH
```bash
$ ssh-keygen -t rsa -C "comment-here"
$ ssh-add ~/.ssh/id_rsa
$ cat ~/.ssh/id_rsa.pub
```
### Copy key>Github>Settings>Add SSH key>Paste key
### Title = Machine Name
---

## [Podman Desktop](https://podman-desktop.io/docs/installation)
```bash
$ flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
$ flatpak install --user flathub io.podman_desktop.PodmanDesktop
$ flatpak update --user io.podman_desktop.PodmanDesktop
$ flatpak run io.podman_desktop.PodmanDesktop
```

---



---

## [Kubernetes (K8s)](https://kubernetes.io/docs/tasks/tools/)
Install Kubernetes tools:
```bash
$ cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
$ sudo yum install -y kubelet kubeadm kubectl cri-tools kubernetes-cni --disableexcludes=kubernetes
$ systemctl enable --now kubelet
$ go install sigs.k8s.io/kind@v0.27.0
$ sudo mv ~/go/bin/kind /bin
$ sudo rm -r ~/go
$ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
$ sudo rpm -Uvh minikube-latest.x86_64.rpm
```

---

## CLIs
[Azure Cloud (AZ)](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?view=azure-cli-latest&pivots=dnf)
```bash
```
Google Cloud Platform (GCP)
```bash
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el9-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
```
- if using Fedora 34 or 35 install
```bash
sudo dnf install libxcrypt-compat.x86_64
```
```bash
sudo dnf install google-cloud-cli
```
- reference a file to install additional components
- gcloud auth login works best with chrome browser
```bash
gcloud init
gcloud auth login
```

Amazon Web Services (AWS)
```bash
```

---

## [Virtual Machine Creation](https://docs.oracle.com/en/operating-systems/oracle-linux/cockpit/cockpit-kvm.html)

---
