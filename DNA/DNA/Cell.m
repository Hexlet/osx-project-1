//
//  Cell.m
//  DNA
//
//  Created by lexin on 01.11.12.
//  Copyright (c) 2012 lexin. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id)init
{
    self = [super init];
    NSSet* set = [NSSet setWithObjects:@"A",@"T",@"G",@"C", nil];
    _arrDNA = [NSMutableArray array];
    for (int i=1;i<=100;i++)
    {
        [_arrDNA addObject:[[set allObjects] objectAtIndex:arc4random()%[set count]]];
    }
        //NSLog(@"arrDNA %@",_arrDNA);
    return self;
}
-(int)hammingDistance:(Cell*)inputCell
{
    int result=0;
    if ([[inputCell arrDNA] count]!=[[self arrDNA] count])
    {
        NSLog(@"Different count in DNA arrays!");
    }
    else
    {
        for (id symbol in [inputCell arrDNA])
        {
            NSUInteger i=[[inputCell arrDNA] indexOfObject:symbol];
            if (![symbol isEqual:[[self arrDNA] objectAtIndex:i]])
            {
                result++;
            }
        }
    }
    
    return result;
}
@end
