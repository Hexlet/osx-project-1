//
//  Cell.m
//  osx-project-1
//
//  Created by Andrew Kolisnichenko on 11/4/12.
//  Copyright (c) 2012 Andrew Kolisnichenko. All rights reserved.
//

#import "Cell.h"

@implementation Cell{
    int dnaLength;
    
}

-(id)init{
    self = [super init];
    if(self){
        // set length of dna sequence 
        dnaLength = 100;
        [self generateDNA];
    }
    return self;
}

-(int)hammingDistance:(Cell*) cell{
    int numberDifferentPositions = 0;
    for (int index = 0; index < [_dna count]; index++){
        if(![[_dna objectAtIndex:index]isEqualToString:[[cell dna] objectAtIndex:index]]){
            numberDifferentPositions++;
        }
    }
    return numberDifferentPositions;
}

-(void)print{
    NSMutableString* dnaOutput = [NSMutableString string];
    for(int index = 0; index < [_dna count]; index++){
        [dnaOutput appendString:[_dna objectAtIndex:index]];
    }
    NSLog(@"%@", dnaOutput);
}

-(void)generateDNA{
    _dna = [NSMutableArray arrayWithCapacity:dnaLength];
    for (int index = 0; index < dnaLength; index++){
        [_dna insertObject:[Cell getRandomDNANucleotide] atIndex:index];
    }
}

+(NSString*) getRandomDNANucleotide{
    NSString* dnaNucleotides = @"ACGT";
    NSString* temp = [dnaNucleotides substringWithRange:[dnaNucleotides rangeOfComposedCharacterSequenceAtIndex:arc4random() % [dnaNucleotides length]]];
    return temp;
  }
@end
