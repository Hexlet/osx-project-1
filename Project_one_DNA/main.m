//
//  main.m
//  Project_one_DNA
//
//  Created by КYННЭЙ on 11.11.12.
//  Copyright (c) 2012 i.burnashev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void) mutate: (int) X;

@end


@implementation Cell (mutator)

- (void) mutate: (int) X{
    int i;
    NSNumber *newIndex = [NSNumber numberWithInt:0];
    NSArray *arr = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    NSMutableArray *intArr = [[NSMutableArray alloc] init];
    NSString *currentDNACell, *newDNACell;
    
    if (X != 0) {
        newIndex = [NSNumber numberWithInt: arc4random_uniform(100)];
        [intArr insertObject:newIndex atIndex: 0];
    }
    
    for (i = 1; i < X; i++) {
        while ([intArr containsObject: newIndex] == YES) {
            newIndex = [NSNumber numberWithInt: arc4random_uniform(100)];
        }
        [intArr insertObject:newIndex atIndex:i];
    }
    
    //мутируем Х элементов
    for (i = 0; i < X; i++) {
        newIndex = [NSNumber numberWithInt: [intArr[i] intValue]];
        currentDNACell = self.DNA[ [newIndex intValue] ];
        newDNACell = self.DNA[ [newIndex intValue] ];
        while (currentDNACell == newDNACell) {
            newDNACell = arr[arc4random_uniform(4)];
        }
        self.DNA[ [newIndex intValue] ] = newDNACell;
    }
}

@end


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Cell *myDNA;
        Cell *newDNA;
        
        
        myDNA = [[Cell alloc] init];
        newDNA = [[Cell alloc] init];
        
        
        NSLog(@"hamming distance между объектами = %i", [myDNA hammingDistance:newDNA]);
        
        //мутируем на 40%
        [myDNA mutate : 40];
        [newDNA mutate : 40];
        
        NSLog(@"hamming distance между мутировавшими объектами = %i", [myDNA hammingDistance:newDNA]);
        
    }
    return 0;
}