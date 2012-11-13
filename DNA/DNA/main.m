//
//  main.m
//  DNA
//
//  Created by artem on 11/12/12.
//  Copyright (c) 2012 Wilfred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
    -(void) mutate:(int) percent;
@end

@implementation Cell (Mutator)
-(void) mutate:(int) percent {
    int uniq_number = 0;
    NSMutableArray *change_elem_position = [[NSMutableArray alloc] init];
    for (int i = 0; i < DNA_length; ++i) {
        [change_elem_position addObject:[NSString stringWithFormat:@"%d", 0]];
    }
    while (uniq_number < percent) {
        int rand_pos = random() % 100;
        if ([change_elem_position objectAtIndex:rand_pos] == [NSString stringWithFormat:@"%d", 0]) {
            [change_elem_position insertObject:[NSString stringWithFormat:@"%d", 1] atIndex:rand_pos];
            uniq_number++;
        }
    }
    for (int i = 0; i < DNA_length; ++i) {
        if ([change_elem_position objectAtIndex:i] != [NSString stringWithFormat:@"%d", 0]) {
            long newElement = random();
            char DNA_elem;
            if (newElement % 4 == 0) {
                DNA_elem = 'A';
            }
            if (newElement % 4 == 1) {
                DNA_elem = 'T';
            }
            if (newElement % 4 == 2) {
                DNA_elem = 'G';
            }
            if (newElement % 4 == 3) {
                DNA_elem = 'C';
            }
            [DNA insertObject:[NSString stringWithFormat:@"%c", DNA_elem] atIndex:i];
        }
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell1, *myCell2;
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        NSLog(@"Hamming distance before mutation = %d", [myCell1 hammingDistance:(myCell2)]);
        [myCell1 mutate:23];
        [myCell2 mutate:42];
        NSLog(@"Hamming distance after mutation = %d", [myCell1 hammingDistance:(myCell2)]);
    }
    return 0;
}

