//
//  Cell.m
//  VSHDnaOSXproject
//
//  Created by vshcryabets@gmail.com on 11/1/12.
//  Copyright (c) 2012 vshcryabets@gmail.com. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSMutableArray *dna;
}

-(Cell*)init
{
    self = [super init];
    dna = [[NSMutableArray alloc] init];
    for ( int i = 0; i < 100; i++ ) {
        NSInteger value = (arc4random()%4);
        [dna addObject:[[NSNumber alloc] initWithInteger:value]];
    }
    return self;
}
-(void)print {
    for(NSObject *item in dna ) {
        NSLog(@"%@", item);
    }
}

@end
