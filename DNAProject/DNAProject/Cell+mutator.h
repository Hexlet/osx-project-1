//
//  Cell+mutator.h
//  DNAProject
//
//  Created by Admin on 11/2/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Cell.h"

// Class Cell: category mutator

@interface Cell (mutator)

//  Replaces given percentage of nucleotides in DNA chain with random values
//
//  @param percent
//              Percentage of nucleotides to mutate
//  @return void
-(void) mutate: (int)percent;

@end
