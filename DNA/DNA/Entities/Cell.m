//
//  Cell.m
//  DNA
//
//  Created by Evgeny Plenkin on 08.11.12.
//  Copyright (c) 2012 EvgenyPlenkin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {
    self = [super init];
    _DNA = [[NSMutableArray alloc] init];
    letterArray = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
    for (int i = 0; i < 100; i++) {
        int random = arc4random() % 3;
        [_DNA addObject:[letterArray objectAtIndex:random]];
    }
    [self initCheckDNA];
    return self;
}

-(int)hammingDistance:(Cell *)cell {
    int counter = 0;
    for (int i = 0; i < 100; i++) {
        NSString *tempString = [_DNA objectAtIndex:i];
        if ([tempString compare:[[cell DNA] objectAtIndex:i]]) {
            counter++;
        }
    }
    return counter;
}

-(void)initCheckDNA {
    checkDNA = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        [checkDNA addObject:@"NO"];
    }
}

@end
