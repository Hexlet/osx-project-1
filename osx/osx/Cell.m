//
//  Cell.m
//  DNK
//
//  Created by flom on 30.10.12.
//  Copyright (c) 2012 flom. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init{
    self = [super init];
    if(self)
    {
        _dna = [[NSMutableArray alloc] init];
        
        NSArray *alphabet = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C",nil]; 
        
        for(int i=0;i<100;i++){
            int randomValue = arc4random() % 4;
            
            [_dna addObject:[alphabet objectAtIndex:randomValue]];
            //NSLog([alphabet objectAtIndex:randomValue]);
        }
    }
    return self;
}

-(int)hammingDistace:(Cell *)cell{
    int distance = 0;
    for(int i=0;i<self.dna.count;i++)
    {
        if([cell.dna objectAtIndex:i])
        {
            if([self.dna objectAtIndex:i] != [cell.dna objectAtIndex:i])
                distance++;
        }
        else
            distance++;
    }
    return distance;
}

-(NSMutableString*)makeString{
    NSMutableString *dnaString = [[NSMutableString alloc]init];
    for(int i=0;i<self.dna.count;i++)
    {
        [dnaString appendString:[self.dna objectAtIndex:i]];
    }
    return dnaString;
}

-(void)print{
    NSLog([self makeString]);
}



@end
