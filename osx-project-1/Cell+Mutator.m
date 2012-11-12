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
    //---Check for percent to be in range of 0 to 100---
    if (percentToMutate <= 0)
    {
        NSLog(@"Nothing to mutate");
        return;
    }
    
    //---If percent more than 100 then we mutate whole cell---
    if (percentToMutate > 100)
    {
        percentToMutate = 100;
    }
    
    //---Get number of cells to mutate from percent---
    percentToMutate = (percentToMutate * [self.DNA count]) / 100;
    NSLog(@"Cells to mutate: %i", percentToMutate);
    
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
        int randomIndex = arc4random_uniform((int)[arrayOfRandomNumbers count]);
        
        //---Get number at certain position---
        NSNumber *randomPosition = [arrayOfRandomNumbers objectAtIndex:randomIndex];
        
        //---Delete picked position from array---
        [arrayOfRandomNumbers removeObjectAtIndex:randomIndex];
        
        //---Get Acid in DNA at certain position---
        NSString *currentAcidInDNA = [self.DNA objectAtIndex:[randomPosition intValue]];
        
        //---Create arry of atcg without currentAcidInDNA--- 
        NSMutableArray *shortenAtcgArray = [[NSMutableArray alloc] initWithArray:atcgArray];
        [shortenAtcgArray removeObjectAtIndex:[shortenAtcgArray indexOfObjectIdenticalTo:currentAcidInDNA]];
        
        //---Get one of Acid to variable---
        NSString *randomAcid = [shortenAtcgArray objectAtIndex:arc4random_uniform(3)];
        
        //---Replace acid in DNA with new one---
        [self.DNA replaceObjectAtIndex:[randomPosition intValue] withObject:randomAcid];
        
        //---Uncomment to check---
        //NSLog(@"current: %@ and new one: %@", currentAcidInDNA, randomAcid);
           
    }
    NSLog(@"Cell mutated");
}



@end
