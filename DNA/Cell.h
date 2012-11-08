//
//  Cell.h
//  DNA
//
//  Created by Vasiliy Shevchuk on 11/7/12.
//  Copyright (c) 2012 Vasiliy Shevchuk. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
// Захотелось оставить возможность задания длины массива переменной
@property int DNA_length;   //длина  DNA массива

-(int) hammingDistance: (Cell*)newDNA_Obj;
@end
