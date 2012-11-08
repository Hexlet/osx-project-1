//
//  NSObject+Mutator.m
//  DNA
//
//  Created by Александр on 08.11.12.
//  Copyright (c) 2012 Александр. All rights reserved.
//

#import "Cell.h"

@implementation Cell (Mutator)
-(void) mutate: (int) percent {
    NSMutableArray *oldDNA=[NSMutableArray arrayWithArray: self.dna];
    
    //NSString *joinedStringFirst = [self.dna componentsJoinedByString:@""];
    //NSLog(@"До мутации ДНК: %@", joinedStringFirst);
    int i=0;
    while (i<=percent){
        int numCell=arc4random()%percent;
        
        int letterIntValue=arc4random()%4;
        NSObject *newCell;
        if(letterIntValue==0){
            newCell=@"A";
        } else if(letterIntValue==1){
            newCell=@"T";
        } else if(letterIntValue==2){
            newCell=@"G";
        } else {
            newCell=@"C";
        }
        
        //Следим чтобы ячейки в старом массиве не совпадали с новым и за тем что Ячейка не совпадала с тем чем будем менять
        
        if([[oldDNA objectAtIndex:numCell] isEqual: [self.dna objectAtIndex:numCell]] && [oldDNA objectAtIndex:numCell]!=newCell){
            [self.dna replaceObjectAtIndex:numCell withObject:newCell];
            i++;
        }
    }
}
@end;
