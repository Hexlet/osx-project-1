//
//  main.m
//  VSHDnaOSXproject
//
//  Created by vshcryabets@gmail.com on 11/1/12.
//  Copyright (c) 2012 vshcryabets@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)n;
@end

@implementation Cell (mutator)

-(void)mutate:(int)n {
    // prepare postions array
    NSMutableArray *positions = [[NSMutableArray alloc] init];
    NSUInteger length = [[self dna] count];
    for ( int i = 0 ; i < length; i++ ) {
        [positions addObject:[NSNumber numberWithInt:i]];
    }
    // update DNA array
    for ( int i = 0 ; i < n; i++ ) {
        int firstIndex = arc4random()%[positions count];
        NSNumber *secondIndex = positions[firstIndex];
        [positions removeObjectAtIndex:firstIndex];
        [[self dna] replaceObjectAtIndex:[secondIndex unsignedIntegerValue] withObject:[Cell getRandom] ];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        [cell1 print];
        [cell2 print];
        NSLog(@"Hamming disctance=%d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:20];
        [cell2 mutate:30];
        [cell1 print];
        [cell2 print];
        NSLog(@"Hamming disctance after mutation=%d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}

