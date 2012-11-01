//
//  Cell.m
//  DNA
//
//  Created by Ivan Glebov on 01.11.12.
//  Copyright (c) 2012 Ivan Glebov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < 100; i++) {
            int letterValue = arc4random() % 4;
            switch (letterValue) {
                case 0:
                    [_DNA addObject:@"A"];
                    break;
                case 1:
                    [_DNA addObject:@"T"];
                    break;
                case 2:
                    [_DNA addObject:@"G"];
                    break;
                case 3:
                    [_DNA addObject:@"C"];
                    break;
            }
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)DNA2 {
    int distance = 0;
    for (int i = 0; i < 100; i++) {
        if ([self.DNA objectAtIndex:i] == [DNA2.DNA objectAtIndex:i]) distance++;
        //NSLog(@"%@ %@ \n", [self.DNA objectAtIndex:i], [DNA2.DNA objectAtIndex:i]);
    }
    return distance;
}
@end
