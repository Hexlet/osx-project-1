//
//  Cell+mutator.h
//  DNA1
//
//  Created by Dmitry on 11/3/12.
//  Copyright (c) 2012 TechAid Inc. All rights reserved.
//

#import "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)percent;
@end


@interface NSMutableArray (Shuffling)
-(void)shuffle;
@end
