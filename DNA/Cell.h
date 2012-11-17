//
//  Cell.h
//  osx-project-1
//
//  Created by qqq qqq on 11/6/12.
//  Copyright (c) 2012 qqq qqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CELL_SIZE 100
#define CELL_VALUE_SIZE 4

@interface Cell : NSObject

@property NSMutableArray *DNA;

+(NSString *) generateCellValue;
-(void) print;
-(int) hammingDistance:(Cell *)subject;

@end