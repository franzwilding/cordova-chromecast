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
    NSString* deviceId = [command.arguments objectAtIndex:0];
    self.selectDeviceDelegate = [[SelectDeviceDelegate alloc] initWithCommandDelegate:self.commandDelegate
                                                                      andCallbackId:command.callbackId];
    [self.selectDeviceDelegate selectDevice:[self.deviceScannerDelegate findDevice:deviceId]];
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
