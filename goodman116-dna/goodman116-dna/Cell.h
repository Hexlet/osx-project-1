//
//  Cell.h
//  goodman116-dna
//
//  Created by goodman116 on 11/5/12.
//  Copyright (c) 2012 goodman116. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT int size;

@interface Cell : NSObject

@property NSMutableArray *dna;
@property (readonly) NSArray *nucleotides;

-(void) print;
-(NSString *) getRandomNucleotide;
-(int) hammingDistance:(Cell *)c;
-(Cell *) clone;

@end
