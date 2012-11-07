//
//  Cell.h
//  osx-project-1
//
//  Created by qqq qqq on 11/6/12.
//  Copyright (c) 2012 qqq qqq. All rights reserved.
//

#import <Foundation/Foundation.h>

extern int const CELL_SIZE;

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(void) print;
-(int) hammingDistance:(Cell *)subject;

@end
