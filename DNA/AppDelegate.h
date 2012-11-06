//
//  AppDelegate.h
//  DNA
//
//  Created by Max Bazaliy on 31.10.12.
//  Copyright (c) 2012 Max Bazaliy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *percent1TextFld;
@property (weak) IBOutlet NSTextField *percent2TextFld;

@property (weak) IBOutlet NSTextField *hamming1TextFld;
@property (weak) IBOutlet NSTextField *hamming2TextFld;

@end
