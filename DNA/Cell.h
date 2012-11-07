//
//  Cell.h
//  DNA
//
//  Created by Vasiliy Shevchuk on 11/7/12.
//  Copyright (c) 2012 Vasiliy Shevchuk. All rights reserved.
//
static int DNA_length = 100; //длинна  DNA массива 

#import <Foundation/Foundation.h>


@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell*)newDNA_Obj;
@end
