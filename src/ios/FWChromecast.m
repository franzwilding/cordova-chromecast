//
//  FWChromecast.m
//  HelloCordova
//
//  Created by Franz Wilding on 16.11.15.
//
//

#import <Foundation/Foundation.h>
#import "FWChromecast.h"
#import <Cordova/CDV.h>

@implementation FWChromecast : CDVPlugin

- (void)scanForDevices:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* receiverAppId = [command.arguments objectAtIndex:0];

    //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:
                    [NSString stringWithFormat:@"Not implemented yet. Param: %1$@", receiverAppId]];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)selectDevice:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* deviceId = [command.arguments objectAtIndex:0];

    //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:
                    [NSString stringWithFormat:@"Not implemented yet. Param: %1$@", deviceId]];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
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
