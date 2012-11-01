//
//  Cell.m
//  DNAFactory
//
//  Created by Ilya Rezyapkin on 01.11.12.
//  Copyright (c) 2012 Ilya Rezyapkin. All rights reserved.
//

#import "Cell.h"


@implementation Cell

- (id) init {
    self = [super init];
    if (self) {
        DNA = [NSMutableArray arrayWithCapacity:100];
        
    }
    return self;
}

@end
