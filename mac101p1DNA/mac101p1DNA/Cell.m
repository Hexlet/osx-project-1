//
//  Cell.m
//  mac101p1DNA
//
//  Created by Voleg on 31.10.12.
//  Copyright (c) 2012 Voleg. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    // генерация DNA
    self = [super init];
    if (self) {
        mols = [[NSArray alloc] initWithObjects:@"A", @"C", @"G", @"T", nil];
        DNA = [[NSMutableArray alloc] init];
    }
    return self;
}

-(id) initLength:(int) l{
    self = [self init]; if (self) {
        for (int i = 0; i < l; i++)[DNA addObject:[mols objectAtIndex:arc4random()%4]];
    }
    return self;
}

-(void) hammingDistance {
    // @todo ...
    
}

@end
