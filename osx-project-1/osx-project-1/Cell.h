//
//  Cell.h
//  osx-project-1
//
//  Created by Anton Melnikov on 11/6/12.
//  Copyright (c) 2012 Anton Melnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _nucleotidesEnum
{
    A,
    T,
    G,
    C,
    NucleotidesEnumMax
} NucleotidesEnum;

@interface Cell : NSObject
-(id)init;

-(int)dnaCapacity;
-(NucleotidesEnum)nucleotideAtIndex:(int)index;
-(void)replaceNucleotideAtIndex:(int)index with:(NucleotidesEnum)nucleotide;

-(int)hammingDistanceWith:(Cell *)otherCell;
@end
