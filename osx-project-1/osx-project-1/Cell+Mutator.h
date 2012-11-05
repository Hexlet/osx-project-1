//
//  Cell+Mutator.h
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "Cell.h"

/*
Contains mutation functionality for Cell class
*/
@interface Cell (Mutator)

/*
Changes cell replacing specified number of symbols in its DNA
*/
- (void) mutate:(int)replacementCount;

@end
