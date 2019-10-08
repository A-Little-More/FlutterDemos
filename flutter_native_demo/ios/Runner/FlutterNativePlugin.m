//
//  FlutterNativePlugin.m
//  Runner
//
//  Created by lidong on 2019/7/20.
//  Copyright © 2019年 The Chromium Authors. All rights reserved.
//

#import "FlutterNativePlugin.h"

@implementation FlutterNativePlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"com.test.callIos" binaryMessenger:[registrar messenger]];
    FlutterNativePlugin *instance = [[FlutterNativePlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([call.method isEqualToString:@"getName"]) {
        sleep(5);
        result(@"name: lidong");
    } else {
        result(@"no call");
    }
}

@end
