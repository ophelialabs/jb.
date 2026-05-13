# Add and Init DBs
# [GoldenGate Free](https://docs.oracle.com/en/middleware/goldengate/studio-free/23/uggsf/get-started.html#GUID-42B5358A-A84E-45D2-90CC-D55A474B3678)
podman login container-registry.oracle.com
podman pull container-registry.oracle.com/goldengate/goldengate-studio-free:latest
docker run -p 80:80 -p 443:443 container-registry.oracle.com/goldengate/goldengate-studio-free:latest

# ASMLIB 
sudo dnf install oracleasm-support oracleasmlib
#**UEK R7**: No driver required.
- **OL8 + RHCK**: Install the driver:
sudo dnf install kmod-redhat-oracleasm
- **OL9 + RHCK**: No driver required, but `io_uring` must be enabled.
# Enable `io_uring`
Add the following line to `/etc/sysctl.conf`:
kernel.io_uring_disabled = 0
# Apply the changes:
sudo sysctl -p
sudo dnf update -y

# [Oracle DB 23ai](https://docs.oracle.com/en/database/oracle/oracle-database/23/install.html)
# [Oracle DB 23c](https://docs.oracle.com/en/database/oracle/oracle-database/23/install-and-upgrade/index.html)

# Exadate Infrastructure
# GCLI commands?
gcloud auth login
gcloud config set project [PROJECT_ID]
gcloud compute instances create [INSTANCE_NAME] --zone=[ZONE] --machine-type=[MACHINE_TYPE] --image-project=oracle-cloud-exadata --image-family=exadata-infrastructure --boot-disk-size=500GB --boot-disk-type=pd-ssd --metadata=oracle-cloud-exadata-infrastructure=true
# [Oracle Database@Google Cloud](https://docs.oracle.com/en-us/iaas/Content/database-at-gcp-exadata/ogexa-provisioning-exadata-infrastructure.html)
From Google Cloud console, open the Oracle Database@Google Cloud application.