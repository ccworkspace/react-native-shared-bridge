//
//  MSRReactNativeViewController.h
//
//  Created by Michael Schneider on 2/6/18.
//  Copyright © 2018 mischneider. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * A generic view controller that is hosting a react native view which renders the component passed in a given module
 * and passes in initial properties.
 */
@interface MSRReactNativeViewController : UIViewController

/**
 * Returns a view controller object with a root view that is initialized with the moduleName and the initialProperties
 */
- (instancetype)initWithModuleName:(NSString *)moduleName initialProperties:(nullable NSDictionary<NSString *, id> *)initialProperties NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
