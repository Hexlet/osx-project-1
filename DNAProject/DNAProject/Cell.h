//
//  Cell.h
//  DNAProject
//
//  Created by Admin on 11/2/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

// length of DNA 
#define SIZE_DNA 100

//
// Class Cell
//          Contains representation of DNA chain and several operations on it
//

@interface Cell : NSObject {

    // represents DNA chain
    NSMutableArray* dna;


}

//  Calculate hamming distance between two DNA
//
//  @param cell
//              DNA to compare with current
//  @return hamming distance

-(int) hammingDistance: (Cell*)cell;

//  Calculate random nucleotide wrom the set of (A,T,G,C)
//
//  @param none
//
//  @return random nucleotide string

-(NSString*) getRandomNucleotide;

// Output whole DNA chain to console
//
// @param none
//
// @return none

-(void) print;

@end
