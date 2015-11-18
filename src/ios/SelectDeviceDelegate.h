//
//  NSObject_DeviceDelegate.h
//  HelloCordova
//
//  Created by Franz Wilding on 18.11.15.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import "CommandDelegate.h"
#import <GoogleCast/GoogleCast.h>


@interface SelectDeviceDelegate : CommandDelegate

- (void)selectDeviceWithIpAddress:(NSString*) ipAddress andServicePort:(UInt32)servicePort;
@property(nonatomic, strong) GCKDeviceManager* deviceManager;
@property(nonatomic, strong) GCKDevice *device;

@end
