# [RHEL9 Docs](https://docs.oracle.com/en/operating-systems/oracle-linux/9/)
**OWL/WISE/CENTRALSHARE**

## Important Directories
- DS: `/`, `/home`, `/tmp`, `/var`, `/var/tmp`, `/var/log`, `/var/log/audit`, `/boot`
- Import Policies
- [docs](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/stig/9-0/vcf-stig-documentation/docs-tutorials-cloud-foundation-9x-product-vcf-application-audit9-app-audit9-app.html)
-[SAF CLI](https://github.com/mitre/saf/releases)
- /usr/share/stigs
- [API METRICS](https://www.brockpeterson.com/post/pulling-vsphere-world-metrics-from-vcf-operations)
- [DX Netops](https://techdocs.broadcom.com/us/en/ca-enterprise-software/it-operations-management/dx-netops/24-3.html)
- [DX Spectrum](https://techdocs.broadcom.com/us/en/ca-enterprise-software/it-operations-management/spectrum/22-2.html)
- [OneClick](https://techdocs.broadcom.com/us/en/ca-enterprise-software/it-operations-management/spectrum/25-4/getting-started/client-applications-overview/oneclick-console.html)
- [Hypori](https://www.hypori.com/)
- [Hypori & AVD](Hypori_AVD.MD)
- Smart
  1. Windows
       emulates using the Trusted Platform Module (TPM) on your computer, allowing for secure, two-factor authentication.
### Steps (Using Command Prompt - Admin):
### 1. Run the following command:
```bash
tmpvscmgr.exe create /name testVSC /pin promp /adminkey random /generate
```
- This creates a card named "TestVSC", prompts for a PIN, and generates the file system.
### 2. Enroll a certificate
    1. Open certmgr.msc
    2. Right-click on Personal>All Tasks>Request New Certificate.
    3. Select the TPM VSC as the target

### Alternative Method
- Omnissa Horizon Client: Settings > Derived Credententials > Create new VSC

### Smart Business (NFC)
Share contact info, social media, websites via a tap
  1. Select a Provider: Wave, Popl, similar
  2. Create Profile: Register with a provider to create digital profile
  3. Customize Content: Add social media links, bio, contact, set up a lead capture form
  4. Order or Activate: NFC enabled metal or plastic, or a tag which will be linked to profile
  5. Use Digital Alternative: Use a QR code or add profile to Apple/Google Wallet

### Summary of Requirements
- Virtual: Windowns 10/11 or [Windows Server](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2025) with TPM chip enabled and tpmvscmgr.exe tool
- Smart Business Card: A smart business card provider (e.g. Wave), an NFC-enabled smartphone, and a customized digital profile

- [Purebred](https://help.ivanti.com/mi/help/en_us/DCRED/11.0.0.0/gdco/Content/DerivedCredentialsGuide/Setting_up_Purebred_deri.htm)
- [Drivelock](https://www.drivelock.com/en/)
- Always shred or clean drives and motherboards upon disposal to prevent credential harvesting.