//
//  AppDelegate.m
//  Assignment04
//
//  Created by JihoonPark on 30/11/2018.
//  Copyright © 2018 JihoonPark. All rights reserved.
//

#import "AppDelegate.h"
#import "TextViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (IBAction)SelectItem:(NSMenuItem *)sender {
    NSLog(@"funnyClick Here %@", sender.title);
    if([sender.title isEqualToString:@"Flower"]){
        [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_FLOWER object:self];
    }else if([sender.title isEqualToString:@"Peppers"]){
        [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_PEPPERS object:self];
    }else if([sender.title isEqualToString:@"Jellyfish"]){
        [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_JELLYFISH object:self];
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
