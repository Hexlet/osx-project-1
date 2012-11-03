//
//  Cell.m
//  lab1
//
//  Created by diana shumskaya on 11/3/12.
//  Copyright (c) 2012 diana shumskaya. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init {
    return [self initWithDnaSymbols];
}

- (id)initWithDnaSymbols {
    
    self = [super init];
    
    if (self) {
        
        _dnaSymbols = [NSSet setWithObjects:@"A",@"T",@"G",@"C", nil];
        _dnaItems = [NSMutableArray arrayWithCapacity:kDnaLenght];
        for (int i = 0; i < kDnaLenght; i++) {
            [_dnaItems addObject:[[_dnaSymbols allObjects] objectAtIndex:arc4random()%[_dnaSymbols count]]];
        }
        
    }
    
    return self;
}

- (int) hammingDistance:(Cell *) cell{
    
    int distance = 0;
    
    for (int i = 0; i < kDnaLenght; i++) {
        
        if ( ! [[cell.dnaItems objectAtIndex: i] isEqualToString:[_dnaItems objectAtIndex: i]]){
            distance++;
        }
    }
    
    return distance;
}

@end
