//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Admin on 11/17/12.
//  Copyright (c) 2012 antonv. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void)mutateAtPos:(int)pos{
    uint rnum = arc4random() % 4;
    NSString *newStr;
    switch (rnum) {
        case 0:
            newStr = @"A";
            break;
        case 1:
            newStr = @"T";
            break;
        case 2:
            newStr = @"G";
            break;
        case 3:
            newStr = @"C";
            break;
        default:
            break;
    }
[self.DNA setObject:newStr atIndexedSubscript:rnum];
}

-(void)mutate:(int)pos{
    NSMutableArray *marked = [NSMutableArray array];
    for (int i = 0; i< 100; i++) {
        [marked addObject:[NSNumber numberWithBool:NO]];
    }
    int num_marked = 0;
    NSMutableString *s_log = [NSMutableString string];
    while (num_marked < pos){
        int next_to_mark = arc4random()%100;
        if ([[marked objectAtIndex: next_to_mark] boolValue])
            continue;
        else {
            [self mutateAtPos:next_to_mark];
            [marked replaceObjectAtIndex:next_to_mark withObject:[NSNumber numberWithBool:YES]];
            num_marked++;
            [s_log appendFormat:@"%i|",next_to_mark];
        }
    }
    NSLog(@"mutated: %@", s_log);
}

@end
