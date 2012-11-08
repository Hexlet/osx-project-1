//
//  Cell.m
//  DNAProject
//
//  Created by Admin on 11/2/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Cell.h"


//
// Class Cell
//          Contains representation of DNA chain and several operations on it
//

@implementation Cell


-(id)init {
    self = [super init];
    
    if( self) {
        dna = [NSMutableArray arrayWithCapacity:(SIZE_DNA)];
    
        sranddev();
        for( int i = 0; i < SIZE_DNA; i++) {
            [dna addObject: [self getRandomNucleotide]];
        }
    }
    
    return self;
}


//  Calculate random nucleotide wrom the set of (A,T,G,C)
//
//  @param none
//
//  @return random nucleotide string

-(NSString*)getRandomNucleotide {
    NSArray *gen =[[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
    int rnd = rand() % 4;
    return [gen objectAtIndex:rnd ];
}

//  Get nucleotide string at given position
//
//  @param pos
//          position in the chain
//
//  @return nucleotide string at given position

-(NSString*)getAt: (int)pos {
    if( pos >= 0 && pos < SIZE_DNA)
        return [dna objectAtIndex: pos];
    else
        return @"";
}


//  Calculate hamming distance between two DNA
//
//  @param cell
//              DNA to compare with current
//  @return hamming distance

-(int) hammingDistance: (Cell*)cell {
    int dist = 0;
    
    // iterate through both DNA and compare nucleotides
    for ( int i = 0; i < SIZE_DNA; i++ ) {
        if( ! ([[self getAt: i ] isEqualToString: [cell getAt: i]])  )
            dist++;
    }
    
    return dist;
}

// Output whole DNA chain to console
//
// @param none
//
// @return none

-(void)print {
    printf("DNA: ");
    for ( NSString* item in dna) {
        printf("%s",[item UTF8String]);
    }
    printf("\n");
    //NSLog(@"DNA: %@", dna);
}

@end
