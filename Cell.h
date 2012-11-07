//
//  Cell.h
//  DNK
//
//  Created by Дмитрий Арефьев on 06.11.12.
//  Copyright (c) 2012 Дмитрий Арефьев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

    @property NSMutableArray * DNA;
    @property NSArray * many;

    -(int)hammingDistance:(Cell*)newCell;

@end

@interface Cell (mutator)

    -(void)mutate:(int)X;

@end
