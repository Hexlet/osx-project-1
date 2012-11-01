//
//  main.m
//  hexlet-project1
//
//  Created by Alexey Karguine on 01.11.12.
//  Copyright (c) 2012 Alexey Karguine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#include <stdlib.h>

@interface Cell (mutator)
-(void)mutate:(int)p;
@end

@implementation Cell (mutator)
-(void)mutate: (int)p {

    int position;
    int percent = DNALength * p / 100;
    NSMutableArray *replaced;
    replaced = [[NSMutableArray alloc] initWithCapacity:p];

    for (int i = 0; i < percent; i++) {
        for (;;) {
            boolean_t done = NO;
            position = arc4random() % 100;
            
            if ([replaced count] == 0) {
                [replaced addObject:[NSNumber numberWithInt:position]];
                break;
            }
            
            for (id obj in replaced) {
                if (![obj isEqualToNumber:[NSNumber numberWithInt:position]] ) {
                    done = YES;
                }
            }

            if (done) {
                [replaced addObject:[NSNumber numberWithInt:position]];
                break;
            }

        }
        
        [self.dna replaceObjectAtIndex:position withObject:[self.alphabet objectAtIndex:arc4random() % [self.alphabet count]]];
    }
    return;
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"%i",[cell1 hammingDistance:cell2]);
        
        [cell1 mutate:42];
        [cell2 mutate:13];
        
        NSLog(@"%i",[cell1 hammingDistance:cell2]);

        
    }
    return 0;
}

