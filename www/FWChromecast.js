/**
 * Scan the local wifi for chromecast devices. onDiscover get's called, when
 * devices where found.
 *
 * @param receiverAppId, the receiverAppId to filter devices
 * @param onDiscover, callback function, gets called when devices where found.
 * @param onError, callback function, gets called when an error occures.
 */
exports.scanForDevices = function(receiverAppId, onDiscover, onError) {
  cordova.exec(onDiscover, onError, "FWChromecast", "scanForDevices", [receiverAppId]);
};

/**
 * Select a device to use.
 *
 * @param deviceId, the deviceId found by scanForDevices of the chromecast.
 * @param onSelect, call function, gets called when device was selected.
 * @param onError, callback function, gets called when an error occures.
 */
exports.selectDevice = function(deviceId, onSelect, onError) {
  cordova.exec(onSelect, onError, "FWChromecast", "selectDevice", [deviceId]);
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
