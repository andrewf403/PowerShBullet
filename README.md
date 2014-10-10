PowerShBullet
=============

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
