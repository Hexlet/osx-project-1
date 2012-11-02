//
//  Cell.m
//  VSHDnaOSXproject
//
//  Created by vshcryabets@gmail.com on 11/1/12.
//  Copyright (c) 2012 vshcryabets@gmail.com. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(Cell*)init
{
    self = [super init];
    _dna = [[NSMutableArray alloc] init];
    for ( int i = 0; i < 100; i++ ) {
        [_dna addObject:[NSNumber numberWithInt:(arc4random()%4)]];
    }
    return self;
}
-(void)print {
    for(NSObject *item in _dna ) {
        NSLog(@"%@", item);
    }
}

-(int)hammingDistance:(Cell *)secondCell{
    int diff = 0;
    for ( int i = 0; i < _dna.count; i++) {
        if ( ! [_dna[i] isEqualToNumber:secondCell.dna[i]]) {
            diff++;
        }
    }
    return diff;
}
@end
