//
//  main.m
//  osx-project-1
//
//  Created by Alex on 31.10.12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
    - (void) mutate:(int) val;
@end

@implementation Cell (mutator)

- (void) mutate: (int) val {
    NSArray *validDnaSymbols = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    for (int i = 1; i <= val; i++) {
        [[self dna] replaceObjectAtIndex:i withObject:[validDnaSymbols objectAtIndex:(arc4random() % [validDnaSymbols count])]];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Distance is %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:2];
        [cell2 mutate:3];

        NSLog(@"Distance after mutate is %i", [cell1 hammingDistance:cell2]);
    }
    return 0;
}

