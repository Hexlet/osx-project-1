//
//  main.m
//  DNA
//
//  Created by Viktor Yamchinov on 11/4/12.
//  Copyright (c) 2012 Viktor Yamchinov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
@interface Cell (mutator)
    -(void) mutate:(int) mut;
@end

@implementation Cell (mutator)

    -(void) mutate:(int)mut{
        for(int i = 0; i <= mut; i++)
        {
            int r = arc4random() % 100;
            int r2 = arc4random() % 4;
            if (r2 == 0){
                [self->DNA removeObjectAtIndex:r];
                [self->DNA addObject:[NSString stringWithFormat:@"A", i]];
            }
            else if (r2 == 1) {
                [self->DNA removeObjectAtIndex:r];
                [self->DNA addObject:[NSString stringWithFormat:@"T", i]];
            }
            else if (r2 == 2) {
                [self->DNA removeObjectAtIndex:r];
                [self->DNA addObject:[NSString stringWithFormat:@"C", i]];
            }
            else if (r2 == 3) {
                [self->DNA removeObjectAtIndex:r];
                [self->DNA addObject:[NSString stringWithFormat:@"G", i]];
            }
        }
    }

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        //[cell1 printHammingDistance:[cell1 hammingDistance:cell2]];
        
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);
        [cell1 mutate:50];
        [cell2 mutate:25];
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}

