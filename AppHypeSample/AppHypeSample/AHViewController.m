//
//  AHViewController.m
//  AppHypeSample
//
//  Created by Shephertz Technologies Pvt Ltd on 01/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AHViewController.h"

#define APP_KEY     @"830a9625a1d09989215a2370e026e9cade6fe09b645e782db53bc99deda54272"
#define SECRET_KEY  @"aac6795115e7a0a3d88f70d585e30a197a4a8e6b1cf1b679933921f3e4a4332d"


@interface AHViewController ()

@end

@implementation AHViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [AppHype initializeWithAPIKey:APP_KEY andSecretKey:SECRET_KEY];
    [AppHype enableLogs:YES];
    [[AppHype sharedInstance] setAppHypeListener:self];
    
    int showAdAfterLaunchNumber = 5;
    [[AppHype sharedInstance] restrictAd:showAdAfterLaunchNumber];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadInterstitial:(id)sender
{
    NSLog(@"%s",__FUNCTION__);
    AdType adType = kInterstitial;
    [[AppHype sharedInstance] preLoadAd:adType];
}

- (IBAction)showInterstitial:(id)sender
{
    NSLog(@"%s",__FUNCTION__);

    AdType adType = kInterstitial;
    [[AppHype sharedInstance] showAd:adType];
    
}

- (IBAction)loadVideoAd:(id)sender
{
    NSLog(@"%s",__FUNCTION__);

    AdType adType = kVideo;
    [[AppHype sharedInstance] preLoadAd:adType];
}

- (IBAction)showVideoAd:(id)sender
{
    NSLog(@"%s",__FUNCTION__);

    AdType adType = kVideo;
    [[AppHype sharedInstance] showAd:adType];
}

#pragma mark- AppHypeListeners

-(void)onAdAvailable:(AdType)adType
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"adType=%d",adType);
    [self showAlertWithTitle:@"" andMessage:@"AdAvailable"];
}

-(void)onFailedToLoad:(AppHypeException *)appHypeException
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"%@",appHypeException.reason);
    [self showAlertWithTitle:@"Failed To Load" andMessage:appHypeException.reason];
}

-(void)onFailedToShow:(AppHypeException *)appHypeException
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"%@",appHypeException.reason);
    [self showAlertWithTitle:@"Failed To Show" andMessage:appHypeException.reason];
}

-(void)onHide:(AdType)adType
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"adType=%d",adType);
}

-(void)onShow:(AdType)adType
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"adType=%d",adType);
}

-(void)showAlertWithTitle:(NSString*)title andMessage:(NSString*)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [self.view addSubview:alertView];
    [alertView show];
}


//- (void)deviceOrientationDidChange:(NSNotification *)notification
//{
//    //Obtaining the current device orientation
//    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
//    
//    //Ignoring specific orientations
//    if (orientation == UIDeviceOrientationFaceUp || orientation == UIDeviceOrientationFaceDown || orientation == UIDeviceOrientationUnknown || currentOrientation == orientation) {
//        return;
//    }
//    //[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(relayoutLayers) object:nil];
//    //Responding only to changes in landscape or portrait
//    currentOrientation = orientation;
//    
//    if ((UIDeviceOrientationIsPortrait(currentOrientation) && UIDeviceOrientationIsPortrait(orientation)) ||
//        (UIDeviceOrientationIsLandscape(currentOrientation) && UIDeviceOrientationIsLandscape(orientation))) {
//        //still saving the current orientation
//        currentOrientation = orientation;
//        return;
//    }
//    //
//    //[self performSelector:@selector(orientationChangedMethod) withObject:nil afterDelay:0];
//}

@end
