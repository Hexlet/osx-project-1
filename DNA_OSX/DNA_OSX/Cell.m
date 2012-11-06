//
//  Cell.m
//  DNA_OSX
//
//  Created by aquaxp on 11/6/12.
//  Copyright (c) 2012 aquaxp. All rights reserved.
//

#import "Cell.h"

@implementation Cell
// overloading init
-(id)init{
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithCapacity:100]; // init DNA array
        NSString *protein[4] = {@"A",@"T",@"G",@"C"}; // temporary array hold proteins name
        
        for (int i = 0; i < 100; i++) _DNA[i] = protein[(arc4random() % 4)]; // generating protins chain
    }
    return self;
}
// counting distance
-(int)hammingDistance:(Cell *) cll{
    int hamDist = 0;
    
    for (int i = 0; i < 100; i++) if(_DNA[i] != cll.DNA[i]) hamDist++; // position2position comparsion
    return hamDist;
}
@end
