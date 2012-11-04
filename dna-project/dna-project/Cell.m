//
//  Cell.m
//  dna-project
//
//  Created by Илья Бельский on 11/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    
    if (self) {
        self->dna = [NSMutableArray arrayWithCapacity:100];
        
    }
    
    return self;
}

@end
