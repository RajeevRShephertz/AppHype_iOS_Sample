//
//  App42ViewController.h
//  AppHypeSample
//
//  Created by Rajeev on 28/08/14.
//  Copyright (c) 2014 Shephertz Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AppHype_iOS_SDK/AppHype_iOS_SDK.h>

@interface App42ViewController : UIViewController<AppHypeListener>

- (IBAction)loadInterstitialAd:(id)sender;
- (IBAction)showInterstitialAd:(id)sender;
- (IBAction)loadVideoAd:(id)sender;
- (IBAction)showVideoAd:(id)sender;

@end
