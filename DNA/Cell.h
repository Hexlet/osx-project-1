//
//  Cell.h
//  DNA
//
//  Created by Max Lebedev on 04.11.12.
//  Copyright (c) 2012 mlebedev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;
@property NSArray *kindsOfChar;

-(int) hammingDistance: (Cell *) myCell2;

@end
