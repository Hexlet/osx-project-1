//
//  main.m
//  osx project 1
//
//  Created by Nikolay Nazarov on 03.11.12.
//  Copyright (c) 2012 Nikolay Nazarov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate: (int) percent;
@end

@implementation Cell (mutator)
-(void) mutate: (int) percent{
    int mutate_count = (int) (DNA_length*percent/[self.DNA count]);
    NSMutableArray *DNA_mutate_cell = [NSMutableArray arrayWithCapacity:DNA_length];
    while (mutate_count) {
        int mutate_cell_id = arc4random() % DNA_length;
        if (![DNA_mutate_cell containsObject:[NSNumber numberWithInt:mutate_cell_id]]) {
            [DNA_mutate_cell addObject:[NSNumber numberWithInt:mutate_cell_id]];
            [self.DNA replaceObjectAtIndex:mutate_cell_id withObject:self.getRandomNucleotide];
            mutate_count--;
        }
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell,*myAnotherCell;
        myCell = [[Cell alloc]init];
        myAnotherCell = [[Cell alloc]init];
        
        NSLog(@"hamming distance = %i",[myCell hammingDistance:myAnotherCell]);
        [myCell mutate:40];
        [myAnotherCell mutate:80];
        NSLog(@"hamming distance after mytate = %i",[myCell hammingDistance:myAnotherCell]);
    }
    return 0;
}

