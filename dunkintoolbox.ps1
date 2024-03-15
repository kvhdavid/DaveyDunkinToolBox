# Davey Dunkin Toolbox

# Import GUI modules.
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[Windows.Forms.Application]::EnableVisualStyles()


function Create-Gui {
    # Create the main form
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Davey Dunkin Toolbox"
    $form.Size = New-Object System.Drawing.Size(400, 200)
    $form.StartPosition = "CenterScreen"

    # Create buttons
    $button1 = New-Object System.Windows.Forms.Button
    $button1.Location = New-Object System.Drawing.Point(20,20)
    $button1.Size = New-Object System.Drawing.Size(150,30)
    $button1.Text = "Installs"
    $button1.Add_Click({
        $InstallForm = Perform-Installs
        $InstallForm.ShowDialog()
    })
    $button1.Add_KeyDown({
    if ($_.KeyCode -eq 'Delete') {
        $form.Size = New-Object System.Drawing.Size(400, 400)  
    }
})


    $form.Controls.Add($button1)

    $button2 = New-Object System.Windows.Forms.Button
    $button2.Location = New-Object System.Drawing.Point(20,70)
    $button2.BackColor = [System.Drawing.Color]::FromArgb(84, 227, 255)  # Red
    $button2.Size = New-Object System.Drawing.Size(150,30)
    $button2.Text = "Common Fixes"
    $button2.Add_Click({
        $commonFixesForm = Create-CommonFixesGui
        $commonFixesForm.ShowDialog()
    })
    $button2.Add_KeyDown({
        if ($_.KeyCode -eq 'Delete') {
            $form.Size = New-Object System.Drawing.Size(400, 400)
        }
    })
    $form.Controls.Add($button2)

    $button3 = New-Object System.Windows.Forms.Button
    $button3.Location = New-Object System.Drawing.Point(20,120)
    $button3.Size = New-Object System.Drawing.Size(150,30)
    $button3.Text = "Check Shutdown Log"
    $button3.Add_Click({
        $CheckShutdownLog = Check-ShutdownLog
    })
    $form.Controls.Add($button3)

    $button4 = New-Object System.Windows.Forms.Button
    $button4.Location = New-Object System.Drawing.Point(200,20)
    $button4.Size = New-Object System.Drawing.Size(150,30)
    $button4.Text = "Computer Tweaks"
    $button4.Add_Click({ Show-GUIMenu })
    $button4.Add_KeyDown({
        if ($_.KeyCode -eq 'Delete') {
            $form.Size = New-Object System.Drawing.Size(400, 400)
        }
    })
    $form.Controls.Add($button4)

    $button5 = New-Object System.Windows.Forms.Button
    $button5.Location = New-Object System.Drawing.Point(200,70)
    $button5.Size = New-Object System.Drawing.Size(150,30)
    #$button5.BackColor = [System.Drawing.Color]::FromArgb(3, 255, 87)  # Green
    $button5.Text = "Repairs"
    $button5.Add_Click({
        $RepairForm = Repair-Menu
        $RepairForm.ShowDialog()
    })
    $form.Controls.Add($button5)

    $button6 = New-Object System.Windows.Forms.Button
    $button6.Location = New-Object System.Drawing.Point(200,120)
    $button6.Size = New-Object System.Drawing.Size(150,30)
    $button6.Text = "Task Manager"
    $button6.Add_Click({ Taskmgr })
    $form.Controls.Add($button6)

    $button7 = New-Object System.Windows.Forms.Button
    $button7.Location = New-Object System.Drawing.Point(200,170)
    $button7.Size = New-Object System.Drawing.Size(150,30)
    $button7.Text = "Printers"
    $button7.Add_Click({ control printers })
    $form.Controls.Add($button7)

    $button8 = New-Object System.Windows.Forms.Button
    $button8.Location = New-Object System.Drawing.Point(200,220)
    $button8.Size = New-Object System.Drawing.Size(150,30)
    $button8.Text = "Device Manager"
    $button8.Add_Click({ devmgmt.msc })
    $form.Controls.Add($button8)

    $button9 = New-Object System.Windows.Forms.Button
    $button9.Location = New-Object System.Drawing.Point(200,270)
    $button9.Size = New-Object System.Drawing.Size(150,30)
    $button9.Text = "Printers (Advanced)"
    $button9.Add_Click({ printmanagement.msc })
    $form.Controls.Add($button9)

    $button10 = New-Object System.Windows.Forms.Button
    $button10.Location = New-Object System.Drawing.Point(20,170)
    $button10.Size = New-Object System.Drawing.Size(150,30)
    $button10.Text = "Event Viewer"
    $button10.Add_Click({ eventvwr.msc })
    $form.Controls.Add($button10)

    $button11 = New-Object System.Windows.Forms.Button
    $button11.Location = New-Object System.Drawing.Point(20,220)
    $button11.Size = New-Object System.Drawing.Size(150,30)
    $button11.Text = "Registry Editor"
    $button11.Add_Click({ regedit })
    $form.Controls.Add($button11)

    $button12 = New-Object System.Windows.Forms.Button
    $button12.Location = New-Object System.Drawing.Point(20,270)
    $button12.Size = New-Object System.Drawing.Size(150,30)
    $button12.Text = "Local Security Policy"
    $button12.Add_Click({ secpol.msc })
    $form.Controls.Add($button12)

    $button13 = New-Object System.Windows.Forms.Button
    $button13.Location = New-Object System.Drawing.Point(20,320)
    $button13.Size = New-Object System.Drawing.Size(150,30)
    $button13.Text = "Netplwiz"
    $button13.Add_Click({ netplwiz })
    $form.Controls.Add($button13)

    $button14 = New-Object System.Windows.Forms.Button
    $button14.Location = New-Object System.Drawing.Point(200, 320)
    $button14.Size = New-Object System.Drawing.Size(150,30)
    $button14.Text = "Windows Updates"
    $button14.Add_Click({ start ms-settings:windowsupdate })
    $form.Controls.Add($button14)

    # Show the form
    $form.ShowDialog()
}

function Create-CommonFixesGui {
    # Create the sub-form for Common Fixes
    $commonFixesForm = New-Object System.Windows.Forms.Form
    $commonFixesForm.Text = "Common Fixes"
    $commonFixesForm.Size = New-Object System.Drawing.Size(200, 150)
    $commonFixesForm.StartPosition = "CenterParent"

    # Create buttons for Common Fixes sub-menu
    $buttonRestartPrintSpooler = New-Object System.Windows.Forms.Button
    $buttonRestartPrintSpooler.Location = New-Object System.Drawing.Point(20,20)
    $buttonRestartPrintSpooler.Size = New-Object System.Drawing.Size(150,30)
    $buttonRestartPrintSpooler.Text = "Restart Print Spooler"
    $buttonRestartPrintSpooler.Add_Click({ Restart-PrintSpooler })
    $commonFixesForm.Controls.Add($buttonRestartPrintSpooler)

    $buttonClearPrintQueue = New-Object System.Windows.Forms.Button
    $buttonClearPrintQueue.Location = New-Object System.Drawing.Point(20,70)
    $buttonClearPrintQueue.Size = New-Object System.Drawing.Size(150,30)
    $buttonClearPrintQueue.Text = "Clear Print Queue"
    $buttonClearPrintQueue.Add_Click({ Clear-PrintQueue })
    $commonFixesForm.Controls.Add($buttonClearPrintQueue)

    $buttonBlank2 = New-Object System.Windows.Forms.Button
    $buttonBlank2.Location = New-Object System.Drawing.Point(20,120)
    $buttonBlank2.Size = New-Object System.Drawing.Size(150,30)
    $buttonBlank2.Text = ""
    $commonFixesForm.Controls.Add($buttonBlank2)

    return $commonFixesForm
}

# Placeholder functions for button actions
function Perform-Installs {
    # Create the sub-form for Common Fixes
    $InstallForm = New-Object System.Windows.Forms.Form
    $InstallForm.Text = "Installation"
    $InstallForm.Size = New-Object System.Drawing.Size(200, 300)
    $InstallForm.StartPosition = "CenterParent"

    # Create buttons for Common Fixes sub-menu
    $buttonInstallChrome = New-Object System.Windows.Forms.Button
    $buttonInstallChrome.Location = New-Object System.Drawing.Point(20,20)
    $buttonInstallChrome.Size = New-Object System.Drawing.Size(150,30)
    $buttonInstallChrome.Text = "Chrome Install"
    $buttonInstallChrome.Add_Click({ Silent-Chrome-Install })
    $InstallForm.Controls.Add($buttonInstallChrome)

    $buttonClearPrintQueue = New-Object System.Windows.Forms.Button
    $buttonClearPrintQueue.Location = New-Object System.Drawing.Point(20,70)
    $buttonClearPrintQueue.Size = New-Object System.Drawing.Size(150,30)
    $buttonClearPrintQueue.Text = "Acrobat Install (Silent)"
    $buttonClearPrintQueue.Add_Click({ Silent-Acrobat-Install })
    $InstallForm.Controls.Add($buttonClearPrintQueue)

    $buttonBlank23 = New-Object System.Windows.Forms.Button
    $buttonBlank23.Location = New-Object System.Drawing.Point(20,120)
    $buttonBlank23.Size = New-Object System.Drawing.Size(150,30)
    $buttonBlank23.Text = ""
    $InstallForm.Controls.Add($buttonBlank2)

    return $InstallForm
}

function Restart-PrintSpooler {
    $serviceName = "Spooler"

    try {
        # Display a pop-up window to show the progress
        [System.Windows.Forms.MessageBox]::Show("Stopping Print Spooler...", "Progress", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

        $stopOutput = net stop $serviceName 2>&1

        # Display a pop-up window to show the progress
        [System.Windows.Forms.MessageBox]::Show("Print Spooler stopped.`n$stopOutput", "Progress", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

        $startOutput = net start $serviceName 2>&1

        # Display a pop-up window to show the progress
        [System.Windows.Forms.MessageBox]::Show("Print Spooler started.`n$startOutput", "Progress", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

        # Update GUI here if needed
    } catch {
        $errorMessage = $_.Exception.Message
        Write-Host "Error restarting Print Spooler: $errorMessage"

        # Display a pop-up window to show the error
        [System.Windows.Forms.MessageBox]::Show("Error restarting Print Spooler:`n$errorMessage", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)

        # Update GUI here if needed
    }
}

function Clear-PrintQueue {
    $serviceName = "Spooler"

    try {
        # Display a pop-up window to show the progress
        [System.Windows.Forms.MessageBox]::Show("Stopping the Print Spooler...", "Progress", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

        # Stop the Print Spooler
        $stopOutput = Stop-Service -Name $serviceName -Force 2>&1

        # Display a pop-up window to show the progress
        [System.Windows.Forms.MessageBox]::Show("Print Spooler stopped.`n$stopOutput", "Progress", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

        # Display a pop-up window to show the progress
        [System.Windows.Forms.MessageBox]::Show("Deleting print queue", "Progress", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

        # Delete files in the PRINTERS directory
        Remove-Item -Path "$($env:SystemRoot)\System32\spool\PRINTERS\*" -Force -Recurse

        # Display a pop-up window to show the progress
        [System.Windows.Forms.MessageBox]::Show("Starting the Print Spooler", "Progress", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

        # Start the Print Spooler
        $startOutput = Start-Service -Name $serviceName 2>&1

        # Display a pop-up window to show the progress
        [System.Windows.Forms.MessageBox]::Show("Print Spooler started.`n$startOutput", "Progress", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

        # Update GUI here if needed
    } catch {
        $errorMessage = $_.Exception.Message
        Write-Host "Error clearing print queue: $errorMessage"

        # Display a pop-up window to show the error
        [System.Windows.Forms.MessageBox]::Show("Error clearing print queue:`n$errorMessage", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)

        # Update GUI here if needed
    }
}

function Silent-Chrome-Install {
New-Item -Path 'C:\GUpdate' -ItemType Directory

$ProgressPreference = 'SilentlyContinue'
wget https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi -OutFile "C:\GUpdate\googlechromestandaloneenterprise64.msi"


Msiexec /i "C:\GUpdate\googlechromestandaloneenterprise64.msi" /quiet /l*v c:\chrome-install.log
}

function Silent-Acrobat-Install {
# Create a directory if it doesn't exist
$installDir = 'C:\AUpdate'
New-Item -Path $installDir -ItemType Directory -Force

# Set progress preference to silently continue
$ProgressPreference = 'SilentlyContinue'

# Download Adobe Acrobat Reader installer
$url = 'https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2300820470/AcroRdrDC2300820470_en_US.exe'
$installerPath = Join-Path $installDir 'acrobat.exe'
Invoke-WebRequest -Uri $url -OutFile $installerPath

# Perform a silent installation
Start-Process -FilePath $installerPath -ArgumentList '/sAll' -Wait
}

function Check-ShutdownLog {
    # Get the most recent shutdown events
    $shutdownEvents = Get-WinEvent -LogName System -FilterXPath @"
    <QueryList>
        <Query Id="0" Path="System">
            <Select Path="System">
                *[System[(EventID=41 or EventID=1074 or EventID=6006 or EventID=6008) and TimeCreated[timediff(@SystemTime) &lt;= 7776000000]]]
            </Select>
        </Query>
    </QueryList>
"@

    # Create the main form
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Shutdown Log Viewer"
    $form.Size = New-Object System.Drawing.Size(950, 400)
    $form.StartPosition = "CenterScreen"

    # Create list view
    $listView = New-Object System.Windows.Forms.ListView
    $listView.Location = New-Object System.Drawing.Point(20, 20)
    $listView.Size = New-Object System.Drawing.Size(900, 300)
    $listView.View = [System.Windows.Forms.View]::Details
    $listView.FullRowSelect = $true
    $listView.Columns.Add("Event ID", 80) | Out-Null
    $listView.Columns.Add("Time", 120) | Out-Null
    $listView.Columns.Add("Shutdown Type", 100) | Out-Null
    $listView.Columns.Add("Reason Code", 100) | Out-Null
    $listView.Columns.Add("Comment", 150) | Out-Null
    $listView.Columns.Add("Message", 300) | Out-Null

    # Add shutdown events to the list view
    foreach ($event in $shutdownEvents) {
        $item = $listView.Items.Add($event.Id)
        $item.SubItems.Add($event.TimeCreated.ToString())

        # Check if Properties[3] and Properties[2] exist before accessing their Value
        if ($event.Properties.Count -gt 3) {
            $shutdownType = $event.Properties[3].Value
            $item.SubItems.Add($shutdownType)
            if ($shutdownType -eq "0x800000ff") {
                $processInfo = $event.Properties[6].Value
                $item.SubItems.Add($processInfo)
            } else {
                $item.SubItems.Add("N/A")
            }
        }
        else {
            $item.SubItems.Add("N/A")
            $item.SubItems.Add("N/A")
        }

        # Check if Properties[1] exists before accessing its Value
        if ($event.Properties.Count -gt 1) {
            $item.SubItems.Add($event.Properties[1].Value)
        }
        else {
            $item.SubItems.Add("N/A")
        }

        # Get the full event message
        $message = $event.Message
        $item.SubItems.Add($message)
    }

    # Add event handler for double-click on ListViewItem
    $listView.Add_ItemActivate({
        if ($listView.SelectedItems.Count -eq 1) {
            $selectedItem = $listView.SelectedItems[0]

            # Display detailed information in a MessageBox
            [System.Windows.Forms.MessageBox]::Show($selectedItem.SubItems[5].Text, "Event Message")
        }
    })

    $form.Controls.Add($listView)

    # Show the main form
    $form.ShowDialog()
}

function Show-ComputerInfo {
    # Create the main form
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Computer Information"
    $form.Size = New-Object System.Drawing.Size(500, 400)
    $form.StartPosition = "CenterScreen"

    # Function to get system information
    function Get-SystemInfo {
        $info = @{
            'Host Name' = [System.Environment]::MachineName
            'Windows Edition' = (Get-WmiObject -Class Win32_OperatingSystem).Caption
            'Domain' = (Get-WmiObject -Class Win32_ComputerSystem).Domain
            'Group' = (Get-WmiObject -Class Win32_ComputerSystem).DomainRole
            'Memory' = [math]::Round((Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
            'Storage' = [math]::Round((Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' }).Size / 1GB, 2)
            'Disk Type' = (Get-WmiObject -Class Win32_DiskDrive | Where-Object { $_.DeviceID -eq 'PHYSICALDRIVE0' }).MediaType
            'CPU' = (Get-WmiObject -Class Win32_Processor).Name
        }

        return $info
    }

    $systemInfo = Get-SystemInfo

    # Create labels for basic computer information
    $labelHostName = New-Object System.Windows.Forms.Label
    $labelHostName.Location = New-Object System.Drawing.Point(20, 20)
    $labelHostName.Size = New-Object System.Drawing.Size(450, 20)
    $labelHostName.Text = "Host Name: $($systemInfo['Host Name'])"
    $form.Controls.Add($labelHostName)

    $labelWindowsEdition = New-Object System.Windows.Forms.Label
    $labelWindowsEdition.Location = New-Object System.Drawing.Point(20, 60)
    $labelWindowsEdition.Size = New-Object System.Drawing.Size(450, 20)
    $labelWindowsEdition.Text = "Windows Edition: $($systemInfo['Windows Edition'])"
    $form.Controls.Add($labelWindowsEdition)

    $labelDomain = New-Object System.Windows.Forms.Label
    $labelDomain.Location = New-Object System.Drawing.Point(20, 100)
    $labelDomain.Size = New-Object System.Drawing.Size(450, 20)
    $labelDomain.Text = "Domain: $($systemInfo['Domain'])"
    $form.Controls.Add($labelDomain)

    $labelGroup = New-Object System.Windows.Forms.Label
    $labelGroup.Location = New-Object System.Drawing.Point(20, 140)
    $labelGroup.Size = New-Object System.Drawing.Size(450, 20)
    $labelGroup.Text = "Group: $($systemInfo['Group'])"
    $form.Controls.Add($labelGroup)

    $labelMemory = New-Object System.Windows.Forms.Label
    $labelMemory.Location = New-Object System.Drawing.Point(20, 180)
    $labelMemory.Size = New-Object System.Drawing.Size(450, 20)
    $labelMemory.Text = "Memory: $($systemInfo['Memory']) GB"
    $form.Controls.Add($labelMemory)

    $labelStorage = New-Object System.Windows.Forms.Label
    $labelStorage.Location = New-Object System.Drawing.Point(20, 220)
    $labelStorage.Size = New-Object System.Drawing.Size(450, 20)
    $labelStorage.Text = "Storage: $($systemInfo['Storage']) GB"
    $form.Controls.Add($labelStorage)

    $labelDiskType = New-Object System.Windows.Forms.Label
    $labelDiskType.Location = New-Object System.Drawing.Point(20, 260)
    $labelDiskType.Size = New-Object System.Drawing.Size(450, 20)
    $labelDiskType.Text = "Disk Type: $($systemInfo['Disk Type'])"
    $form.Controls.Add($labelDiskType)

    $labelCPU = New-Object System.Windows.Forms.Label
    $labelCPU.Location = New-Object System.Drawing.Point(20, 300)
    $labelCPU.Size = New-Object System.Drawing.Size(450, 20)
    $labelCPU.Text = "CPU: $($systemInfo['CPU'])"
    $form.Controls.Add($labelCPU)

    # Show the form
    $form.ShowDialog()
}

function Show-NetworkInfo {
    # Create the main form
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Network Information"
    $form.Size = New-Object System.Drawing.Size(500, 300)
    $form.StartPosition = "CenterScreen"

    # Function to get network information
    function Get-NetworkInfo {
        $networkInfo = @{
            'Ethernet IP' = (Get-NetIPAddress | Where-Object { $_.InterfaceAlias -like '*Ethernet*' -and $_.PrefixOrigin -eq 'Manual' -and $_.IPAddress -match '^(192|10)\.' }).IPAddress
            'Ethernet Gateway' = (Get-NetRoute | Where-Object { $_.InterfaceAlias -like '*Ethernet*' -and $_.DestinationPrefix -eq '0.0.0.0/0' }).NextHop
            'Ethernet MAC Address' = (Get-NetAdapter | Where-Object { $_.InterfaceDescription -like '*Ethernet*' }).MacAddress
            'Ethernet DHCP Server' = (Get-NetIPConfiguration | Where-Object { $_.InterfaceAlias -like '*Ethernet*' }).DhcpServer
            'Wireless IP' = (Get-NetIPAddress | Where-Object { $_.InterfaceAlias -like '*Wi-Fi*' -and $_.PrefixOrigin -eq 'Manual' -and $_.IPAddress -match '^(192|10)\.' }).IPAddress
            'Wireless Gateway' = (Get-NetRoute | Where-Object { $_.InterfaceAlias -like '*Wi-Fi*' -and $_.DestinationPrefix -eq '0.0.0.0/0' }).NextHop
            'Wireless MAC Address' = (Get-NetAdapter | Where-Object { $_.InterfaceDescription -like '*Wi-Fi*' }).MacAddress
            'Wireless DHCP Server' = (Get-NetIPConfiguration | Where-Object { $_.InterfaceAlias -like '*Wi-Fi*' }).DhcpServer
        }

        return $networkInfo
    }

    $networkInfo = Get-NetworkInfo

    # Create labels for network information
    $labelEthernetIP = New-Object System.Windows.Forms.Label
    $labelEthernetIP.Location = New-Object System.Drawing.Point(20, 20)
    $labelEthernetIP.Size = New-Object System.Drawing.Size(450, 20)
    $labelEthernetIP.Text = "Ethernet IP: $($networkInfo['Ethernet IP'])"
    $form.Controls.Add($labelEthernetIP)

    $labelEthernetGateway = New-Object System.Windows.Forms.Label
    $labelEthernetGateway.Location = New-Object System.Drawing.Point(20, 60)
    $labelEthernetGateway.Size = New-Object System.Drawing.Size(450, 20)
    $labelEthernetGateway.Text = "Ethernet Gateway: $($networkInfo['Ethernet Gateway'])"
    $form.Controls.Add($labelEthernetGateway)

    $labelEthernetMAC = New-Object System.Windows.Forms.Label
    $labelEthernetMAC.Location = New-Object System.Drawing.Point(20, 100)
    $labelEthernetMAC.Size = New-Object System.Drawing.Size(450, 20)
    $labelEthernetMAC.Text = "Ethernet MAC Address: $($networkInfo['Ethernet MAC Address'])"
    $form.Controls.Add($labelEthernetMAC)

    $labelEthernetDHCP = New-Object System.Windows.Forms.Label
    $labelEthernetDHCP.Location = New-Object System.Drawing.Point(20, 140)
    $labelEthernetDHCP.Size = New-Object System.Drawing.Size(450, 20)
    $labelEthernetDHCP.Text = "Ethernet DHCP Server: $($networkInfo['Ethernet DHCP Server'])"
    $form.Controls.Add($labelEthernetDHCP)

    $labelWirelessIP = New-Object System.Windows.Forms.Label
    $labelWirelessIP.Location = New-Object System.Drawing.Point(20, 180)
    $labelWirelessIP.Size = New-Object System.Drawing.Size(450, 20)
    $labelWirelessIP.Text = "Wireless IP: $($networkInfo['Wireless IP'])"
    $form.Controls.Add($labelWirelessIP)

    $labelWirelessGateway = New-Object System.Windows.Forms.Label
    $labelWirelessGateway.Location = New-Object System.Drawing.Point(20, 220)
    $labelWirelessGateway.Size = New-Object System.Drawing.Size(450, 20)
    $labelWirelessGateway.Text = "Wireless Gateway: $($networkInfo['Wireless Gateway'])"
    $form.Controls.Add($labelWirelessGateway)

    $labelWirelessMAC = New-Object System.Windows.Forms.Label
    $labelWirelessMAC.Location = New-Object System.Drawing.Point(20, 260)
    $labelWirelessMAC.Size = New-Object System.Drawing.Size(450, 20)
    $labelWirelessMAC.Text = "Wireless MAC Address: $($networkInfo['Wireless MAC Address'])"
    $form.Controls.Add($labelWirelessMAC)

    $labelWirelessDHCP = New-Object System.Windows.Forms.Label
    $labelWirelessDHCP.Location = New-Object System.Drawing.Point(20, 300)
    $labelWirelessDHCP.Size = New-Object System.Drawing.Size(450, 20)
    $labelWirelessDHCP.Text = "Wireless DHCP Server: $($networkInfo['Wireless DHCP Server'])"
    $form.Controls.Add($labelWirelessDHCP)

    # Show the form
    $form.ShowDialog()
}

function Repair-Menu {
    # Create the sub-form for Common Fixes
    $RepairForm = New-Object System.Windows.Forms.Form
    $RepairForm.Text = "Installation"
    $RepairForm.Size = New-Object System.Drawing.Size(200, 300)
    $RepairForm.StartPosition = "CenterParent"

    # Create buttons for Common Fixes sub-menu
    $buttonSFCbasic = New-Object System.Windows.Forms.Button
    $buttonSFCbasic.Location = New-Object System.Drawing.Point(20,20)
    $buttonSFCbasic.Size = New-Object System.Drawing.Size(150,30)
    $buttonSFCbasic.Text = "SFC Basic Repair"
    $buttonSFCbasic.Add_Click({  
        # Launch a new PowerShell window to run SFC scan
        Start-Process powershell -ArgumentList "-NoExit -Command `"sfc /scannow`""
    })
    $RepairForm.Controls.Add($buttonSFCbasic)

    $button999 = New-Object System.Windows.Forms.Button
    $button999.Location = New-Object System.Drawing.Point(20,70)
    $button999.Size = New-Object System.Drawing.Size(150,30)
    $button999.Text = "Other Repairs"
    $button999.Add_Click({  })
    $RepairForm.Controls.Add($button999)

    $buttonBlank23 = New-Object System.Windows.Forms.Button
    $buttonBlank23.Location = New-Object System.Drawing.Point(20,120)
    $buttonBlank23.Size = New-Object System.Drawing.Size(150,30)
    $buttonBlank23.Text = ""
    $RepairForm.Controls.Add($buttonBlank23)

    return $RepairForm
}

function Show-GUIMenu {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Menu"
    $form.Size = New-Object System.Drawing.Size(300,200)
    $form.StartPosition = "CenterScreen"
    
    $96 = New-Object System.Windows.Forms.Button
    $96.Location = New-Object System.Drawing.Point(50,50)
    $96.Size = New-Object System.Drawing.Size(200,30)
    $96.Text = "Change Hostname"
    $96.Add_Click({
        $newHostname = $null
        $hostnamePrompt = New-Object System.Windows.Forms.Form
        $hostnamePrompt.Text = "Enter Hostname"
        $hostnamePrompt.Size = New-Object System.Drawing.Size(300,150)
        $hostnamePrompt.StartPosition = "CenterScreen"
        
        $hostnameLabel = New-Object System.Windows.Forms.Label
        $hostnameLabel.Location = New-Object System.Drawing.Point(10,20)
        $hostnameLabel.Size = New-Object System.Drawing.Size(280,20)
        $hostnameLabel.Text = "Enter the new hostname:"
        
        $hostnameTextBox = New-Object System.Windows.Forms.TextBox
        $hostnameTextBox.Location = New-Object System.Drawing.Point(10,40)
        $hostnameTextBox.Size = New-Object System.Drawing.Size(280,20)
        
        $hostnameOKButton = New-Object System.Windows.Forms.Button
        $hostnameOKButton.Location = New-Object System.Drawing.Point(75,70)
        $hostnameOKButton.Size = New-Object System.Drawing.Size(75,23)
        $hostnameOKButton.Text = "OK"
        $hostnameOKButton.Add_Click({
            $newHostname = $hostnameTextBox.Text
            $hostnamePrompt.Close()
            if ($newHostname) {
                $restartPrompt = New-Object System.Windows.Forms.Form
                $restartPrompt.Text = "Restart Prompt"
                $restartPrompt.Size = New-Object System.Drawing.Size(300,150)
                $restartPrompt.StartPosition = "CenterScreen"
                
                $restartLabel = New-Object System.Windows.Forms.Label
                $restartLabel.Location = New-Object System.Drawing.Point(10,20)
                $restartLabel.Size = New-Object System.Drawing.Size(280,20)
                $restartLabel.Text = "Do you want to restart now? (yes/no):"
                
                $restartTextBox = New-Object System.Windows.Forms.TextBox
                $restartTextBox.Location = New-Object System.Drawing.Point(10,40)
                $restartTextBox.Size = New-Object System.Drawing.Size(280,20)
                
                $restartOKButton = New-Object System.Windows.Forms.Button
                $restartOKButton.Location = New-Object System.Drawing.Point(75,70)
                $restartOKButton.Size = New-Object System.Drawing.Size(75,23)
                $restartOKButton.Text = "OK"
                $restartOKButton.Add_Click({
                    $restart = $restartTextBox.Text
                    $restartPrompt.Close()
                    if ($restart -eq "yes") {
                        Rename-Computer -NewName $newHostname -Restart
                    } else {
                        Rename-Computer -NewName $newHostname
                    }
                })
                
                $restartCancelButton = New-Object System.Windows.Forms.Button
                $restartCancelButton.Location = New-Object System.Drawing.Point(155,70)
                $restartCancelButton.Size = New-Object System.Drawing.Size(75,23)
                $restartCancelButton.Text = "Cancel"
                $restartCancelButton.Add_Click({
                    $restartPrompt.Close()
                })
                
                $restartPrompt.Controls.Add($restartLabel)
                $restartPrompt.Controls.Add($restartTextBox)
                $restartPrompt.Controls.Add($restartOKButton)
                $restartPrompt.Controls.Add($restartCancelButton)
                
                $restartPrompt.ShowDialog() | Out-Null
            } else {
                [System.Windows.Forms.MessageBox]::Show("Hostname cannot be empty.", "Error", "OK", [System.Windows.Forms.MessageBoxIcon]::Error)
            }
        })
        
        $hostnameCancelButton = New-Object System.Windows.Forms.Button
        $hostnameCancelButton.Location = New-Object System.Drawing.Point(155,70)
        $hostnameCancelButton.Size = New-Object System.Drawing.Size(75,23)
        $hostnameCancelButton.Text = "Cancel"
        $hostnameCancelButton.Add_Click({
            $hostnamePrompt.Close()
        })
        
        $hostnamePrompt.Controls.Add($hostnameLabel)
        $hostnamePrompt.Controls.Add($hostnameTextBox)
        $hostnamePrompt.Controls.Add($hostnameOKButton)
        $hostnamePrompt.Controls.Add($hostnameCancelButton)
        
        $hostnamePrompt.ShowDialog() | Out-Null
    })
    
    $97 = New-Object System.Windows.Forms.Button
    $97.Location = New-Object System.Drawing.Point(50,90)
    $97.Size = New-Object System.Drawing.Size(200,30)
    $97.Text = "Change Password"
    $97.Add_Click({
        [System.Windows.Forms.MessageBox]::Show("Change Password functionality is not implemented yet.", "Information", "OK", [System.Windows.Forms.MessageBoxIcon]::Information)
    })
    
    $98 = New-Object System.Windows.Forms.Button
    $98.Location = New-Object System.Drawing.Point(50,130)
    $98.Size = New-Object System.Drawing.Size(200,30)
    $98.Text = "Exit"
    $98.Add_Click({
        $form.Close()
    })
    
    $form.Controls.Add($96)
    $form.Controls.Add($97)
    $form.Controls.Add($98)
    
    $form.ShowDialog() | Out-Null
}





# Call the function to create and display the GUI
Create-Gui
