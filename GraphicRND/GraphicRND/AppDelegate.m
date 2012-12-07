//
//  AppDelegate.m
//  GraphicRND
//
//  Created by Oleg on 16.11.12.
//  Copyright (c) 2012 Oleg. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

-(IBAction)seed:(id)sender {
    
    srandom((unsigned) time(NULL));
}

-(IBAction)generate:(id)sender {
    
    int rndnum = ((int) (random() % 100 + 1));
    [myLabel setIntValue:rndnum];
}

@end
