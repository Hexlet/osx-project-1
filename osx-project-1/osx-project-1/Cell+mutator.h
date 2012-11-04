//
//  Cell+mutator.h
//  osx-project-1
//
//  Created by mac mini on 04.11.12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import "Cell.h"

@interface Cell (mutator)
@property NSMutableArray* DNA;
- (id) init;
- (int) hammingDistance:(Cell*) otherCell;
- (void) mutate:(int) percent;
@end
