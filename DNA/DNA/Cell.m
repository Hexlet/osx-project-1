//
//  Cell.m
//  DNA
//
//  Created by Gennadii Lukash on 10/31/12.
//  Copyright (c) 2012 Gennadii Lukash. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    if (self = [super init]) {
        
        //elemenst for DNA
        NSArray *charsDNA = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        
        //Size array's DNA
        _DNA = [NSMutableArray arrayWithCapacity:100];
       
        //Create DNA with random elements from charsDNA
        for (int count=0; count<100; count++){
            int r_index = arc4random()%4;
        
            // Add symbol from elements DNA with random index
            [_DNA addObject:[charsDNA objectAtIndex:r_index]];
        }
      }
    return self;
}

-(void) printDNA {
    NSLog(@"%@", _DNA);
}

-(int) hammingDistance:(Cell *)dna_1{
    int hamming_count = 0;
        for (int count=0; count < 100; count++){
            //Compare each symbol step by step
            if ([self.DNA objectAtIndex: count]  != [dna_1.DNA objectAtIndex: count]) {
                hamming_count++;
            }
            
        }
    return hamming_count;
}
@end
