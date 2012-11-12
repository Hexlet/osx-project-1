//
//  Cell.m
//  test1
//
//  Created by Leonov on 10.11.12.
//  Copyright (c) 2012 Leonov. All rights reserved.
//

#import "Cell.h"

@implementation Cell{
//NSMutableArray *DNA;

}
-(id)init{
    self = [super init];
    NSString *atgc = @"ATGC";
    _DNA = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i<100; i++) {
        int newElement = arc4random() % [atgc length];
        [_DNA addObject:[NSString stringWithFormat:@"%c",[atgc characterAtIndex:newElement]]];
    }
    return self;
}
-(int)hammingDistance :(Cell*) aCell {
    int sovp = 0;
    for (int i = 0; i < 100; ++i)
    {
        if ([[aCell DNA] objectAtIndex:i] != [_DNA objectAtIndex:i])
        {
            sovp++;
        }
    }
    return sovp;
}



@end
