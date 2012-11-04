//
//  Cell.m
//  DNA
//
//  Created by Gennadii Lukash on 10/31/12.
//  Copyright (c) 2012 GL. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    if (self = [super init]) {
      
        //Size array's DNA
        _DNA = [NSMutableArray arrayWithCapacity:LENGHT_DNA_ARRAY];
       
        //Create DNA with random elements from define constant CHARS_DNA
        for (int count=0; count<LENGHT_DNA_ARRAY; count++){
            int random_index = arc4random()%4;
        
            // Add symbol from elements DNA with random index
            [_DNA addObject:[CHARS_DNA objectAtIndex:random_index]];
        }
      }
    return self;
}

-(void) printDNA {
    NSLog(@"%@", _DNA);
}

-(int) hammingDistance:(Cell *)dna_1{
    int hamming_count = 0;
        for (int indexCounter=0; indexCounter < LENGHT_DNA_ARRAY; indexCounter++){
            //Compare each symbol step by step
            if ([self.DNA objectAtIndex: indexCounter]  != [dna_1.DNA objectAtIndex: indexCounter]) {
                hamming_count++;
            }
            
        }
    return hamming_count;
}
@end
