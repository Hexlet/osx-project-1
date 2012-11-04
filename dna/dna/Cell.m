//
//  Cell.m
//  dna
//
//  Created by Evgeny Trefilov on 11/4/12.
//  Copyright (c) 2012 Evgeny Trefilov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

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
    
    if ([self.dna count]!=[cell.dna count]) {
        NSLog(@"Parameters length mismatch");
        result=-1;
    }
    else
    for (NSUInteger i=0; i<[self.dna count]; i++) {
        if([[self.dna[i] value] isNotEqualTo:[cell.dna[i] value]]) result++;
    }
    return result;
}


-(NSString*)dnaString
{
    //string represetation of dna
    NSMutableString* result = [NSMutableString string];
    
    for (Gene* gene in _dna)
        [result appendString:gene.value];
    
    return result;
}



@end
