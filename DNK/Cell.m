//
//  Cell.m
//  DNK
//
//  Created by Artem Osipov on 11/10/12.
//  Copyright (c) 2012 Artem Osipov. All rights reserved.
//
#include <stdlib.h>
#import "Cell.h"


@implementation Cell

-(id) init{
    self = [super init];
    if(self){
        _DNA = [[NSMutableArray alloc]init];
        _arrayChars = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        int randValue;
        for (int i = 0 ; i < 100; i++) {
            randValue = arc4random() %4;
            [_DNA addObject: [_arrayChars objectAtIndex: randValue]];
        }
    }
    return self;
}

-(int) hammingDistance: (Cell *) DNA2{
    int distance, len;
    distance =0 ;
        //TODO: remove two variables
    NSMutableArray *dn1, *dn2;
    dn1 = self.DNA;
    dn2 = DNA2.DNA;
    
    len = (sizeof dn1);
    for(int i=0; i<len; i++){
        if(![[dn1 objectAtIndex:i] isEqual:[dn2 objectAtIndex:i]]){
            distance++;
        }
    }
    return distance;
}
@end

@implementation Cell(mutator)

-(void) mutate: (int)percent{
    NSUInteger len;
    NSNumber *key;
    NSMutableArray *changingValues;
    NSString *tmp;
    int randValue;
    
    changingValues = [[NSMutableArray alloc]init];
    len = [self.DNA count];
    
    //percent to int
    percent = round(len/100*percent);
    
    while([changingValues count]<percent){
        key = [NSNumber numberWithInt: (arc4random()%len)];
        if(![changingValues containsObject:key]){
            [changingValues addObject:key];
        }
    }
    
    for(int i=0; i<percent; i++){
        tmp = [self.DNA objectAtIndex:i];
        while([tmp isEqual:[self.DNA objectAtIndex:i]]){
            randValue = arc4random()%4;
            [self.DNA replaceObjectAtIndex:i withObject:[_arrayChars objectAtIndex: randValue]];
        }
        
    }
}

@end







