//
//  Cell+DNAMutator.m
//  DNA_HW
//
//  Created by Anatoly Tarnavsky on 11/11/12.
//  Copyright (c) 2012 Anatoly Tarnavsky. All rights reserved.
//

#import "Cell+DNAMutator.h"

@implementation Cell (DNAMutator)

-(void)mutate:(int)percentage{
    NSArray *oldDNA = [self.DNA copy];  //making a copy of DNA before performing mutation
    
    int letter2Change;      //serial number of letter to change
    NSString *newLetter;
    
    while (percentage != 0) //we continue while all required letters haven't changed
    {
        letter2Change = arc4random() % 100;
        
        while ([[oldDNA objectAtIndex:letter2Change]isEqualToString:[self.DNA objectAtIndex:letter2Change]])  //if both letters are same it means we haven't change it yet
        {  
            int currentCellValue = arc4random() % 4;
            
            switch (currentCellValue)
            {
                case 0:
                    newLetter = @"A";
                    break;
                    
                case 1:
                    newLetter = @"T";
                    break;
                    
                case 2:
                    newLetter = @"G";
                    break;
                    
                case 3:
                    newLetter = @"C";
                    break;
                default:
                    break;
            }
            
        [self.DNA replaceObjectAtIndex:letter2Change withObject:newLetter];
    
        }
    
        percentage--;   //after we changed the letter we decrease this counter
    }
}

@end
