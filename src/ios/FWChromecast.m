//
//  FWChromecast.m
//  HelloCordova
//
//  Created by Franz Wilding on 16.11.15.
//
//

#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>
#import "FWChromecast.h"
#import "DeviceScannerDelegate.h"
#import "SelectDeviceDelegate.h"

@implementation FWChromecast : CDVPlugin

- (void)scanForDevices:(CDVInvokedUrlCommand*)command
{
    NSString *receiverAppId = [command.arguments objectAtIndex:0];
    self.deviceScannerDelegate = [[DeviceScannerDelegate alloc] initWithCommandDelegate:self.commandDelegate
                                                                        andCallbackId:command.callbackId];
    [self.deviceScannerDelegate startScanningForAppId:receiverAppId];
}

- (void)selectDevice:(CDVInvokedUrlCommand*)command
{
    NSString* deviceIpAddress = [command.arguments objectAtIndex:0];
    UInt32 deviceServicePort = (UInt32)[[command.arguments objectAtIndex:1] intValue];
    self.selectDeviceDelegate = [[SelectDeviceDelegate alloc] initWithCommandDelegate:self.commandDelegate
                                                                      andCallbackId:command.callbackId];
    [self.selectDeviceDelegate selectDeviceWithIpAddress:deviceIpAddress andServicePort:deviceServicePort];
}

- (void)launchApplication:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* receiverAppId = [command.arguments objectAtIndex:0];

    //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:
                    [NSString stringWithFormat:@"Not implemented yet. Param: %1$@", receiverAppId]];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startChannel:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* channelName = [command.arguments objectAtIndex:0];

    //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:
                    [NSString stringWithFormat:@"Not implemented yes. Param: %1$@", channelName]];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)onMessage:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* channelName = [command.arguments objectAtIndex:0];

    //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:
                    [NSString stringWithFormat:@"Not implemented yet. Param: %1$@", channelName]];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)sendMessage:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* channelName = [command.arguments objectAtIndex:0];
    NSString* message = [command.arguments objectAtIndex:1];

    //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:
                    [NSString stringWithFormat:@"Not implemented yet. Param: %1$@ -> %2$@", channelName, message]];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
