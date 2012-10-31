//
//  Cell.m
//  DNA
//
//  Created by Администратор on 10/30/12.
//  Copyright (c) 2012 Zed Company. All rights reserved.
//

#import "Cell.h"


@implementation Cell

+(char)returnRandomGene {
    NSString* variants = @"GTAC";
    srandomdev();
    int variantOffset = random() % 4;
    char randomVariant = [variants characterAtIndex:variantOffset];
    return randomVariant;
}


-(id)init {
    self = [super init];
    _DNA = [NSMutableArray array];
    for (int i=0; i < 100; i++) {
        NSString* variant = [NSString stringWithFormat:@"%c", [Cell returnRandomGene]];
        [_DNA addObject:variant];
    }
    return self;
}

-(void)print{
    for (int i=0; i < [_DNA count]; i++ ) {
        NSLog(@"%@", [_DNA objectAtIndex:i]);
    }
}

-(int)hammingDistance:(Cell *)SampleCell {
    int distance = 0;
    for (int i=0; i < [_DNA count]; i++ ) {
        if ([_DNA objectAtIndex:i] != [[SampleCell DNA] objectAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}
@end
