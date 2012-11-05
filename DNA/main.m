//
//  main.m
//  DNA
//
//  Created by Mikhail Filippov on 11/4/12.
//  Copyright (c) 2012 Mikhail Filippov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void)mutate:(int)x;

@end

@implementation Cell (mutator)

-(void)mutate:(int)x {
    //Calculate positions for mutation.
    int modifyPositions[x];
    for (int i = 0; i < x; i++) {
        BOOL exists;
        do {
            exists = NO;
            int position = arc4random() % 100;
            for (int j = 0; j < x; j++) {
                if (modifyPositions[j] == position) {
                    exists = YES;
                }
            }
            if (!exists) {
                modifyPositions[i] = position;
            }
        } while (exists);
    }
    //Mutate dna
    NSMutableArray *chars = [[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"С", nil];
    for (int i = 0; i < x; i++) {
        NSMutableArray *charForMutation = [[NSMutableArray alloc] init];
        int charPosition = 0;
        for (int j = 0; j < 4; j++) {
            if ([chars objectAtIndex:j] != [[self dna] objectAtIndex:modifyPositions[i]]) {
                [charForMutation insertObject:[chars objectAtIndex:j] atIndex:charPosition];
                charPosition++;
            }
        }
        [[self dna] replaceObjectAtIndex:modifyPositions[i] withObject:[charForMutation objectAtIndex:arc4random() % 3]];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];

        NSLog(@"%i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:10];
        [cell2 mutate:20];
        
        NSLog(@"%i", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


