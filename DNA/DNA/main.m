//
//  main.m
//  DNA
//
//  Created by Mac on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate: (int) percent;

@end

@implementation Cell (mutator)

-(void)mutate:(int)percent {
    
}

@end


int main (int argc, const char * argv[])
{

    @autoreleasepool {
        // create two Cell objects
        Cell *cell1 = [[Cell alloc] init];        
        //[cell1 printDNA];        
        Cell *cell2 = [[Cell alloc] init];        
        //[cell2 printDNA];
        
        // calculate hamming distance between them and print result
        int hammingDistance = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance between cell1 and cell2 equals %i", hammingDistance);
        
        // mutate both
        [cell1 mutate:70];
        [cell2 mutate:70];
        
        // calclulate hamming distance again and print result
        hammingDistance = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance between cell1 and cell2 after mutate equals %i", hammingDistance);        
    }
    return 0;
}

