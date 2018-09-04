//
//  MSRSharedBridge.m
//
//  Created by Michael Schneider.
//  Copyright © 2018 mischneider. All rights reserved.
//

#import "MSRSharedBridge.h"

#if __has_include(<React/RCTBundleURLProvider>)
#import <React/RCTBundleURLProvider.h>
#import <React/RCTUIManager.h>
#else
#import "RCTBundleURLProvider.h"
#import "RCTUIManager.h"
#endif

@implementation MSRSharedBridge

#pragma mark - Lifecycle

+ (MSRSharedBridge *)sharedBridge
{
    static dispatch_once_t once;
    static id sharedBridge;
    dispatch_once(&once, ^{
        sharedBridge = [[self alloc] init];
    });
    return sharedBridge;
}

#pragma mark - RCTBridge

- (RCTBridge *)reactBridge
{
    static RCTBridge *bridge = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
    });
    return bridge;
}

#pragma mark - RCTRootView

- (RCTRootView *)viewForModuleName:(NSString *)moduleName initialProperties:(NSDictionary *)initialProps
{
    return [[RCTRootView alloc] initWithBridge:self.reactBridge moduleName:moduleName initialProperties:initialProps];
}

- (RCTRootView *)rootViewForReactTag:(NSNumber *)reactTag
{
    UIView *rootView = [self.reactBridge.uiManager viewForReactTag:reactTag];
    while (rootView.superview && ![rootView isKindOfClass:RCTRootView.class]) {
        rootView = rootView.superview;
    }
    return (RCTRootView *)rootView;
}

#pragma mark - <RCTBridgeDelegate>

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
}

@end
