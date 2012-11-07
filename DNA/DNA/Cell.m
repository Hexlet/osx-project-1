//
//  Cell.m
//  DNA
//
//  Created by oleksandr sharov on 11/6/12.
//  Copyright (c) 2012 oleksandr sharov. All rights reserved.
//

#import "Cell.h"


@implementation Cell

- (id) init{
    self=[super init];
    if (self) {
        self.DNA = [[NSMutableArray alloc] initWithCapacity:100];
        NSArray *codes = [[NSArray alloc]initWithObjects:@"A",@"T",@"G",@"C", nil];
        
        for (int i=0; i<100; i++) {
            int random_num = arc4random()%4;
            [_DNA addObject:[codes objectAtIndex:random_num]];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell*)theCell {
    int hammingDistance = 0;
    for (int i=0; i<100; i++) {
        NSString *firstCellCode = [self.DNA objectAtIndex:i];
        NSString *secondCellCode = [theCell.DNA objectAtIndex:i];

        if (![firstCellCode isEqualToString:secondCellCode]) {
            hammingDistance++;
        }
    }
    return hammingDistance;
}


@end
