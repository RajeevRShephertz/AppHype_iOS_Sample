//
//  App42ViewController.m
//  AppHypeSample
//
//  Created by Rajeev on 28/08/14.
//  Copyright (c) 2014 Shephertz Technologies Pvt Ltd. All rights reserved.
//

#import "App42ViewController.h"
#define APP_KEY @"8800951aa7b8ceadb4a5f775bac37039a5ff912a8ed06dd19ed35000ec05bc4c"
#define SECRET_KEY @"71c9c21eb313abdf94881b663cdb2f6edf1321ce2fefb82868376c260f04f9b6"

@interface App42ViewController ()

@end

@implementation App42ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [AppHype initializeWithAPIKey:APP_KEY andSecretKey:SECRET_KEY];
    [AppHype enableLogs:YES];
    [[AppHype sharedInstance] setAppHypeListener:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadInterstitialAd:(id)sender {
    AdType adType = kInterstitial;
    [[AppHype sharedInstance] preLoadAd:adType];
    
}

- (IBAction)showInterstitialAd:(id)sender {
    AdType adType = kInterstitial;
    [[AppHype sharedInstance] showAd:adType];
}

- (IBAction)loadVideoAd:(id)sender {
    AdType adType = kVideo;
    [[AppHype sharedInstance] preLoadAd:adType];
}

- (IBAction)showVideoAd:(id)sender {
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
