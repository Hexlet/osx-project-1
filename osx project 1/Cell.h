//
//  Cell.h
//  osx project 1
//
//  Created by Nikolay Nazarov on 03.11.12.
//  Copyright (c) 2012 Nikolay Nazarov. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>

@interface Cell : NSObject{
    NSMutableArray *nucleotides;
    int DNA_length;
}

@property (readonly) NSMutableArray *DNA;
-(int)hammingDistance:(Cell *)another_cell;
-(NSString*) getRandomNucleotide;

@end
