//
//  Cell+Mutator.h
//  DNATest
//
//  Created by Aliaksandr Słaŭščyk on 01.11.12.
//  Copyright (c) 2012 Aliaksandr Słaŭščyk. All rights reserved.
//

#import "Cell.h"

@interface Cell (Mutator)
- (void) mutate: (int) perc;
@end
@interface NSMutableArray (Shuffling)
- (void)shuffle;
@end