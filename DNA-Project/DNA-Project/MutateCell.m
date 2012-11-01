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
    percent=percent*maxLenght/100;
    NSLog(@"Mutating %d elements",percent);
    NSMutableArray *mutatedArray=[[NSMutableArray alloc] initWithCapacity:maxLenght];
    for (i=0; i<maxLenght; i++) [mutatedArray addObject:[NSNumber numberWithBool:NO]];
    NSMutableArray *cellMutatedDNA=[self getDNA];
    
    if (percent<=maxLenght )
    {
        while (percent)  //количество оставкшихся замен
        {  
            int changePosition=arc4random()%maxLenght;
            NSString *mutatedChar =[NSString stringWithString:[self makeGen]];
            
            //если в этом месте еще не меняли ячейку сгенерированная должна отличаться от текущей
            if ([[mutatedArray objectAtIndex:changePosition] isEqual:[NSNumber numberWithBool:NO]] && ![mutatedChar isEqual:[cellMutatedDNA objectAtIndex:changePosition]])
            {
                [cellMutatedDNA replaceObjectAtIndex:changePosition withObject:mutatedChar];
                [mutatedArray replaceObjectAtIndex:changePosition withObject:[NSNumber numberWithBool:YES]];
                percent--;
                //NSLog(@"changed to %@ in %d position",cellMutatedDNA,changePosition);
            }
        }
    }
    else
    {
        NSLog(@"Incorrect number of mutations");
    }
    //NSLog(@"mutation complite %@",cellMutatedDNA);
    [self setDNA:cellMutatedDNA];
}
@end
