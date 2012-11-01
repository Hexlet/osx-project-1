//
//  Cell+mutator.m
//  DNA
//
//  Created by Ivan Glebov on 01.11.12.
//  Copyright (c) 2012 Ivan Glebov. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void) mutate:(int)X {
    NSMutableSet *set;
    NSNumber *valueIndex;
    for (int i = 0; i < X; i++) {
        while (YES) {
            NSNumber *valueIndex = [NSNumber numberWithInt:arc4random() % N];
            if (![set containsObject: valueIndex ]) break;
        }
        [set addObject:valueIndex];
        int letterValue2 = arc4random() % 4;
        switch (letterValue2) {
            case 0:
                [self.DNA insertObject:@"A" atIndex:[valueIndex intValue]];
                break;
            case 1:
                [self.DNA insertObject:@"T" atIndex:[valueIndex intValue]];
                break;
            case 2:
                [self.DNA insertObject:@"G" atIndex:[valueIndex intValue]];
                break;
            case 3:
                [self.DNA insertObject:@"C" atIndex:[valueIndex intValue]];
                break;
        }
    }
}
@end
