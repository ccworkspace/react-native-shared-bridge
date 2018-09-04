//
//  MSRReactNativeViewController.m
//
//  Created by Michael Schneider on 2/6/18.
//  Copyright © 2018 mischneider. All rights reserved.
//

#import "MSRReactNativeViewController.h"

#import "MSRSharedBridge.h"

#pragma mark -
#pragma mark - MSRReactNativeViewController

@interface MSRReactNativeViewController ()
@property (nonatomic, copy) NSString *moduleName;
@property (nonatomic, copy) NSDictionary<NSString *, id> *initialProperties;
@end

@implementation MSRReactNativeViewController

#pragma mark - Lifecycle

- (instancetype)initWithModuleName:(NSString *)moduleName initialProperties:(NSDictionary<NSString *, id> *)initialProperties
{
  self = [super initWithNibName:nil bundle:nil];
  if (self != nil) {
    _moduleName = [moduleName copy];
    _initialProperties = [initialProperties copy];
  }
  return self;
}

RCT_NOT_IMPLEMENTED(-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil)
RCT_NOT_IMPLEMENTED(-(instancetype)initWithCoder:(nonnull NSCoder *)aDecoder)

#pragma mark - UIViewController

- (void)loadView
{
  // Uses the shared bridge to set it's view
  self.view = [MSRSharedBridge.sharedBridge viewForModuleName:self.moduleName initialProperties:self.initialProperties];
}

@end
