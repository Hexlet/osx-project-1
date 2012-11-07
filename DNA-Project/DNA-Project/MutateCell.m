//
//  MutateCell.m
//  DNA-Project
//
//  Created by Dmitry on 01.11.12.
//  Copyright (c) 2012 Dmitry. All rights reserved.
//

#import "MutateCell.h"

@implementation Cell(Mutator)
-(void) mutate:(int)percent
{
    if ( percent > 0 && percent<=100 )
    {
        int replaceNumber=percent*maxLenght/100;
        NSLog(@"Mutating %d elements",replaceNumber);
        NSMutableArray *mutatedArray=[[NSMutableArray alloc] initWithCapacity:maxLenght];
        for (i=0; i<maxLenght; i++) [mutatedArray addObject:[NSNumber numberWithBool:NO]];
        NSMutableArray *cellMutatedDNA=[self getDNA];
            
            while (replaceNumber)  
            {  
                int changePosition=arc4random()%maxLenght;
                NSString *mutatedChar =[NSString stringWithString:[self makeGen]];
                
                if ([[mutatedArray objectAtIndex:changePosition] isEqual:[NSNumber numberWithBool:NO]] && ![mutatedChar isEqual:[cellMutatedDNA objectAtIndex:changePosition]])
                {
                    [cellMutatedDNA replaceObjectAtIndex:changePosition withObject:mutatedChar];
                    [mutatedArray replaceObjectAtIndex:changePosition withObject:[NSNumber numberWithBool:YES]];
                    replaceNumber--;
                }
            }
        [self setDNA:cellMutatedDNA];
    }
    else
    {
        NSLog(@"Incorrect number of mutations");
    }
    //NSLog(@"mutation complite %@",cellMutatedDNA);
    
}
@end
