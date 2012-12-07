//
//  AppDelegate.h
//  Boltalka
//
//  Created by Oleg on 20.11.12.
//  Copyright (c) 2012 Oleg. All rights reserved.
///Users/oleg/Documents/osx-project-1/Boltalka/Boltalka/AppDelegate.m

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSSpeechSynthesizerDelegate> {
    
    NSSpeechSynthesizer *speaker;
    
    NSArray *voices;
    
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textPole;

- (IBAction)speakIt:(id)sender;
- (IBAction)stopIt:(id)sender;
@property (weak) IBOutlet NSTableView *tableView;

@end
