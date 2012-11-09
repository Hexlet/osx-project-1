//
//  CellMutator.h
//  DNAProject
//
//  Created by Alex Nureev on 11/9/12.
//  Copyright (c) 2012 Alex Nureev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(Mutator)
    -(void) mutate: (int)percent;
@end