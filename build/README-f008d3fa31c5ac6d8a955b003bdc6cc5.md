# Update; combine all files in directory and link the sections

## Before We Begin

- Tools and features do not need to be installed on the same server for communication.
- **Personal Preferences**:
    - Organization is key!
    - Use specific bookmarks for certain browsers.
    - Naming conventions. Along with organization, good file naming practices.
    - Set up shared directories to avoid redundant file paths (e.g., in VS Code) and downloads (e.g., ISOs or other files).
    
If any free trials are available for any cloud providers, using this guide first will hopefully be extremely helpful by assisting in set up so there can be more focus on a development environment and integrations in a multi cloud environment

Windows Server (6mo eval) + Azure (30day $200cred) \
Google Cloud Platform (3mo $300cred) \
Amazon Web Services (VPS 3mo , EC2 12mo , certain services 12mo) \
[Sharepoint](https://www.microsoft.com/en-us/microsoft-365/SharePoint/compare-SharePoint-plans) MS 365 Business Standard (30day)

---

## [Enterprise Linux 9](https://github.com/JesseDev3/linux/blob/main/el9_setup.md) 
For a quickstart, You can copy and paste 
```bash
$ curl -fsSL https://raw.githubusercontent.com/JesseDev3/linux/refs/heads/main/el9_setup.sh -o el9_setup.sh
$ sudo bash el9_setup.sh
```

---

## [Networking](https://github.com/JesseDev3/linux/blob/main/el9_net.md)
```bash
$ curl -fsSL https://raw.githubusercontent.com/JesseDev3/linux/refs/heads/main/el9_net.sh -o el9_net.sh
$ sudo bash el9_net.sh
```

---

## [Database](https://github.com/JesseDev3/linux/blob/main/el9_db.md)
```bash
$ curl -fsSL https://raw.githubusercontent.com/JesseDev3/linux/refs/heads/main/el9_db.sh -o el9_db.sh
$ sudo bash el9_db.sh
```

---

## [Security](https://github.com/JesseDev3/linux/blob/main/el9_sec.md)
```bash
$ curl -fsSL https://raw.githubusercontent.com/JesseDev3/linux/refs/heads/main/el9_sec.sh -o el9_sec.sh
$ sudo bash el9_sec.sh
```

---

## [Monitoring Tuning & Tracing](https://github.com/JesseDev3/linux/blob/main/el9_mtt.md)
```bash
$ curl -fsSL https://raw.githubusercontent.com/JesseDev3/linux/refs/heads/main/el9_mtt.sh -o el9_mtt.sh
$ sudo bash el9_mtt.sh
```

---
