//
//  Cell+Mutator.h
//  Cell
//
//  Created by padawan on 31.10.12.
//  Copyright (c) 2012 padawan. All rights reserved.
//

#import "Cell.h"

@interface Cell (Mutator)
- (void) mutate: (int) percent;
- (void) replace: (int) index;
@end
