//
//  Cell+Mutator.m
//  DNA
//
//  Created by Mac on 11/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void)mutateDNA:(int)percentToMutate
{   
    //---Method which makes changes to DNA replacing some acids with new one
    //percentToMutate is quantity of acids to replace---
    
    //---Create array containing same quantity of acids as given DNA---
    NSMutableArray *arrayOfRandomNumbers = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.DNA count]; i++)
    {
        [arrayOfRandomNumbers addObject:[NSNumber numberWithInt:i]];
    }
       
    //---Take some object from given array and put them in new array (shuffled)---
    
    for (int i = 0; i < percentToMutate; i++)
    {
        BOOL acidsAreEqual = YES;
        
        //---Random position from arrayOfRandomNumbers---
        int randomIndex = arc4random_uniform([arrayOfRandomNumbers count]);
        
        //---Get number at certain position---
        NSNumber *randomPosition = [arrayOfRandomNumbers objectAtIndex:randomIndex];
        
        //---Delete picked position from array---
        [arrayOfRandomNumbers removeObjectAtIndex:randomIndex];
        
        //---Get Acid in DNA at certain position---
        NSString *currentAcidInDNA = [self.DNA objectAtIndex:[randomPosition intValue]];
        
        //---Check for equality of Acid---
        while (acidsAreEqual)
        {
            //---Get one of Acid to variable---
            NSString *randomAcid = [atcgArray objectAtIndex:arc4random_uniform(4)];
            
            if (![currentAcidInDNA isEqualToString:randomAcid])
            {
                //---Replace acid in DNA with new one---
                [self.DNA replaceObjectAtIndex:[randomPosition intValue] withObject:randomAcid];
                acidsAreEqual = NO;
            }
            else
            {
                //---Log if acids were eqaul---
                NSLog(@"Acids are equal");
            }
            
        }
        
           
    }
    NSLog(@"Cell mutated");
}



@end
