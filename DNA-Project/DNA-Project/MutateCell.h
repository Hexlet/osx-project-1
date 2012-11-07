//
//  MutateCell.h
//  DNA-Project
//
//  Created by Dmitry on 01.11.12.
//  Copyright (c) 2012 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
-(void) mutate:(int)percent;
@end
