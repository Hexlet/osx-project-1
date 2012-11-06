//
//  Cell+Mutator.h
//  DNAMutation
//
//  Created by Gosha Arinich on 10/30/12.
//  Copyright (c) 2012 Gosha Arinich. All rights reserved.
//

#import "Cell.h"

@interface Cell (Mutator)

- (void)mutate:(int)degree;
- (NSString *)newElementForIndex:(int)idx;
- (NSMutableArray *)randomDNAIndices:(int)amount;

@end
