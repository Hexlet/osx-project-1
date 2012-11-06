//
//  Cell.m
//  project-1
//
//  Created by Pryshchepa Andrew  on 11/3/12.
//  Copyright (c) 2012 Pryshchepa Andrew . All rights reserved.
//

#import "Cell.h"


@implementation Cell
@synthesize dnaArray = _dnaArray;
@synthesize dnaElemArray = _dnaElemArray;

//Getter for an initialization of dnaArray
-(NSMutableArray*) dnaArray
{
    if(_dnaArray == nil) {
        _dnaArray = [[NSMutableArray alloc]init];
    }
    return _dnaArray;
}

-(NSArray*) dnaElemArray
{
    if(_dnaElemArray == nil) {
        _dnaElemArray = [[NSArray alloc] initWithObjects:@"A",@"C",@"G",@"T", nil];
    }
    return _dnaElemArray;
}


//Overided init method to randomly set dnaArray
- (id)init
{
    self = [super init];
    if (self) {
        for(int i = 0; i < DNA_SIZE; ++i){
            [self.dnaArray addObject: [self.dnaElemArray objectAtIndex:(arc4random() % DNA_RANGE)] ];
        }
    }
    return self;
}

//method for checking distances bettwen self.dnaArray and parameter
-(int)hammingDistance: (Cell*) cell {
    
    int result = 0;
    NSUInteger comparingSize = 0;
    if(self.dnaArray.count > cell.dnaArray.count) {
        result+= self.dnaArray.count - cell.dnaArray.count;
        comparingSize = cell.dnaArray.count;
    } else {
        result+= cell.dnaArray.count - self.dnaArray.count;
        comparingSize = self.dnaArray.count;
    }
    
    for(int i = 0; i < comparingSize; ++i) {
        if([self.dnaArray objectAtIndex:i] != [cell.dnaArray objectAtIndex:i])
            ++result;
    }
    return result;
}


@end
