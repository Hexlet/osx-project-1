//
//  Cell.h
//  Project 1 - DNA
//
//  Created by Artemati on 08.11.12.
//  Copyright (c) 2012 Artemati. All rights reserved.
//

#import <Foundation/Foundation.h>

// Укажем длину массива
#define lenthOfDna 100

@interface Cell : NSObject
@property NSMutableArray *dna;
-(NSString *) randomSymbol;
-(int) hammingDistance:(Cell *) cell;
-(void)print;
@end
