//
//  Cell.m
//  DNK
//
//  Created by Администратор on 11/3/12.
//  Copyright (c) 2012 Rustam. All rights reserved.
//

#import "Cell.h"

@implementation Cell
- (id)init
{
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i =0; i<100; i++) {
              [_DNA addObject:[Cell getRndCellElement]];
        }
    }
    return self;
}

+(NSString *)getRndCellElement{
    switch (arc4random()%4) {
        case 0:
            return @"A";
        case 1:
            return @"T";
        case 2:
            return @"G";
        default:
            return @"C";
    }
}


- (int) hammingDistance:(Cell *)cell
{
    int cnt = 0;
    NSLog(@"-------------------------------");
    NSLog(@"[##] [1 DNA] [2 DNA] [!=]");
    for (int i =0; i<100; i++) {
        if([[_DNA objectAtIndex:i] isEqualTo:[[cell DNA] objectAtIndex:i]]){
              NSLog(@"[%i] [%@] [%@]",i,[_DNA objectAtIndex:i],[[cell DNA] objectAtIndex:i]);
        }
        else{
            cnt++;
            NSLog(@"[%i] [%@] [%@] [%i]",i,[_DNA objectAtIndex:i],[[cell DNA] objectAtIndex:i],cnt);
        }
    }
    NSLog(@"Total hamming distance = %i",cnt);
    NSLog(@"-------------------------------");
    return cnt;
}
@end
