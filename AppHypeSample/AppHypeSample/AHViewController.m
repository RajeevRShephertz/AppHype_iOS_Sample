//
//  AHViewController.m
//  AppHypeSample
//
//  Created by Shephertz Technologies Pvt Ltd on 01/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AHViewController.h"

#define APP_KEY @"Your_API_Key"
#define SECRET_KEY @"Your_Secret_Key"


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

@end
