//
//  main.m
//  project1
//
//  Created by Василий Слепцов on 01.11.12.
//  Copyright (c) 2012 Василий Слепцов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void) mutate: (int)x;
@end

@implementation Cell (mutator)
- (void) mutate:(int)x {
    int count = (int) (Length * x / [self.DNA count]);
    NSMutableArray *Mutate = [NSMutableArray arrayWithCapacity:Length];
    int i;
    for (i = 0; i < count; i ++) {
        int id_mutate = arc4random() % Length;
        if (![Mutate containsObject:[NSNumber numberWithInt:id_mutate]]) {
            [Mutate addObject:[NSNumber numberWithInt: id_mutate]];
            [self.DNA replaceObjectAtIndex:id_mutate withObject:self.getRandom];
        }
    }
}
@end

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Cell *one = [[Cell alloc] init];
        Cell *two = [[Cell alloc] init];
        
        NSLog(@"hamming distance = %i", [one hammingDistance: two]);
        [one mutate:40];
        [two mutate:80];
        NSLog(@"mutate hamming distance = %i", [one hammingDistance: two]);
    
    }
    return 0;
}

