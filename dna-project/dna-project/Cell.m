//
//  Cell.m
//  dna-project
//
//  Created by Илья Бельский on 11/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <stdlib.h>
#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    
    if (self) {
        int dnaLength = 100;
        dna = [NSMutableArray arrayWithCapacity:dnaLength];
        NSString* acids = @"ATGC";
        
        for (int i=0; i<dnaLength; i++) {
            int randomIndex = arc4random() % [acids length];
            NSString* acid = [NSString stringWithFormat:@"%c", [acids characterAtIndex:randomIndex]];
            [dna addObject:acid];
        }
    }
    return self;
}

- (NSString*) getDnaAsString {
    return [dna componentsJoinedByString:@""];
}

@end
