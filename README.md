
# Cordova Chromecast Plugin (ios)

## Install

    phonegap plugin add https://github.com/franzwilding/FWChromecast

## Usage

    var chromecast = cordova.require('at.franzwilding.cordova.chromecast.FWChromecast');
    chromecast.scanForDevices("REC_APP_ID", s, e);
    chromecast.selectDevice("DEVICE_ID_TEST", s, e);
    chromecast.launchApplication("REC_APP_ID", s, e);
    chromecast.startChannel("CHANNEL_NAME", s, e);
    chromecast.onMessage("CHANNEL_NAME", s, e);
    chromecast.sendMessage("CHANNEL_NAME", "MESSAGE", s, e);
