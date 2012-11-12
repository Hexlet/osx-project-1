//
//  Cell+mutator.h
//  Project1DNA
//
//  Created by ky391 on 11/9/12.
//  Copyright (c) 2012 ky391. All rights reserved.
//

#import "Cell.h"

// mutator category of class cell with one instance method mutate
@interface Cell (mutator)

// mutate (replace with another DNA element) x percent of DNA elements in underlying DNA queue
-(void) mutate: (int) xPercent;
@end
