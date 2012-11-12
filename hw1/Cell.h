//
//  Cell.h
//  hw1
//
//  Created by admin on 11/12/12.
//  Copyright (c) 2012 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

@property NSMutableArray *types;

-(int) hammingDistance:(Cell *) cell;

-(NSString *) findGenNot: (NSString *) current;

@end
