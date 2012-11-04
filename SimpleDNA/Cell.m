//
//  Cell.m
//  SimpleDNA
//
//  Created by sbogdanov on 03.11.12.
//  Copyright (c) 2012 sbogdanov. All rights reserved.
//

#import "Cell.h"



@implementation Cell

-(id)init{
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithArray:[self getRandomNucleotides]];
        [_DNA removeLastObject];
    }
    return self;
}

-(NSArray*)getRandomNucleotides{
    NSMutableString* stringWithSeparator = [NSMutableString stringWithCapacity:DNA_LENGTH];
    for (int i=0;i<DNA_LENGTH;i++){
        [stringWithSeparator appendFormat:@"%C,",[NUCLEOTIDES characterAtIndex: arc4random()%NUCLEOTIDES.length ]];
    }

    return [stringWithSeparator componentsSeparatedByString:@","];
}
-(int)hammingDistance:(Cell*) compareCell{
    int hammingDistance = 0;
    if ([compareCell.DNA count]!=[_DNA count]){
        return -1;
    }
    for (int i=0; i< [compareCell.DNA count];i++){
        if( [[compareCell.DNA objectAtIndex:i] isNotEqualTo:[_DNA objectAtIndex:i]]){
            hammingDistance++;
        }
    }
    
    return hammingDistance;
}

@end
