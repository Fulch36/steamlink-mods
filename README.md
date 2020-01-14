# Steam Link Mods
A series of modifications to the behaviour of various systems on the Valve Steam Link hardware. This includes changes to the behaviour of VirtualHere USB server as well as several other shell script changes intended to make the system behave better when streaming games via Moonlight.

## VirtualHere
By default, the 'vhusbdarm.ini' file used by Valve to configure VirtualHere prevents it from picking up any connected Steam Controllers. This is because the Steam Streaming application appears to natively handle sending through Steam Controller input during a streaming session. In fact, VirtualHere server is never even started unless a device is marked as 'shared' in the VirtualHere settings screen on the Steam Link. To continue, please connect and share any USB device via VirtualHere on the Steam Link.

There are 4 device IDs in the 'IgnoredDevices' field of the aforementioned ini file and these all relate to the Steam Controller - each ID represents one of the 4 different methods for using the controller as an input device: wired, internal wireless dongle (Steam Link only), USB wireless dongle and Bluetooth. In order to make the Steam Controller shareable through the VirtualHere server that is included in the Steam Link, it is necessary to remove at least one of these device IDs from the ini file. The final entry in the IgnoredDevices field (28DE/1142) is the internal wireless dongle for the Steam Link, I did not take the time to determine which of the remaining entries correspond to the other input methods. 

Having removed the IgnoredDevices entry for your input method, you should now start the normal Steam Streaming application from the Steam link interface. If you have carried out the above instructions correctly, you should now be able to use a VirtualHere client application to see the Steam Link USB hub and verify that a Steam Controller is available to be shared.

The next step is to make it possible to start VirtualHere server manually. Navigate to `~/bin` and locate the shell script 'usb_sharing.sh'. This script is what the Steam Streaming application calls to start VirtualHere server when it is required.
