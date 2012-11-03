//
//  Cell.h
//  project-1
//
//  Created by Pryshchepa Andrew  on 11/3/12.
//  Copyright (c) 2012 Pryshchepa Andrew . All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_SIZE 100
#define DNA_RANGE 4

@interface Cell : NSObject
//properties:
@property (nonatomic) NSMutableArray *dnaArray;
//methods:
-(int)hammingDistance: (Cell*) cell;
@end
