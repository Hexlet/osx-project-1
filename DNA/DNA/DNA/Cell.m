//
//  Cell.m
//  DNA
//
//  Created by Rashid Bakhmudov on 09-11-2012.
//  Copyright (c) 2012 Rashid Bakhmudov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {
    self = [super init];
    // Initializing DNA
    DNA = [[NSMutableArray alloc] initWithCapacity:100];
    
    NSArray *TypeDNA = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    
    for (int i=1;i++;i<=100){
        rand
        [DNA addObject:[TypeDNA objectAtIndex:1]];
    }

    
    return self;
}

@end
