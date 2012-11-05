//
//  Cell+CellMuattor.m
//  VSHDnaOSXproject
//
//  Created by vshcryabets@gmail.com on 11/5/12.
//  Copyright (c) 2012 vshcryabets@gmail.com. All rights reserved.
//

#import "Cell+CellMuattor.h"

@implementation Cell (CellMuattor)
-(void)mutate:(int)n {
    // prepare postions array
    NSMutableArray *positions = [[NSMutableArray alloc] init];
    NSUInteger length = [[self dna] count];
    for ( int i = 0 ; i < length; i++ ) {
        [positions addObject:[NSNumber numberWithInt:i]];
    }
    // update DNA array
    int count = length*n/100;
    for ( int i = 0 ; i < count; i++ ) {
        int firstIndex = arc4random()%[positions count];
        NSNumber *secondIndex = positions[firstIndex];
        [positions removeObjectAtIndex:firstIndex];
        Nucleotide* n = [self dna][secondIndex.unsignedIntegerValue];
        [n mutate];
    }
}
@end
