//
//  Cell.h
//  DNA
//
//  Created by Dmytro Chertousov on 12.11.12.
//  Copyright (c) 2012 Dmytro Chertousov. All rights reserved.
//

#import <Foundation/Foundation.h>

// Original Cell class
@interface Cell : NSObject
    @property NSMutableArray *DNA;
    - (int) hammingDistance:(Cell *)c;
@end


// Mutator Cell class
@interface Cell(mutator)
    -(void)mutate:(int)x;
@end