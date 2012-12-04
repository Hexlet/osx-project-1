//
//  Cell.m
//  DNA
//
//  Created by Viktor Yamchinov on 11/4/12.
//  Copyright (c) 2012 Viktor Yamchinov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    self->DNA = [[NSMutableArray alloc] init];
    
    for( int i = 0; i < 100; i++)
    {
        int r = arc4random() % 4;
        if (r == 0){
            [DNA addObject:[NSString stringWithFormat:@"A", i]];
        }
        else if (r == 1) {
            [DNA addObject:[NSString stringWithFormat:@"T", i]];
        }
        else if (r == 2) {
            [DNA addObject:[NSString stringWithFormat:@"C", i]];
        }
        else if (r == 3) {
            [DNA addObject:[NSString stringWithFormat:@"G", i]];
        }
    }
    return self;
}
- (int) hammingDistance:(Cell *)c{
    int count = 0;
    for(int i = 0; i< 100;i++)
    {
        if ([self->DNA objectAtIndex:i] == [c->DNA objectAtIndex:i]) {
            count++;
        }
    }
    return count;
}
-(void) printHammingDistance:(int)hd{
    NSLog(@"Hamming distance: %i", hd);
}
@end
