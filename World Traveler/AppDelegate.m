//
//  AppDelegate.m
//  World Traveler
//
//  Created by David Pirih on 17.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import "AppDelegate.h"
#import "PPMenuViewController.h"
#import "PPListViewController.h"
#import "MMDrawerVisualState.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"WorldTravelerModel"];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    PPMenuViewController *menuViewController = (PPMenuViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"MenuViewControllerID"];
    PPListViewController *listViewController = (PPListViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ListViewControllerID"];
    
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:listViewController leftDrawerViewController:menuViewController];
    [self.drawerController setMaximumLeftDrawerWidth:240.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    //[self.drawerController setDrawerVisualStateBlock:[MMDrawerVisualState slideVisualStateBlock]];
    [self.drawerController setDrawerVisualStateBlock:[MMDrawerVisualState slideAndScaleVisualStateBlock]];
    //[self.drawerController setDrawerVisualStateBlock:[MMDrawerVisualState swingingDoorVisualStateBlock]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self.window setRootViewController:self.drawerController];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
