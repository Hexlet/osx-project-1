//
//  main.m
//  DNA
//
//  Created by Gennadii Lukash on 10/31/12.
//  Copyright (c) 2012 Gennadii Lukash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
    -(void) mutate: (int) percent;
@end

@implementation Cell(Mutator)

-(void)mutate:(int)percent{
    NSMutableArray *indexBox = [[NSMutableArray alloc] init];
    NSArray *charsDNA = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    
    if (percent > 0 && percent <= 100) {
        for (int count = 0; count < percent; count++) {
            
            //Generation random index
            int r_index = arc4random() % 100;
            
            //If this index was replaced, need take fresh
                while ([indexBox containsObject:[NSString stringWithFormat: @"%d", r_index]]) {
                    r_index = arc4random() % 100;
                }
            //Add replaced index to count array
            [indexBox addObject:[NSString stringWithFormat: @"%d", r_index]];
            
            //Generate new symbol for DNA
            NSString *symbol = [charsDNA objectAtIndex: arc4random()%4 ];
            
            //Need take another symbol
            while ([self.DNA objectAtIndex:r_index] == symbol) {
                symbol = [charsDNA objectAtIndex: arc4random()%4 ];
            }
            
            //Add to DNA mutated object
            [self.DNA replaceObjectAtIndex:r_index withObject:symbol];
        }
    } else{
        NSLog(@"Type percent in range 1..100");
    }
    
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *dna_1, *dna_2;
        int percentForMutate = 50;
        
        dna_1 = [[Cell alloc] init];
        dna_2 = [[Cell alloc] init];
        
        if (percentForMutate > 0 && percentForMutate <= 100 ) {
           NSLog(@"\n Normal Hamming Distance is %d", [dna_1 hammingDistance: dna_2]);
            [dna_1 mutate: percentForMutate];
            [dna_2 mutate: percentForMutate];
            NSLog(@"\n Mutated Hamming Distance is %d", [dna_1 hammingDistance: dna_2]);
        } else {
            NSLog(@" \n Type percent in range 1..100");
        }
        
        
    }
    return 0;
}

