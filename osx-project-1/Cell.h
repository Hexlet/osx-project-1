//
//  Cell.h
//  osx-project-1
//
//  Created by Alex on 31.10.12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CAPACITY 100

@interface Cell : NSObject

@property NSMutableArray *dna;

- (void) setRandomValues;

- (int) hammingDistance: (Cell*) cell;

@end
