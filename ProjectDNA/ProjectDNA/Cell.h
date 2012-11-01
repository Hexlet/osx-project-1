//
//  Cell.h
//  ProjectDNA
//
//  Created by Admin on 10/30/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell *) cell;

@end
