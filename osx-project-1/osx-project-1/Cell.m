//
//  Cell.m
//  osx-project-1
//
//  Created by Аня&Саша on 06.11.12.
//  Copyright (c) 2012 nogaav. All rights reserved.
//

#import "Cell.h"

const int DNA_SIZE = 100;
const NSString *DNA_SYMBOLS  = @"ATGC";

@implementation Cell
-(Cell*)init {
    if(self = [super init]){
        _DNA = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];
        for(int i=0; i < DNA_SIZE; i++){
            [_DNA addObject:[self getRandomSymbol]];
        }
    }else
        NSLog(@"ERROR: in Cell initialize.");
    return self;
}
-(int)hammingDistance:(Cell *)otherCell{
    int distance = 0;
    if([_DNA count] != [otherCell.DNA count]){
        NSLog(@"DNAs are not compressed.");
        return -1;
    }
    for(int i=0; i< DNA_SIZE; i++)
        if([_DNA objectAtIndex:i] != [otherCell.DNA objectAtIndex:i])
            distance++;
    return distance;
}
-(id) getRandomSymbol{
    int temp = arc4random()%[DNA_SYMBOLS length];
    unichar sym = [DNA_SYMBOLS characterAtIndex:temp];
    return [NSString stringWithCharacters:&sym length:1];
}

-(NSMutableString*)getString{
    NSMutableString *str = [[NSMutableString alloc] initWithCapacity:DNA_SIZE];
    for(id sym in _DNA)
        [str appendString:sym];
    return str;
}
@end

