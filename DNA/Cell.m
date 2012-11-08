//
//  Cell.m
//  DNA
//
//  Created by Екатерина Полищук on 06.11.12.
//
//

#import "Cell.h"

@implementation Cell

- (id)init
{
    self = [super init];
    if (self) {
        
        
        _maxSetSymbols = 100;
        _nucleotides = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
        _nucleotidesCount = (int)[_nucleotides count];
        _DNA = [[NSMutableArray alloc] initWithCapacity:_maxSetSymbols];
        
        for (int i = 0; i < _maxSetSymbols; ++i) {
            int symbolOfSet = arc4random_uniform(_nucleotidesCount);
            [_DNA addObject: [_nucleotides objectAtIndex: symbolOfSet]];
        }
    }
    return self;
}

-(int) hammingDistance: (Cell*) theCell {
    
    int count = 0;
    
    for (int i = 0; i < _maxSetSymbols; ++i) {
        if (![[_DNA objectAtIndex:i] isEqual:[[theCell DNA] objectAtIndex:i]])
            ++count;
    }
    
    return count;
}


@end
