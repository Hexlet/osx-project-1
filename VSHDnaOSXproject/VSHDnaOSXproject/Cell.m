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
    if ( self ) {
        _dna = [[NSMutableArray alloc] init];
        for ( int i = 0; i < DNA_LENGTH; i++ ) {
            [_dna addObject:[[Nucleotide alloc] init]];
        }
    }
    return self;
}
-(void)print {
    NSMutableString *res = [[NSMutableString alloc] init];
    for(Nucleotide *item in _dna ) {
        [res appendFormat:@"%@", item];
    }
    NSLog(@"%@", res);
}

-(int)hammingDistance:(Cell *)secondCell{
    int diff = 0;
    for ( int i = 0; i < [_dna count]; i++) {
        if ( ! [_dna[i] isEqualTo:secondCell.dna[i]]) {
            diff++;
        }
    }
    return diff;
}
@end
