//
//  Cell+mutator.h
//  Project1
//
//  Created by sashkam on 31.10.12.
//  Copyright (c) 2012 Verveyko Alexander. All rights reserved.
//

#import "Cell.h"

@interface Cell (mutator)

- (NSArray *) shuffleArray: (NSArray *) anArray anCount: (int) count;
- (void) mutate: (int) percent;

@end
