//
//  Cell.m
//  dna
//
//  Created by Evgeny Trefilov on 11/4/12.
//  Copyright (c) 2012 Evgeny Trefilov. All rights reserved.
//

#import "Cell.h"

@implementation Cell
{
    NSMutableArray *_dna;
}

-(id)init
{
    return [[Cell alloc] initWithGenes:100];
}

-(id)initWithGenes:(int)amountOfGenes
{
    //dna could be of arbitrary length
    self=[super init];
    if(self)
    {
        _dna=[NSMutableArray arrayWithCapacity:amountOfGenes];
        
        //init each dna element with random nucleotid
        for(int i=0;i<amountOfGenes;i++)
            _dna[i]=[[Gene alloc] init];
    }
    return self;
}

-(int)hammingDistance:(Cell*)cell
{
    int result=0;
    
    if ([self length]!=[cell length]) {
        NSLog(@"Parameters length mismatch");
        result=-1;
    }
    else
    for (NSUInteger i=0; i<[self length]; i++) {
        if([[[self getDnaElementAtIndex:i] value] isNotEqualTo:[[cell getDnaElementAtIndex:i] value]]) result++;
    }
    return result;
}

-(void)setDnaElement:(Gene*)gene atIndex:(NSUInteger)index
{
    if(index>0)
    _dna[index]=gene;
}

-(Gene*)getDnaElementAtIndex:(NSUInteger)index
{
    return _dna[index];
}

-(NSUInteger)length
{
    return [_dna count];
}

-(NSString*)dnaString
{
    //string representation of dna
    NSMutableString* result = [NSMutableString string];
    
    for (Gene* gene in _dna)
        [result appendString:gene.value];
    
    return result;
}



@end
