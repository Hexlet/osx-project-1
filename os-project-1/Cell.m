//
//  Cell.m
//  os-project-1
//
//  Created by Михаил Поспелов on 24.02.13.
//  Copyright (c) 2013 Михаил Поспелов. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>


@implementation Cell
-(id) init{
    self = [super init];
    if (self){
        NSArray *simbolsArray = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];

        _DNA = [[NSMutableArray alloc] initWithCapacity:100];
        for(int i=0; i < 100; ++i){
            [_DNA insertObject:simbolsArray[arc4random() % 3] atIndex:i ];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *) cell{
    int result=0;
    for(int i=0; i < [self.DNA count]; ++i){
        if(self.DNA[i] != cell.DNA[i])
            result++;
    }
    return result;
}

@end
