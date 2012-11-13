//
//  Cell+mutator.h
//  DNK
//
//  Created by evgen on 11/13/12.
//  Copyright (c) 2012 evgen. All rights reserved.
//

#import "Cell.h"

@interface Cell (mutator)

+(int) getRandIndex;
-(void) mutate:(int) percent;

@end
