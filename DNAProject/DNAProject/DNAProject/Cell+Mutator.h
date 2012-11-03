//
//  Cell+Mutator.h
//  DNAProject
//
//  Created by Vitaly on 01.11.12.
//  Copyright (c) 2012 Vitaly Petrov. All rights reserved.
//

#import "Cell.h"
extern int const MIN_PERCENT;
extern int const MAX_PERCENT;

@interface Cell (Mutator)

-(void) mutate:(int)x;

@end
