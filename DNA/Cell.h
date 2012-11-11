//
//  Cell.h
//  DNA
//
//  Created by D_Unknown on 11/6/12.
//  Copyright (c) 2012 D_Unknown. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DNA_LENGTH 100

@interface Cell : NSObject
{
    NSMutableArray *DNA;
    NSArray  *nucleotidesArray;
}

-(int) hammingDistance:(Cell*) c;
-(NSString*) getNucleotide;

@end
