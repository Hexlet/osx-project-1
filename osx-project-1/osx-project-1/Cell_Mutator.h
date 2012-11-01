//
//  NSObject+Cell_Mutator_h.h
//  osx-project-1
//
//  Created by Taras Lyapun on 01.11.12.
//  Copyright (c) 2012 Taras Lyapun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
-(void) mutate:(int) percent;
@end