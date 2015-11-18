//
//  NSObject_DeviceDelegate.h
//  HelloCordova
//
//  Created by Franz Wilding on 18.11.15.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

@interface CommandDelegate : NSObject

- (id)initWithCommandDelegate:(id<CDVCommandDelegate>)commandDelegate andCallbackId:(NSString*)callbackId;
- (void)sendResponse:(NSDictionary*)response;
@property (nonatomic, weak) id<CDVCommandDelegate> commandDelegate;
@property (nonatomic, strong) NSString* callbackId;

@end
