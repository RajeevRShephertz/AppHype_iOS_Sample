//
//  AHViewController.h
//  AppHypeSample
//
//  Created by Shephertz Technologies Pvt Ltd on 01/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AppHype_iOS_SDK/AppHype_iOS_SDK.h>

@interface AHViewController : UIViewController<AppHypeListener>

- (IBAction)loadInterstitial:(id)sender;
- (IBAction)showInterstitial:(id)sender;
- (IBAction)loadVideoAd:(id)sender;
- (IBAction)showVideoAd:(id)sender;

@end
