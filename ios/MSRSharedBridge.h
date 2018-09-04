//
//  MSRSharedBridge.h
//
//  Created by Michael Schneider.
//  Copyright © 2018 mischneider. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<React/RCTRootView.h>)
#import <React/RCTRootView.h>
#else
#import "RCTRootView.h"
#endif

@interface MSRSharedBridge : NSObject <RCTBridgeDelegate>

/// Returns the shared instance of the bridge manager
@property (class) MSRSharedBridge *sharedBridge;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

/// Underlying react bridge
@property (readonly) RCTBridge *reactBridge;

/// Returns a new root view for a given module and nullable initial props
- (RCTRootView *)viewForModuleName:(NSString *)moduleName initialProperties:(NSDictionary *)initialProps;

/// Returns the root view for a given react tag
- (RCTRootView *)rootViewForReactTag:(NSNumber *)reactTag;

@end
