//
//  main.m
//  KobaDNA
//
//  Created by koba on 03.11.12.
//  Copyright (c) 2012 koba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate: (int) value;
@end

@implementation Cell (mutator)
-(void) mutate: (int) value{
    int count = 0;
    NSMutableArray *history = [[NSMutableArray alloc] init];
    
    while (count < [self.DNA count] / 100 * value) {
        int rnd = arc4random() % [self.DNA count];
        if (![history containsObject:[NSNumber numberWithInt:rnd]]) {
            [self.DNA replaceObjectAtIndex:rnd withObject:[Cell getMutation]];
            [history addObject:[NSNumber numberWithInt:rnd]];
            count++;
        }
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"First distance: %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:25];
        [cell2 mutate:60];
        
        NSLog(@"Second distance: %i", [cell1 hammingDistance:cell2]);
    }
    return 0;
}

