//
//  CellMutator.m
//  DNA
//
//  Created by Eraser on 11/4/12.
//  Copyright (c) 2012 Eraser. All rights reserved.
//

#import "Cell.h"
#import "CellMutator.h"

@implementation Cell (mutator)

-(void) mutate: (int) percent
{
    nucleotides n;
    BOOL mut[DNALenght];
    BOOL fill;
    int i, j;
    
    if (percent <= 0) return;
    
    percent = percent > 100 ? 100: percent;
    
    if (percent > 50)
    {
        fill = TRUE;
        percent = 100 - percent;
    }
    else
        fill = FALSE;
    
    for (i = 0; i < DNALenght; i++) mut[i] = fill;
    
    i = 0;
    
    while (i < (int)round(DNALenght * percent / 100.0))
    {
        j = arc4random() % DNALenght;
        
        if (mut[j]==fill)
        {
            mut[j] = !fill;
            i++;
        }
        
    }
    
    for (i = 0; i < DNALenght; i++)
    {
        if (mut[i])
        {
            n = [self.DNA[i] nucleic];
            while (n == [self.DNA[i] nucleic]) [self.DNA[i] setNucleic: [Nucleotid random]];
        }
    }
}

@end

