//
//  Cell.m
//  osx-project-1
//
//  Created by Alexander Galato on 06.11.12.
//  Copyright (c) 2012 Alexander Galato. All rights reserved.
//

#import "Cell.h"

@implementation Cell: NSObject
- (id) init {
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithCapacity:100];
        values = @"ATGC";
        for (int i = 0; i<100; i++){
            _DNA[i] = [values substringFromIndex:(arc4random()%3+1)];
        }
    }
    return self;
}
- (int) hammingDistance: (Cell *) toComp{
    int diffs =0;
    for (int i=0; i<100; i++) if ([_DNA[i] isEqualTo: [toComp.DNA objectAtIndex:(i)]]) diffs++;
    return diffs;
}
@end

@implementation Cell (Mutator)
- (void) mutator:(int)percent{
    NSMutableIndexSet *ind;
    ind = [[NSMutableIndexSet alloc] init];
    NSUInteger randIndx = 0;
    for (int i=0; i<percent; i++){
        do{
            randIndx = (arc4random()%[_DNA count]);
        }while ([ind containsIndex: randIndx]);
        [ind addIndex:randIndx];
    };
    NSMutableArray *gens;
    gens = [[NSMutableArray alloc] init];
    for (int i=0; i<percent; i++) gens[i]=[values substringFromIndex:(arc4random()%3+1)];
    [_DNA replaceObjectsAtIndexes: ind withObjects:gens];
}
@end