//
//  FWChromecast.h
//  HelloCordova
//
//  Created by Franz Wilding on 16.11.15.
//
//

#ifndef FWChromecast_h
#define FWChromecast_h

#import <Cordova/CDV.h>

@interface FWChromecast : CDVPlugin

- (void)scanForDevices:(CDVInvokedUrlCommand*)command;
- (void)selectDevice:(CDVInvokedUrlCommand*)command;
- (void)launchApplication:(CDVInvokedUrlCommand*)command;
- (void)startChannel:(CDVInvokedUrlCommand*)command;
- (void)onMessage:(CDVInvokedUrlCommand*)command;
- (void)sendMessage:(CDVInvokedUrlCommand*)command;

@end


#endif /* FWChromecast_h */