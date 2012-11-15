//
//  main.m
//  Project1_DNA
//
//  Created by Vladimir Koltunov on 04.11.12.
//  Copyright (c) 2012 XCode 4.2.1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutate)

    -(void) mutate:(int) percent;

@end

@implementation Cell (Mutate)

-(void) mutate:(int)percents{
    // Check for entered percents number
    if(percents<0 || percents>100){
        NSLog(@"You entered %i percents which is incorrect.", percents);
        return;
    }
    int rndIndex=0;
    int rnd;
    
    NSString *tmpString;
    // Array which contain all indexes of elements already mutated
    NSMutableArray *mutatedIndexes = [NSMutableArray arrayWithCapacity: percents];
    
    for (int i=0; i<percents; i++) {
        // Generate random index for element that should be mutated
        rndIndex = arc4random()%DNA_CAPACITY;
        // Actually I don't know how to save int to array correctly
        // so I convert it to NSString before check and save
        tmpString = [NSString stringWithFormat:@"%i", rndIndex];
        
        if([mutatedIndexes containsObject:tmpString]){
            // Item with index rndIndex was already mutated
            // so we do nothing and decrease i by 1 to repeat
            // this iteration of for loop 
            i--;
        } else {
            // Generate random index to create new value of mutated
            // DNA element
            rnd = arc4random()%4;
            // Check whether new value are equal to old value of
            // DNA element
            if([DNA objectAtIndex:rndIndex] != [[Cell getDNATemplate] objectAtIndex:rnd]){
                // Mutate DNA element: set new value
                [DNA replaceObjectAtIndex:rndIndex withObject:[[Cell getDNATemplate] objectAtIndex:rnd]];
                // Add converted index of mutated element ot array
                [mutatedIndexes addObject:tmpString];                
            }else{
                // if new value are equal to old one
                // repeat iteration one more time
                i--;
            }
        }
    }
}

@end

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        // create and initialize 2 different cells
        Cell *cell = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        [cell printDNA];
        [cell2 printDNA];
        
        int hammingDistance = [cell hammingDistance:cell2];
        NSLog(@"Hamming distance = %i",hammingDistance);
        
        // Mutate both cells on 50 percent
        int mutationPercent = 50;
        [cell mutate:mutationPercent];
        [cell2 mutate:mutationPercent];
        NSLog(@"Both cells were mutated on %i percents", mutationPercent);
        
        [cell printDNA];
        [cell2 printDNA];
        
        NSLog(@"Hamming distance after mutation = %i", [cell hammingDistance:cell2]);
    }
    return 0;
}

