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

- (void)selectDeviceWithIpAddress:(NSString*) ipAddress andServicePort:(UInt32)servicePort {
    
    self.device = [[GCKDevice alloc] initWithIPAddress:ipAddress servicePort:servicePort];
    
    self.deviceManager = [[GCKDeviceManager alloc] initWithDevice:self.device clientPackageName:[NSBundle mainBundle].bundleIdentifier];
    self.deviceManager.delegate = self;
    [self.deviceManager connect];
}

#pragma mark - GCKDeviceManagerDelegate

// [START launch-application]
- (void)deviceManagerDidConnect:(GCKDeviceManager *)deviceManager {
    NSLog(@"connected to %@", self.device.friendlyName);
}
// [END launch-application]

- (void)deviceManager:(GCKDeviceManager *)deviceManager
didConnectToCastApplication:(GCKApplicationMetadata *)applicationMetadata
            sessionID:(NSString *)sessionID
  launchedApplication:(BOOL)launchedApplication {
    if (launchedApplication) {
        NSLog(@"application has launched");
    }
    else{
        NSLog(@"application has not launched");
    }
}

- (void)deviceManager:(GCKDeviceManager *)deviceManager
didFailToConnectToApplicationWithError:(NSError *)error {
    NSLog(@"ERROR: %@", error);
}

- (void)deviceManager:(GCKDeviceManager *)deviceManager
didFailToConnectWithError:(GCKError *)error {
    NSLog(@"ERROR: %@", error);
}

- (void)deviceManager:(GCKDeviceManager *)deviceManager
didDisconnectWithError:(GCKError *)error {
    NSLog(@"ERROR: %@", error);
}

- (void)deviceManager:(GCKDeviceManager *)deviceManager
didReceiveStatusForApplication:(GCKApplicationMetadata *)applicationMetadata {
    NSLog(@"Received device status: %@", applicationMetadata);
}

@end