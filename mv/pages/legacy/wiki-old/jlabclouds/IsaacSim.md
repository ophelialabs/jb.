# Isaac Sim
# [Matlabs](https://www.mathworks.com/products/matlab.html)
# [Systems Tool Kit](https://www.mathworks.com/products/connections/product_detail/systems-tool-kit.html)

- If running win 10 or 11 and have issues such as installing languages or pkgs, quickest workaround would be running a VM snapshot with Ubuntu (**deb or apt pkg mgr distro**)
- If using Mac Isaac Sim <a href="https://docs.isaacsim.omniverse.nvidia.com/latest/installation/manual_livestream_clients.html" target="_blank" rel="noopener noreferrer">WebRTC Streaming Client</a> is best method. Page is currently undergoing development (6/24/25)
- Ubuntu Noble (24.04 LTS) is the ONLY officially supported distro that will run Ros2 and Gazebo 
- 86-64 arch is most straightforward path for simulators due to Nvidia GPUs needed for Isaac Sim and Isaac Lab
- If running an Ubuntu server img, during <a href="https://ubuntu.com/desktop/flavors" target="_blank" rel="noopener noreferrer">desktop</a> install, it is possible to setup Desktop Flavours so that they can be cycled through
- Ubuntu already includes Py and Pip

---

# After creating or running an Ubuntu VM 
```bash
locale  # check for UTF-8
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # verify settings

sudo apt install software-properties-common
sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y
export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb" # If using Ubuntu derivates use $UBUNTU_CODENAME
sudo apt install /tmp/ros2-apt-source.deb && sudo apt install npm

sudo apt update && sudo apt install ros-dev-tools
sudo apt update && sudo apt upgrade -y
sudo apt install ros-kilted-desktop

sudo apt-get update
sudo apt-get install lsb-release gnupg

sudo curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
sudo apt-get update
sudo apt-get install gz-ionic

# Docker installation using the convenience script
# Ask user if want to install docker/podman or both
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Post-install steps for Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

---

# Nvidia Isaac Sim Workstation
- <a href="https://github.com/isaac-sim/IsaacSim" target="_blank" rel="noopener noreferrer">Github</a> for Container Deployment
- <a href="https://docs.isaacsim.omniverse.nvidia.com/latest/installation/install_cloud.html" target="_blank" rel="noopener noreferrer">Cloud</a> Deployment
```sh
<"https://download.isaacsim.omniverse.nvidia.com/isaac-sim-standalone%404.5.0-rc.36%2Brelease.19112.f59b3005.gl.linux-x86_64.release.zip">
mkdir ~/isaacsim
cd ~/Downloads
unzip "isaac-sim-standalone@4.5.0-rc.36+release.19112.f59b3005.gl.linux-x86_64.release.zip" -d ~/isaacsim
cd ~/isaacsim
./post_install.sh
./isaac-sim.selector.sh

# Nvidia Isaac Sim Container deployment
Configure the repository
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
&& curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
&& \
sudo apt-get update
# Install the NVIDIA Container Toolkit packages
sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
# Configure the container runtime
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
# Verify NVIDIA Container Toolkit
docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
# Confirm Nvidia GPU version
nvidia-smi
# Pull
docker pull nvcr.io/nvidia/isaac-sim:4.5.0
# Run
docker run --name isaac-sim --entrypoint bash -it --runtime=nvidia --gpus all -e "ACCEPT_EULA=Y" --rm --network=host \
    -e "PRIVACY_CONSENT=Y" \
    -v ~/docker/isaac-sim/cache/kit:/isaac-sim/kit/cache:rw \
    -v ~/docker/isaac-sim/cache/ov:/root/.cache/ov:rw \
    -v ~/docker/isaac-sim/cache/pip:/root/.cache/pip:rw \
    -v ~/docker/isaac-sim/cache/glcache:/root/.cache/nvidia/GLCache:rw \
    -v ~/docker/isaac-sim/cache/computecache:/root/.nv/ComputeCache:rw \
    -v ~/docker/isaac-sim/logs:/root/.nvidia-omniverse/logs:rw \
    -v ~/docker/isaac-sim/data:/root/.local/share/ov/data:rw \
    -v ~/docker/isaac-sim/documents:/root/Documents:rw \
    nvcr.io/nvidia/isaac-sim:4.5.0

# Nvidia Isaac Lab
- Requires Nvidia GPU driver or Cloud Deployment method utilizing
Nvidia RTX GPUs

# Install Webots 
https://github.com/cyberbotics/webots/releases/download/R2025a/webots_2025a_amd64.deb

#Install VS Code
https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 
```
---

* Under VS Code extensions tab search for QDK and install from Microsoft provider
* Create an admin portal first that can be used for subsequent projects
    - <a href="https://docs.oracle.com/en/learn/ol-nginx/#introduction" target="_blank" rel="noopener noreferrer">NGINX</a> Docs
    - <a href="https://kubernetes.io/docs/home/" target="_blank" rel="noopener noreferrer">Kubernetes</a> Docs
    - Kubernetes <a href="https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/" target="_blank" rel="noopener noreferrer">Dashboard</a>
    - <a href="https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/" target="_blank" rel="noopener noreferrer">Grafana</a> for Kubernetes
    - <a href="https://github.com/bitnami/charts?tab=readme-ov-file" target="_blank" rel="noopener noreferrer">Bitnami</a> Helm Charts (Github) , <a href="https://bitnami.com/enterprise" target="_blank" rel="noopener noreferrer">Bitnami</a> Helm Charts (Enterprise) , <a href="https://www.openpolicyagent.org/" target="_blank" rel="noopener noreferrer">OPA</a> (Gatekeeper Policies)
* <a href="Spot.c" target="_blank" rel="noopener noreferrer">Spot</a> Project
    - Assess the objective, sometimes a whole robot is not needed. Plan projects accordingly to avoid
    overspending. Budget and Billing!
* Lidar Sonar Radar
* Location of sensory units should be noted 
* Hardware placement will then be bolt-on once chassis is built
* Optics with AI integration and object detection
* Connect a controller 




