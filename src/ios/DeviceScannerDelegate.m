//
//  DeviceDelegate.m
//  HelloCordova
//
//  Created by Franz Wilding on 18.11.15.
//
//

#import <Foundation/Foundation.h>
#import "DeviceScannerDelegate.h"
#import <GoogleCast/GoogleCast.h>

@interface DeviceScannerDelegate() <GCKDeviceScannerListener> {
}
@end

@implementation DeviceScannerDelegate

- (void)startScanningForAppId:(NSString*) appId {
    
    // Establish filter criteria.
    GCKFilterCriteria *filterCriteria = [GCKFilterCriteria criteriaForAvailableApplicationWithID:appId];
    
    // Initialize device scanner.
    /*self.deviceScanner = [[GCKDeviceScanner alloc] initWithFilterCriteria:filterCriteria];
    [_deviceScanner addListener:self];
    [_deviceScanner startScan];*/
    self.deviceScanner = [[GCKDeviceScanner alloc] init];
    [self.deviceScanner addListener:self];
    [self.deviceScanner startScan];
}

// [START device-scanner-listener]
#pragma mark - GCKDeviceScannerListener
- (void)deviceDidComeOnline:(GCKDevice *)device {
    [self sendResponse:[[NSDictionary alloc] initWithObjectsAndKeys:
                        @"online", @"action",
                        device.friendlyName, @"friendlyName",
                        device.ipAddress, @"ipAddress",
                        [[NSNumber alloc] initWithUnsignedInt:device.servicePort], @"servicePort", nil]];
}

- (void)deviceDidGoOffline:(GCKDevice *)device {
    [self sendResponse:[[NSDictionary alloc] initWithObjectsAndKeys:
                        @"offline", @"action",
                        device.friendlyName, @"friendlyName",
                        device.ipAddress, @"ipAddress",
                        [[NSNumber alloc] initWithUnsignedInt:device.servicePort], @"servicePort", nil]];
}
// [END device-scanner-listener]

@end