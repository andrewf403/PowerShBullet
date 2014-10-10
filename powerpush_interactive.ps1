<#

PowerShell Pushbullet sender

This PowerShell script can be used to send push notifications to your devices using Pushbullet service.

Usage

Send notification:

%scriptname%.ps1 [Title] [Body]

Title: Notification title
Body: Extended notification text

If second or both parameters are omited user will be prompted with interactive input.

Get devices list:

%scriptname%.ps1 -GetDevices

Returns list of registered devcies with names and API IDs. ID should be placed in script configuration. 

#>

#Initial Settings
$key = "" #Your API key. Get it from https://www.pushbullet.com/account
$device = "" #Target device ID. YOu can get it with "-GetDevices" option
$iden = "" #Newer IDEN for next API version. Use this.
$url = "https://api.pushbullet.com/api/pushes" #API url

#Generate Auth Object

$pass = ConvertTo-SecureString "none" -AsPlainText -Force

$auth = New-Object System.Management.Automation.PSCredential ($key, $pass)

#Get Device List with "-GetDevices" Option

if ([string]::Compare($args[0], "-GetDevices", $True) -eq 0) {
    $devices = Invoke-RestMethod -Method Get -Credential $auth -Uri "https://api.pushbullet.com/api/devices"
    $devices.devices | ForEach-Object {
        Write-Host "Device: " $_.extras.nickname " ID: " $_.id "; New IDEN: " $_.iden
    }
    exit
}


#Check of Arguments exist, if not go for interactive prompt.

if ($args[0] -eq $null) {
    $title = Read-Host "Title "
}
Else {
    $title = $args[0]
}

if ($args[1] -eq $null) {
    $message = Read-Host "Body "
}
Else {
    $message = $args[1]
}

#Create request body

$body = @{
	#device_id = $device
    device_iden = $iden
	type = "note"
	title = $title
	body = $message
}

#Send Pushbullet and hide result

$resut = Invoke-RestMethod -Method Post -Credential $auth -Uri $url -Body $body