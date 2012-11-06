//
//  AppDelegate.m
//  DNA
//
//  Created by Max Bazaliy on 31.10.12.
//  Copyright (c) 2012 Max Bazaliy. All rights reserved.
//

#import "AppDelegate.h"
#import "Cell.h"
#import "Cell+Mutate.h"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    // Insert code here to initialize your application
}

- (IBAction)run:(id)sender {
    
    //simple validate
    if (([self.percent1TextFld.stringValue length] == 0) || ([self.percent1TextFld.stringValue length] > 2)) {
        return;
    }
    
    if (([self.percent2TextFld.stringValue length] == 0) || ([self.percent2TextFld.stringValue length] > 2)) {
        return;
    }
    
    Cell *cell = [[Cell alloc] init];
    Cell *cell2 = [[Cell alloc] init];
    
    NSLog(@"1st harming distance: %i",[cell hammingDistance:cell2]);
    //modify result textfield
    self.hamming1TextFld.stringValue = [NSString stringWithFormat:@"%i",[cell hammingDistance:cell2]];

    //get value from textfield
    [cell mutate:self.percent1TextFld.intValue];
    [cell2 mutate:self.percent2TextFld.intValue];
    
    NSLog(@"2nd harming distance: %i",[cell hammingDistance:cell2]);
    //modify result textfield
    self.hamming2TextFld.stringValue = [NSString stringWithFormat:@"%i",[cell hammingDistance:cell2]];

}
@end
