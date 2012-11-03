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
        //---Random position from arrayOfRandomNumbers---
        int randomIndex = arc4random_uniform([arrayOfRandomNumbers count]);
        
        //---Get number at certain position---
        NSNumber *randomPosition = [arrayOfRandomNumbers objectAtIndex:randomIndex];
        
        //---Delete picked position from array---
        [arrayOfRandomNumbers removeObjectAtIndex:randomIndex];
        
        //---Get one of Acid to variable---
        NSString *randomAcid = [atcgArray objectAtIndex:arc4random_uniform(4)];
        
        //---Replace acid in DNA with new one---
        [self.DNA replaceObjectAtIndex:[randomPosition intValue] withObject:randomAcid];   
    }
    NSLog(@"Cell mutated");
}



@end
