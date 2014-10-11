PowerShBullet
=============

PowerShell Pushbullet sender

This PowerShell script can be used to send push notifications to your devices using Pushbullet service.

Usage

Send notification:

```%scriptname%.ps1 [Title] [Body]```

Title: Notification title
Body: Extended notification text

If second or both parameters are omited user will be prompted with interactive input.

Get devices list:

```%scriptname%.ps1 -GetDevices```

Returns list of registered devcies with names and API IDs. ID should be placed in script configuration.

If you use this to send automatic notifications (e.g. send a push notification to the smartphone when torrent download finishes), PowerShell window will briefly flash. Unfortunately, there is no straitforward way to counter that. The easiest fix is to start PS script within Windows Scripting Host VBS file. objShell.Run call has a parameter, that allows to hide execution window. Just pass “title” and “message” parameter to the ```startpowerpush.vbs``` as you normally would. The script will take care of the rest.