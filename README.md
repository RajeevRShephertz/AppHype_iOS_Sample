AppHype_iOS_Sample
==================
1. Register/Login to use AppHype Ad Network. 
2. After signing up, create an App that you want to promote by submitting your app's package name on AppSection Page. 
3. Create Cross Promo Campaign of the added App to promote it in other Apps. Create Cross Promotion Campaign page.
4. Now,create another App(s) by adding it on AppSection Page. 
5. Developer can get Application Keys after App creation for SDK integration, which will be needed to initialize AppHype
   SDK. 
6. Download iOS SDK and unzip the dowloaded folder and browse to AppHypeSample folder.
7. Open AppHypeSample Xcode project.
8. In Xcode navigate to AHViewController.h and put API as well as Secret key in the macros above @interface directive:
```
      #define APP_KEY     @"API_KEY"
      #define SECRET_KEY  @"SECRET_KEY"
```
9. Build the sample application and install it on your device.
10. You will see 4 buttons on the device. Click on Load buttons to load the ad of an App which you created in step 3.

## Integrating AppHype_iOS_SDK in an existing iOS application

1. Drag and drop the framework file you downloaded above to the Framework group in the project navigator of the xcode
   project.
2. Add AVFoundfation.framework and CoreMedia.framework to your project as follows:
        - Select the project name in the project navigator pannel
        - Select project name under Target 
        - Select __Build Phases__ in the right side pannel
        - Click on the + button under __Link Binary With Libraries__
        - Add AVFoundation.framework and CoreMedia.framework from the list
3. Import the AppHype SDK header file in the class where you want to use AppHypeSDK APIs
```
#import <AppHype_iOS_SDK/AppHype_iOS_SDK.h>
```
4. Initialize AppHype with the API and SECRET keys you got after app creation from the dashboard:
```
[AppHype initializeWithAPIKey:@"APP_KEY" andSecretKey:@"SECRET_KEY"];
```
5. Developer can also enable logs in application:
```
[AppHype enableLogs:YES];
```
6. In order to receive callBack events from AppHype SDK, developer can set AppHypeListener:
```
[[AppHype sharedInstance] setAppHypeListener:self];
```
7. Developer can put restrictions on when to show the ads in App:
```
int showAdAfterLaunchNumber = 5;
[[AppHype sharedInstance] restrictAd:showAdAfterLaunchNumber];
```
8. In order to show ads(e.g Video or Interstitial) in application, developer has to preLoad them as:
```
  //Make a request to preload Interstitial Ad  
  AdType adType = kInterstitial;// Use kVideo as ADType for Video ad
  [[AppHype sharedInstance] preLoadAd:adType];
```
9. You can show ads in application only if, they are available:
```
  AdType adType = kInterstitial; // Use kVideo as ADType for Video ad
  
  if ([[AppHype sharedInstance] isAvailable:adType]) //Check if ad is available to show
  {
      [[AppHype sharedInstance] showAd:adType];
  }
```
10. You can close Ad using API as well:
```
[[AppHype sharedInstance] closeAd];
```
