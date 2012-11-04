//
//  Cell.m
//  DNA3
//
//  Created by Igor Nikonov on 03.11.12.
//  Copyright (c) 2012 ngoro. All rights reserved.
//

#import "Cell.h"

@implementation Cell

static const int DNA_SIZE = 100;
static const NSString *DNASET = @"ATGC";

- (id)init
{
    self = [super init];
    if (self) {

        
        _DNA = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];
        
        for (int i=0; i<DNA_SIZE; i++) {

            [_DNA addObject: Cell.getRandomLetter];
        }
    }
    return self;
}

+ (NSString *) getRandomLetter {
    int r = arc4random() % 4;
    return [DNASET substringWithRange: NSMakeRange(r, 1)];
}

- (NSString *)description {
    if(_DNA == Nil)
        return @"(Empty cell)";
    else {
        NSMutableString *str = [[NSMutableString alloc] init];
        for(int i=0; i<[_DNA count]; i++) {
            [str appendString:[_DNA objectAtIndex:i]];
        }
    return str;
    }
}

-(int)hammingDistance:(Cell *)another
{
    if(another == Nil)
        return DNA_SIZE;
    
    int diff = 0;
    for(int i=0; i<DNA_SIZE; i++)
    {
        if([_DNA objectAtIndex:i] == [another.DNA objectAtIndex:i] )
            diff++;
    }
    
    return diff;
}

@end
