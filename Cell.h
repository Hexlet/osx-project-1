//
//  Cell.h
//  project1_DNA
//
//  Created by Alex on 11/1/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CELL_CAPACITY 100

@interface Cell : NSObject {
    NSArray *fillChars;
}

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell*) cell;

@end
