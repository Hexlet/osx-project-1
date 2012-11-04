//
//  Cell.m
//  osx-project-1
//
//  Created by Alexandr on 11/4/12.
//  Copyright (c) 2012 Alexandr. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    
    DNA = [NSMutableArray arrayWithCapacity:100];
    
    return self;
}

@end
