## GAM (Google Apps Manager) on Chromebox
Setting up GAM on a Chromebox using GCP involves leveraging the ChromeOS Linux environment to run the tool and connecting it to a dedicated GCP project for API access.

### 1. Enable Linux on Chromebox
- Go to Settings > Advanced > Developers.
- Select Turn On for the Linux development environment.
- Open the Terminal app from your app drawer once setup completes.

### 2. Install GAM
In the Linux Terminal, run the following commands:
1. Prepare tools: sudo apt update && sudo apt install xz-utils curl -y.
2. Run the installer:
bash <(curl -s -S -L https://gam-shortn.appspot.com/gam-install).
3. Finalize Environment: When prompted, allow the script to add an alias to your .bashrc file. Run source ~/.bashrc to activate it immediately. 

### 3. Create the GCP Project via GAM
- Type gam create project in the terminal.
- Enter your Google Workspace Super Admin email when prompted.
- Authorization: GAM will provide a URL. Copy it into your Chrome browser, sign in, and grant the requested permissions.
- Enable APIs: GAM will automatically enable the necessary APIs (like Admin SDK and Chrome Management) in the newly created GCP project.

### 4. Configure OAuth Credentials
- The setup will provide a link to the Google Cloud Console Credentials page.
- Click Create Credentials > OAuth client ID.
- Select Desktop app, name it (e.g., "GAM Chromebox"), and click Create.
- Select Desktop app, name it (e.g., "GAM Chromebox"), and click Create.

### 5. Finalize Domain-Wide Delegation 
- Run gam oauth create if not automatically prompted.
- GAM will display a Client ID and a list of Scopes.
- Go to the [Google Admin Console](https://admin.google.com/) > Security > Access and data control > API controls > Manage Domain-wide Delegation.
- Click Add new, paste the Client ID, and copy/paste the entire comma-separated list of scopes from your terminal.

**Verification**: Run gam info domain to ensure the connection is active.

## Management with GAM
To manage ChromeOS devices, you must add these specific Directory API and Chrome Management API scopes to your Domain-wide Delegation settings in the Google Admin Console: 
- https://www.googleapis.com/auth/admin.directory.device.chromeos (Full access to manage ChromeOS devices)
- https://www.googleapis.com/auth/admin.directory.device.chromeos.readonly (Read-only access for reporting)
- https://www.googleapis.com/auth/chrome.management.policy (Access to manage Chrome policies and update settings)
- https://www.googleapis.com (To move devices between OUs)

### Batch update command for ChromeOS Fleet
The most efficient way to update a fleet is by using a CSV file containing your device serial numbers or [Device IDs](https://github.com/taers232c/GAMADV-XTD3/wiki/ChromeOS-Devices).

**Standard command to move devices to a new OU (common for forcing updates via OU policy)**:
gam csv devices.csv gam update cros query "id:~~deviceID~~" ou "/Path/To/Target/OU"
*(Note: Replace ~~deviceID~~ with the column header name in your CSV.)*

**Command to set a specific Target Version for an OU**:
Instead of updating individual devices, you typically update the Chrome Policy for their [Organizational Unit (OU)](https://github.com/GAM-team/GAM/wiki/Chrome-Policies):
gam update chromepolicy chrome.users.chromeBrowserUpdates targetVersionPrefixSetting stable-120 orgunit "/Your/OU/Path"
*(Note: stable-0 always points to the latest stable version.)*

### Quick Tips for Bulk Actions
- Generate a CSV of all devices: gam print cros allfields todrive.
- Deprovision devices in bulk: gam csv depro.csv gam update cros ~deviceId action deprovision_retiring_device acknowledge_device_touch_requirement.
- Speed Up Transfers: Use quickcrosmove at the end of your OU update command to skip individual processing for faster moves.

## Automate moving ChromeOS devices based on their OS version
You must first generate a report of your fleet's current versions and then use a conditional command to move them.

Step 1: Generate the Device List
Run this command to create a CSV file containing the deviceId and osVersion for every device in your fleet:
gam print cros fields deviceId,osVersion > cros_versions.csv 

Step 2: Use a "One-Liner" Script
On ChromeOS Linux, you can use standard terminal tools to filter the CSV and move devices. For example, to move all devices running an OS version older than 120 to a specific "Needs Update" OU:

```
bash
gam csv cros_versions.csv gam update cros ~deviceId ou "/Update Pending" check osVersion < 120
```

(Note: Use ~deviceId to reference the column header from your CSV. Ensure the target OU exists before running.)

Step 3: Advanced Filtering with awk
If you need more complex logic (e.g., matching a partial version string), you can pipe the data through awk before passing it back to GAM:

```
bash
# Finds devices NOT on version 120 and moves them
awk -F',' '$2 !~ /120./ {print $1}' cros_versions.csv | xargs -I {} gam update cros {} ou "/Update Pending"
```

Pro Tip: quickcrosmove 
When moving large numbers of devices, add quickcrosmove to the end of your command. This uses a newer, faster API method that handles moves in bulk rather than one by one:
gam csv cros_versions.csv gam update cros ~deviceId ou "/Target/OU" quickcrosmove.

To force a reboot on ChromeOS devices using GAM, you use the issuecommand function. This sends a remote signal to the hardware to restart, which typically triggers the device to check for and apply any pending updates from its new Organizational Unit (OU).

1. Reboot by OU
If you have already moved the devices to a specific "Update" OU, you can reboot every device in that folder at once:
gam cros_ou "/Path/To/Your/OU" issuecommand command reboot doit.

2. Reboot using a CSV
If you have a list of specific deviceIds or serialNumbers in a CSV file (e.g., devices_to_reboot.csv), use this batch command:
gam csv devices_to_reboot.csv gam issuecommand cros ~deviceId command reboot doit
(Note: Replace ~deviceId with your actual CSV column header.) 

3. Alternative: Remote Powerwash 
If a simple reboot isn't enough and you want to completely wipe the devices (e.g., for a clean state in the new OU), you can use remote_powerwash. Warning: This erases all local data.
gam cros_ou "/Path/To/Your/OU" issuecommand command remote_powerwash doit

Important Considerations:
- User Impact: The device will reboot immediately without warning. It is best to run these commands during off-hours.
- Pending State: If a device is offline, the command will stay in a PENDING state until the device reconnects to the internet.
- Verification: You can check the status of your issued commands by running:
gam print croscommands

To schedule and track reboots for your ChromeOS fleet using GAM, you can use the Linux at utility for one-time scheduling and GAM’s built-in command tracking to monitor the results.
1. Schedule a One-Time Reboot
On your Chromebox's Linux terminal, use the at command to schedule a reboot for a specific time (e.g., 2:00 AM).

1. Install the utility: sudo apt install at -y.
2. Schedule the task:
```
bash
echo "gam cros_ou '/Update Pending' issuecommand command reboot doit" | at 02:00
```

Cron Job
1. To schedule for a specific date: Add the date, e.g., at 02:00 Jan 15
2. View pending tasks: Run atq. 
3. Cancel a task: Run atrm [Job Number]. 

2. Schedule Recurring Reboots (Native)
If you want devices in a specific OU to reboot daily at a set time without running a script every day, use the Google Admin Console [Scheduled Reboot policy](https://help.screencloud.com/en/articles/10120886-scheduling-daily-reboots-for-chrome-devices-with-chrome-device-management): 
- Navigate to Devices > Chrome > Settings > Device settings.
- Search for Scheduled reboot.
- Enable it and set the Uptime limit (e.g., "1" to reboot every 24 hours) and the Reboot time. 

3. Check Reboot Status
When you issue a reboot command via GAM, it is assigned a Command ID. You can use this to track if the device actually restarted. 
- View Recent Commands:
Run gam print croscommands to see a list of all issued commands, their IDs, and current status (e.g., PENDING, EXECUTED_BY_CLIENT, or EXPIRED) 
- Check a Specific Device:
If a command is stuck as PENDING, use the command ID to get details:
gam cros_query "id:[DeviceID]" getcommand commandid [CommandID]
- Check Fleet Uptime:
To see which devices have actually rebooted recently, print the boot time for your fleet:
gam print cros fields serialNumber,lastBootTime

Note: If a device is offline, the command will remain PENDING until it reconnects. If it doesn't reconnect within the expiration window (default 30 days), the command will change to EXPIRED

To export your ChromeOS fleet’s status and reboot data directly to a Google Sheet, add the todrive argument to your print commands. This bypasses the need for local CSV files and uploads the results to the root folder of your Google Drive. 

1. Export Reboot & Command Status
To track the specific commands you issued (like the reboots) and see if they were successfully executed by the devices:
gam print croscommands todrive
- What this shows: A history of remote commands, including the Command ID, Status (e.g., EXECUTED_BY_CLIENT, PENDING), and the Device ID.

2. Export Fleet Uptime & Version Report
To verify which devices actually rebooted by checking their "last boot time" and current OS version:
gam print cros fields serialNumber,lastBootTime,osVersion,status todrive 
- What this shows: A live snapshot of every device, showing exactly when it last started up and its current operating system version. 

3. Customize the Google Sheet (Advanced) 
You can refine the todrive output using sub-arguments to keep your Drive organized: 
- Set a Title: ... todrive tdtitle "Weekly Reboot Status"
- Specify a Folder: ... todrive tdparent "IT Reports Folder Name"
- Overwrite Existing Sheet: ... todrive tdupdatesheet (Use this to keep a single "Live" report updated instead of creating new files every time).

Summary of Differences
Command 	Primary Use
print croscommands	Tracking if the reboot signal was received.
print cros fields...	Verifying the actual hardware state (uptime/OS version).

## "Clean" Export
Run this single command in your terminal. It configures GAM to only include rows where the lastBootTime is older than 7 days ago, then exports that filtered data to a Google Sheet.
```
bash
gam config csv_output_row_filter "lastBootTime:date< -7d" print cros fields serialNumber,lastBootTime,osVersion,orgUnitPath todrive
```

Pro Tip: Verify with a "Last Login" Check 
Sometimes a device might be "active" but hasn't rebooted. You can add more fields to your report to see if users are still using these "long-uptime" machines:
gam config csv_output_row_filter "lastBootTime:date< -7d" print cros fields serialNumber,lastBootTime,lastSync,recentUsers todrive 
How to Check the Status Later
Once your sheet is generated, you can keep track of these specific "stale" devices. If you want to re-run this report weekly, add tdupdatesheet to the command to overwrite the same file instead of creating a new one:
... todrive tdtitle "Stale Device Report" tdupdatesheet

The Automation Command
Run this in your terminal to find and move the "stale" devices in one go:
```
bash
gam config csv_output_row_filter "lastBootTime:date< -7d" print cros fields deviceId,lastBootTime > stale_devices.csv && \
gam csv stale_devices.csv gam update cros ~deviceId ou "/Reboot Required"

# If you want to be extra efficient, you can trigger the reboot command immediately after they land in the new OU:
gam cros_ou "/Reboot Required" issuecommand command reboot doit

# Setting a "Clean Up" Schedule
# If you want this to run every Monday morning without manual input, you can add it to your Linux Crontab:
crontab -e

# Add this line at the bottom to run every Monday at 3 AM
0 3 * * 1 /home/yourusername/bin/gam/gam config csv_output_row_filter "lastBootTime:date< -7d" print cros fields deviceId > /tmp/stale.csv && /home/yourusername/bin/gam/gam csv /tmp/stale.csv gam update cros ~deviceId ou "/Reboot Required"
```
Note: Ensure the path to the gam executable is correct for your Linux environment (usually /home/yourusername/bin/gam/gam or simply gam if it's in your PATH).

## The "Move Back" Command
This script identifies devices in the temporary OU that have successfully rebooted recently and returns them to their permanent home (e.g., "/Students" or "/Staff").
```
bash
gam config csv_output_row_filter "lastBootTime:date> -24h" \
print cros ou "/Reboot Required" fields deviceId \
> rebooted_devices.csv && \
gam csv rebooted_devices.csv gam update cros ~deviceId ou "/Your/Original/OU"
```

## How the logic works:
- ou "/Reboot Required": Limits the search only to the devices you previously flagged.
- lastBootTime:date> -24h: Filters for devices that have a boot timestamp greater than (after) 24 hours ago.
- ~deviceId: Uses the ID from the CSV to target the update.

## The "Ultimate" Automation Strategy
If you have multiple original OUs, the easiest way to handle the "Move Back" is to use a Custom Field or an Asset ID to store the original path before you move them.

Before moving to "Reboot Required", save the original OU to the Notes field:
```
gam csv stale_devices.csv gam update cros ~deviceId notes "OriginalOU:/Students" ou "/Reboot Required"
```
Then, move them back using the value stored in the Notes:
```
gam config csv_output_row_filter "lastBootTime:date> -24h" \
print cros ou "/Reboot Required" fields deviceId,notes > back_home.csv

# This requires a tiny bit of CSV manipulation or running:
gam csv back_home.csv gam update cros ~deviceId ou "/Students"
```
verify the "Reboot Required" OU is empty by running:
```
gam print cros ou "/Reboot Required" countonly
```

## Email Notification
To get an email notification, you can use a simple bash script in your Linux environment that checks the count of devices in that OU and sends an alert via the Gmail API using GAM’s own internal mailer.

### The "Check & Notify" Script
Create a small script (e.g., check_ou.sh) with the following logic:
```
#!/bin/bash
# 1. Count devices in the OU
COUNT=$(gam print cros ou "/Reboot Required" countonly | grep -oP '\d+')

# 2. If count is 0, send an email via GAM
if [ "$COUNT" -eq 0 ]; then
  gam mail admin@yourdomain.com subject "Reboot Project Complete" \
  message "The '/Reboot Required' OU is now empty. All devices have checked in."
fi
```

### How to use this:
1. Make it executable: Run chmod +x check_ou.sh.
2. The Mailer: GAM uses its authorized service account to send the email. Ensure you have the https://www.googleapis.com scope added to your Domain-wide Delegation if it's not already there.
3. Automation: You can add this to your crontab to run every hour so you aren't manually checking:
0 * * * * /home/username/check_ou.sh

### Advanced: Real-time Status Report
If you'd rather see a status report of who is still left in the OU rather than just a "done" notification, you can use this:
```
gam config csv_output_header_filter "serialNumber,lastBootTime" \
print cros ou "/Reboot Required" \
todrive tdtitle "Remaining Devices" tdrecipient admin@yourdomain.com
```
- tdrecipient: This GAM Feature automatically emails you a link to the Google Sheet as soon as it's generated.

Verification: You can test the mail function immediately by running:
gam mail [your-email] subject "GAM Test" message "If you see this, notifications are working."

### The "Stale Device" Notification Script
Create or update your script (e.g., reboot_report.sh) with this code:
```
#!/bin/bash

# 1. Get the list of serials still in the OU
STALE_LIST=$(gam print cros ou "/Reboot Required" fields serialNumber | tail -n +2)

# 2. Check if the list is empty or not
if [ -z "$STALE_LIST" ]; then
  gam mail admin@yourdomain.com subject "Reboot Project Complete" \
  message "The '/Reboot Required' OU is now empty!"
else
  # 3. Send email with the list of serials
  echo -e "The following devices have NOT rebooted yet:\n\n$STALE_LIST" | \
  gam mail admin@yourdomain.com subject "Action Required: Stale Devices Found" \
  message "See below for serials still pending reboot."
fi
```

Why this works:
- tail -n +2: This strips the header ("serialNumber") from the GAM output so your email contains only the actual data [14, 15].
- echo -e: This allows the script to format the list with proper line breaks so it's readable in your inbox.
- Conditional Logic: It smartly switches between a "Success" email and a "Work Pending" email depending on the OU status [15].

Pro Tip: Attach a Full CSV
If you have a massive fleet and the list is too long for an email body, you can have GAM generate a CSV and mail it as a link in one step:
gam print cros ou "/Reboot Required" fields serialNumber,lastBootTime,lastSync todrive tdrecipient admin@yourdomain.com tdtitle "Daily_Stale_Report"
Verification:
Run ./reboot_report.sh manually to ensure the email arrives and the list formatting looks correct in your mail client.

### The Enhanced "Last Seen" Script
Update your script to include both fields. We will use gam print with the fields parameter to fetch the data.
```
#!/bin/bash

# 1. Capture Serials and Last Sync times (skipping the CSV header)
STALE_DATA=$(gam print cros ou "/Reboot Required" fields serialNumber,lastSync | tail -n +2)

# 2. Logic to send the report
if [ -z "$STALE_DATA" ]; then
  gam mail admin@yourdomain.com subject "Reboot Project: Complete" \
  message "Zero devices remaining in the '/Reboot Required' OU."
else
  # 3. Format the data into a readable list for the email body
  BODY_TEXT=$(echo -e "The following devices are still pending reboot:\n\nSERIAL_NUMBER, LAST_SYNC\n$STALE_DATA")
  
  echo "$BODY_TEXT" | gam mail admin@yourdomain.com \
  subject "Action Required: Stale ChromeOS Devices" \
  message "Device list follows:"
fi
```

### Troubleshooting "Last Seen"
If a device has a Last Sync from several days ago, it is likely powered off or disconnected from Wi-Fi. A remote reboot command will remain PENDING and will not execute until the lastSync timestamp updates (meaning it has reconnected).

### Alternative: Direct to Google Sheets
If the list becomes too long for an email, use this one-liner to get a formatted Google Sheet report sent to your inbox:
gam print cros ou "/Reboot Required" fields serialNumber,lastSync todrive tdtitle "Stale_Devices_Report" tdrecipient admin@yourdomain.com

### The "Contact List" Script
This version of the script pulls the Serial Number, Last Sync, and Recent User to give you a complete picture of the "stale" fleet.
```
#!/bin/bash

# 1. Fetch data: Serial, Last Sync, and Recent Users (skipping the header)
# Note: recentUsers often returns a list; GAM will display the most recent.
STALE_DATA=$(gam print cros ou "/Reboot Required" fields serialNumber,lastSync,recentUsers | tail -n +2)

# 2. Logic to send the report
if [ -z "$STALE_DATA" ]; then
  gam mail admin@yourdomain.com subject "Reboot Project: All Clear" \
  message "The '/Reboot Required' OU is empty. All devices have checked in and rebooted."
else
  # 3. Format the body with headers for clarity
  echo -e "STALE DEVICE REPORT\n-------------------\nSERIAL, LAST_SYNC, RECENT_USER\n$STALE_DATA" | \
  gam mail admin@yourdomain.com subject "Urgent: Devices Pending Reboot" \
  message "The following users need to restart their Chromeboxes to apply updates:"
fi
```

### Advanced: Send Individual Warnings?
If you have a very large list, you can actually use GAM to email the users directly to tell them to reboot:
```
# This takes your stale CSV and sends a personalized email to each "recent user"
gam csv stale_devices.csv gam mail ~recentUsers.0.email \
subject "Action Required: Please Reboot Your Chromebox" \
message "Hi, our records show your device hasn't been restarted in 7+ days. Please reboot today to apply security updates."
```
(Note: ~recentUsers.0.email targets the specific email address within the JSON object returned by the API.)

