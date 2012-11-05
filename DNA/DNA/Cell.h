//
//  Cell.h
//  DNA
//
//  Created by ed on 02.11.12.
//  Copyright (c) 2012 ed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

{
    NSArray *gen;
}

@property NSMutableArray *dna;


- (id) init;
- (int) hammingDistance:(Cell *)cell;

@end

@interface Cell (mutator)

- (void)mutate:(int)x;

@end
