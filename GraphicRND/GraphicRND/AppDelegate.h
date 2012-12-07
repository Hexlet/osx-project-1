//
//  AppDelegate.h
//  GraphicRND
//
//  Created by Oleg on 16.11.12.
//  Copyright (c) 2012 Oleg. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {

    IBOutlet NSTextField *myLabel;
}

@property (assign) IBOutlet NSWindow *window;

-(IBAction)generate:(id)sender;
-(IBAction)seed:(id)sender;


@end
