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

//Getter for an initialization of dnaArray
-(NSMutableArray*) dnaArray
{
    if(_dnaArray == nil) {
        _dnaArray = [[NSMutableArray alloc]init];
    }
    return _dnaArray;
}


//Overided init method to randomly set dnaArray
- (id)init
{
    self = [super init];
    if (self) {
        char randomValue = 0;
        for(int i = 0; i < DNA_SIZE; ++i){
            randomValue = [self generateCharPresentationWithinRange:DNA_RANGE];
            
            NSString *str = [NSString stringWithFormat:@"%c", randomValue];
            [self.dnaArray addObject:str];
        }
    }
    return self;
}

//private method for generation a char
-(int) generateCharPresentationWithinRange: (int) range {
    return 'A' + arc4random() % range;

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
