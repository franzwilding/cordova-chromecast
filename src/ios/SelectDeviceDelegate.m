//
//  DeviceDelegate.m
//  HelloCordova
//
//  Created by Franz Wilding on 18.11.15.
//
//

#import <Foundation/Foundation.h>
#import "SelectDeviceDelegate.h"
#import <GoogleCast/GoogleCast.h>

@interface SelectDeviceDelegate() <GCKDeviceManagerDelegate> {
}
@end

@implementation SelectDeviceDelegate

- (void)selectDevice:(GCKDevice*) device {
    self.device = device;
    self.deviceManager = [[GCKDeviceManager alloc] initWithDevice:self.device clientPackageName:[NSBundle mainBundle].bundleIdentifier];
    self.deviceManager.delegate = self;
    [self.deviceManager connect];
}

#pragma mark - GCKDeviceManagerDelegate

// [START launch-application]
- (void)deviceManagerDidConnect:(GCKDeviceManager *)deviceManager {
    NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          self.device.deviceID, @"id",
                          self.device.friendlyName, @"friendlyName",
                          self.device.ipAddress, @"ipAddress",
                          [[NSNumber alloc] initWithUnsignedInt:self.device.servicePort], @"servicePort", nil];
    [self sendResponse:data from:@"deviceConnected" andKeepItAlive:false];
}
// [END launch-application]

- (void)deviceManager:(GCKDeviceManager *)deviceManager
didConnectToCastApplication:(GCKApplicationMetadata *)applicationMetadata
            sessionID:(NSString *)sessionID
  launchedApplication:(BOOL)launchedApplication {
    NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          applicationMetadata.applicationID, @"applicationID",
                          applicationMetadata.applicationName, @"applicationName",
                          applicationMetadata.senderAppIdentifier, @"senderAppIdentifier",
                          applicationMetadata.senderAppLaunchURL, @"senderAppLaunchURL", nil];
    if (launchedApplication) {
        [self sendResponse:data from:@"applicationLaunched" andKeepItAlive:false];
    }
    else{
        [self sendResponse:data from:@"applicationNotLaunched" andKeepItAlive:false];
    }
}

- (void)deviceManager:(GCKDeviceManager *)deviceManager
didFailToConnectToApplicationWithError:(NSError *)error {
    [self sendResponse:[NSString stringWithFormat:@"%@", error] from:@"failToConnectToApp" andKeepItAlive:false];
}

- (void)deviceManager:(GCKDeviceManager *)deviceManager
didFailToConnectWithError:(GCKError *)error {
    [self sendResponse:[NSString stringWithFormat:@"%@", error] from:@"failToConnect" andKeepItAlive:false];
}

- (void)deviceManager:(GCKDeviceManager *)deviceManager
didDisconnectWithError:(GCKError *)error {
    [self sendResponse:[NSString stringWithFormat:@"%@", error] from:@"disconnectWithError" andKeepItAlive:false];
}

- (void)deviceManager:(GCKDeviceManager *)deviceManager
didReceiveStatusForApplication:(GCKApplicationMetadata *)applicationMetadata {
    NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          applicationMetadata.applicationID, @"applicationID",
                          applicationMetadata.applicationName, @"applicationName",
                          applicationMetadata.senderAppIdentifier, @"senderAppIdentifier",
                          applicationMetadata.senderAppLaunchURL, @"senderAppLaunchURL", nil];
    [self sendResponse:data from:@"receiveStatusForApp" andKeepItAlive:false];
}

@end