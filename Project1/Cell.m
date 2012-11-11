//
//  Cell.m
//  Project1
//
//  Created by Olga on 02.11.12.
//  Copyright (c) 2012 Olga. All rights reserved.
//

#import "Cell.h"

@implementation Cell

//override the initialisation method
- (id)init
{
    self = [super init];
    if (self) {
        arrayCapacity = 100;
        _dna = [[NSMutableArray alloc] initWithCapacity:arrayCapacity];
        dnaArray = [[NSArray alloc]initWithObjects:@"A",@"T", @"G", @"C", nil];
        for (int i=0; i<arrayCapacity; i++) {
            [_dna addObject: [dnaArray objectAtIndex:arc4random()%4]];
        }
        
    }
    return self;
}


@end
