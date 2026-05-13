## [Database Connection](https://docs.oracle.com/en/operating-systems/oracle-linux/asmlib/asmlib-Preface.html#preface)

### ASMLIB v3
- **ULN Recommended**: Keep the system updated by subscribing to the [Oracle Linux Network (ULN)](https://linux.oracle.com).
- **Steps to Subscribe**:
    1. Sign in or register [here](https://linux.oracle.com).
    2. Navigate to the **Systems** tab > **Registered Systems** > Select the system link.
    3. On the **System Details** page, go to **Manage Subscriptions**.
    4. On the **System Summary** page:
         - Select **ASMLIB** and **Oracle Linux Addons** from the available channels.
         - Click the right arrow to subscribe.
         - Save the subscriptions.

### Manual Patches and Updates
If not subscribed to ULN, download packages manually:
- [ASMLIB v8](https://www.oracle.com/linux/downloads/linux-asmlib-v8-downloads.html)
- [ASMLIB v9](https://www.oracle.com/linux/downloads/linux-asmlib-v9-downloads.html)

### Installation Commands
Install ASMLIB support:
```bash
$ sudo dnf install oracleasm-support oracleasmlib
```

---

### Driver Requirements
- **UEK R7**: No driver required.
- **OL8 + RHCK**: Install the driver:
    ```bash
    $ sudo dnf install kmod-redhat-oracleasm
    ```
- **OL9 + RHCK**: No driver required, but `io_uring` must be enabled.

### Enable `io_uring`
Add the following line to `/etc/sysctl.conf`:
```bash
kernel.io_uring_disabled = 0
```

Apply the changes:
```bash
$ sudo sysctl -p
$ sudo dnf update -y
```

---

[Oracle DB 23ai]()

---

[GoldenGate Free](https://docs.oracle.com/en/middleware/goldengate/studio-free/23/uggsf/get-started.html#GUID-42B5358A-A84E-45D2-90CC-D55A474B3678)
<img src="src/assets/gg1.png">
```bash
$ podman login container-registry.oracle.com
$ podman pull container-registry.oracle.com/goldengate/goldengate-studio-free:latest
$ docker run -p 80:80 -p 443:443 container-registry.oracle.com/goldengate/goldengate-studio-free:latest

```


---
