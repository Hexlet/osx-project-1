//
//  Cell.h
//  dna
//
//  Created by Igor Pavlov on 02.11.12.
//  Copyright (c) 2012 Igor Pavlov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject

- (id) init;
- (int) hammingDistance:(Cell*)otherCell;
- (void) print;
- (Cell*) clone;

@end


@interface Cell (mutator)

- (void) mutate:(int)x;

@end
