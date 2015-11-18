
exports.unhandledException = function(error) {
  console.log("FWChromecast ERROR: " + error);
};

/**
 * Scan the local wifi for chromecast devices. onDiscover get's called, when
 * devices where found.
 *
 * @param receiverAppId, the receiverAppId to filter devices
 * @param onDiscover, callback function, gets called when devices where found.
 * @param onError, callback function, gets called when an error occures.
 */
exports.scanForDevices = function(receiverAppId) {
  var t = this;

  // this method should only be called once.
  if(!t.startedListening) {
    t.startedListening = true;
    t.devices = {};
    cordova.exec(function(response){
      response = JSON.parse(response);
      if(response.command == 'deviceDidComeOnline') {
        t.devices[response.data.id] = response.data;
        $(t).trigger('GCK.deviceDidComeOnline', response.data);
      } else {
        delete t.devices[response.data.id];
        $(t).trigger('GCK.deviceDidGoOffline', response.data);
      }
    }, t.unhandledException, "FWChromecast", "scanForDevices", [receiverAppId]);
  }
};

/**
 * Select a device to use.
 *
 * @param ipAddress, the ipAddress found by scanForDevices of the chromecast.
 * @param servicePort, the servicePort found by scanForDevices of the chromecast.
 * @param onSelect, call function, gets called when device was selected.
 * @param onError, callback function, gets called when an error occures.
 */
exports.selectDevice = function(device) {
  var t = this;

  if(typeof(t.devices[device]) == 'undefined') {
    return false;
  }

  cordova.exec(function(response){
    response = JSON.parse(response);
    if(response.command == 'deviceConnected') {
      t.connected = t.devices[device];
      $(t).trigger('GCK.deviceConnected', t.connected);
    }

    if(response.command == 'applicationLaunched') {
      $(t).trigger('GCK.applicationLaunched', response.data);
    }

    if(response.command == 'applicationNotLaunched') {
      $(t).trigger('GCK.applicationNotLaunched', response.data);
    }

    if(response.command == 'failToConnectToApp') {
      $(t).trigger('GCK.failToConnectToApp', response.data);
    }

    if(response.command == 'failToConnect') {
      $(t).trigger('GCK.failToConnect', response.data);
    }

    if(response.command == 'disconnectWithError') {
      $(t).trigger('GCK.disconnectWithError', response.data);
    }

    if(response.command == 'receiveStatusForApp') {
      $(t).trigger('GCK.failToConnect', response.data);
    }
  }, t.unhandledException, "FWChromecast", "selectDevice", [device]);
};

/**
 * After selecting a device, we can finally start the application.
 *
 * @param receiverAppId, the receiverAppId of the app to start.
 * @param onStart, callback function on app launch.
 * @param onError, callback function, gets called when an error occures.
 */
exports.launchApplication = function(receiverAppId, onStart, onError) {
  cordova.exec(onStart, onError, "FWChromecast", "launchApplication", [receiverAppId]);
};

/**
 * Start channel to communicate with the receiver application. The channelname
 * must start with urn:x-cast:, for example, urn:x-cast:com.example.custom.
 *
 * @param channelName, the name of the channel to create.
 * @param onSuccess, callback function, when the channel was created.
 * @param onError, callback function, gets called when an error occures.
 */
exports.startChannel = function(channelName, onSuccess, onError) {
  cordova.exec(onSuccess, onError, "FWChromecast", "startChannel", [channelName]);
};

/**
 * After a channel was created we can listen to messages from the receiver app.
 *
 * @param channelName, the channel to listen for messages.
 * @param onMessage, callback function, when the receiver sends a message.
 * @param onError, callback function, gets called when an error occures.
 */
exports.onMessage = function(channelName, onMessage, onError){
  cordova.exec(onMessage, onError, "FWChromecast", "listenToMessages", [channelName]);
};

/**
 * After a channel was created we can send messages to the receiver app.
 *
 * @param channelName, the channel to send a message.
 * @param message, the message to send.
 * @param onSuccess, callback function, when message was sent.
 * @param onError, callback function, gets called when an error occures.
 */
exports.sendMessage = function(channelName, message, onSuccess, onError) {
  cordova.exec(onSuccess, onError, "FWChromecast", "sendMessage", [channelName, message]);
};
