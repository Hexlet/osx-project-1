//
//  Cell.m
//  DNA_HW
//
//  Created by Anatoly Tarnavsky on 11/9/12.
//  Copyright (c) 2012 Anatoly Tarnavsky. All rights reserved.
//

#import "Cell.h"
#import "Cell+DNAMutator.h"

@interface Cell()

-(void)fillRandomValuesToDNA;

@end

@implementation Cell



-(id) init {
    self = [super init];
    if (self)
    {
       self.DNA = [[NSMutableArray alloc] init];    
       [self fillRandomValuesToDNA];
    }
    return self;
}

-(int)hammingDistance:(Cell *)cell
{
   
    int hammingDistance = 0;                //initial value of hamming distance is 0
    for (int i = 0; i < 100; i++)       
    {
        if (![[cell.DNA objectAtIndex:i]isEqualToString:[self.DNA objectAtIndex:i]])    //if couple of letters in both cells not same we increase hammingDistance
                    hammingDistance++;  
        
    }
    
    return hammingDistance;
}

-(void)fillRandomValuesToDNA    //private method which fill random values of DNA to cell
{
 
    
    int currentCellValue;
    NSString *DNALetter;
    
    for (int i=0; i<100; i++)
    {
        currentCellValue = arc4random() % 4;
        
        switch (currentCellValue)
        {
            case 0:          
                DNALetter = @"A";
                break;
                
            case 1:
                DNALetter = @"T";
                break;
                
            case 2:
                DNALetter = @"G";
                break;
                
            case 3:
                DNALetter = @"C";
                break;
            default:
                break;
        }
        
       [self.DNA addObject:DNALetter];
        
    }
    
}

@end
