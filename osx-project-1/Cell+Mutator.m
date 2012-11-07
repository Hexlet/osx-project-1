//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Yuriy Zarovnuy on 07.11.12.
//  Copyright (c) 2012 Yuriy Zarovnuy. All rights reserved.
//

#import "Cell+Mutator.h"
#import "Nucleotide.h"

@implementation Cell (Mutator)

-(void) mutate: (int)percentDNA {
    if (percentDNA < 0 || percentDNA > 100)
    {
        [NSException raise: @"Invalid percentDNA value" format: @"percentDNA of %i is invalid.", percentDNA];
    }
    
    int countDNA = [self DNALength] * percentDNA / 100;
    
    NSMutableArray *changedElements = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < countDNA;)
    {
        int randomInt = arc4random() % [self DNALength];
        NSNumber *randomIndex = [[NSNumber alloc] initWithInt: randomInt];
        
        if ([changedElements indexOfObject: randomIndex] == NSNotFound)
        {
            Nucleotide *nucleotide = [[Nucleotide alloc] init];
            [DNA replaceObjectAtIndex: randomInt withObject: nucleotide];
            
            [changedElements addObject: randomIndex];
            i++;
        }
    }
}

@end
