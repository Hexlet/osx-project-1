//
//  Cell+Mutator.m
//  DNK
//
//  Created by Rybalko Dmitriy on 30.10.12.
//  Copyright (c) 2012 Rybalko Dmitriy. All rights reserved.
//

#import "Cell+Mutator.h"
#import "NSArray+GetRandomObject.h"

@implementation Cell (Mutator)

- (void)mutate:(int)percent {
    NSMutableArray *dna = [self DNA];
    
    for (uint i = 0; i < percent; i++) {
        [dna insertObject: [elements getRandomObject] atIndex: i];
    }
}

@end
