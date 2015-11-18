
# Cordova Chromecast Plugin (ios)

## Install

    phonegap plugin add https://github.com/franzwilding/FWChromecast

## Usage

    // google chromecast manager
    var GCK = cordova.require('at.franzwilding.cordova.chromecast.FWChromecast');

    // register event listener
    //$(GCK).on('GCK.deviceDidComeOnline', function(e, device){ console.log("deviceDidComeOnline: "); console.log(device); });
    //$(GCK).on('GCK.deviceDidGoOffline', function(e, device){ console.log("deviceDidGoOffline: "); console.log(device); });
    $(GCK).on('GCK.deviceConnected', function(e, status){ console.log("deviceConnected: "); console.log(status); });
    $(GCK).on('GCK.applicationLaunched', function(e, error){ console.log("applicationLaunched: "); console.log(error); });
    $(GCK).on('GCK.applicationNotLaunched', function(e, error){ console.log("applicationNotLaunched: "); console.log(error); });
    $(GCK).on('GCK.failToConnectToApp', function(e, error){ console.log("faildToConnectToApp: "); console.log(error); });
    $(GCK).on('GCK.failToConnect', function(e, error){ console.log("failToConnect: "); console.log(error); });
    $(GCK).on('GCK.disconnectWithError', function(e, error){ console.log("disconnectWithError: "); console.log(error); });
    $(GCK).on('GCK.receiveStatusForApp', function(e, status){ console.log("receiveStatusForApp: "); console.log(status); });

    // on device come online we can connect to it
    $(GCK).on('GCK.deviceDidComeOnline', function(e, device){
      console.log("Device: " + device.friendlyName + ' did come online!');
      console.log("Connecting to: " + device.friendlyName + '...');
      GCK.selectDevice(device.id);
    });

    // exception on device go offline
    $(GCK).on('GCK.deviceDidGoOffline', function(e, device){
      console.log("Device: " + device.friendlyName + ' did go offline!');
    });

    // start scanning for devices
    GCK.scanForDevices("REC_APP_ID");
