//
//  main.m
//  DNA
//
//  Created by Eraser on 11/4/12.
//  Copyright (c) 2012 Eraser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (mutator)

    -(void) mutate: (int) percent;

@end

@implementation Cell (mutator)

    -(void) mutate: (int) percent
    {
        nucleotides n;
        BOOL mut[DNALenght];
        int i, j;
        
        percent = percent < 0 ? -percent: percent;
        percent = percent > 100 ? 100: percent;
        
        for (i = 0; i < DNALenght; i++) mut[i] = FALSE;      
        
        i = 0;
        
        while (i < (int)(DNALenght * percent / 100.0))
        {
            j = arc4random() % DNALenght;
                        
            if (!mut[j])
            {
                mut[j] = TRUE;
                i++;
            }
            
        }
        
        for (i = 0; i < DNALenght; i++)
        {
            if (mut[i])
            {
                n = [DNA[i] nucleo];
                while (n == [DNA[i] nucleo]) [DNA[i] setNucleo: [Nucleotid random]];
            }
        }
    }

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        Cell *aCell, *bCell;
        int hamming_distance;
        
        aCell = [[Cell alloc] init];
        bCell = [[Cell alloc] init];
        
        [aCell print];
        [bCell print];
        
        hamming_distance = [aCell hammingDistance: bCell];
        
        NSLog(@"Hamming distance = %i", hamming_distance);      
      
        [aCell mutate: arc4random() % 100 + 1];
        [bCell mutate: arc4random() % 100 + 1];
        
        [aCell print];
        [bCell print];
        
        hamming_distance = [aCell hammingDistance: bCell];
        
        NSLog(@"New hamming distance = %i", hamming_distance);    
    }
    
    return 0;
}

