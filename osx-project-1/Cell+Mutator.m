//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Andrey Shindarev on 07.02.13.
//  Copyright (c) 2013 Andrey Shindarev. All rights reserved.
//

#import "Cell+Mutator.h"
#import <stdlib.h>

@implementation Cell (Mutator)

-(void)mutation:(int)percent {
    percent = (int)MAX(0, (int)MIN(percent, (int)[[self DNA] count]));
    int cnt = round([[self DNA] count] * percent / 100);
    NSMutableArray *elements = [NSMutableArray arrayWithCapacity:cnt];
    while ([elements count] < cnt) {
        int pos = arc4random() % [[self DNA] count];
        NSNumber *nsPos = [NSNumber numberWithInt:pos];
        if (![elements containsObject:nsPos]) {
            [elements insertObject: nsPos atIndex:[elements count]];
            [[self DNA] setObject: [Cell getRandomElement:[[self DNA] objectAtIndex:pos]] atIndexedSubscript:pos];
        }
    }
}

@end
