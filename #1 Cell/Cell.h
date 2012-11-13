//
//  Cell.h
//  #1 Cell
//
//  Created by evlogii on 11/6/12.
//  Copyright (c) 2012 evlogii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
- (void) printDna;
- (int) getHammingDistance: (Cell*) Cell;
@end

@interface Cell (mutator)
- (void) mutate: (int) degree;
@end
