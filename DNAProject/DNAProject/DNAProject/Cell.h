//
//  Cell.h
//  DNAProject
//
//  Created by Vitaly on 01.11.12.
//  Copyright (c) 2012 Vitaly Petrov. All rights reserved.
//

#import <Foundation/Foundation.h>

extern int const ARRAY_COUNT;

@interface Cell : NSObject

@property NSMutableArray *array;

-(id) init;
-(int) hammingDistance: (Cell*)cell;
-(void) print;

@end
