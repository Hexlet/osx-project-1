//
//  Cell.h
//  DNAapplication
//
//  Created by Admin on 11/9/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;
@property NSArray *components;

-(id) init;
-(void) print;
-(int) hammingDistance:(Cell *) comparedCell;

@end
