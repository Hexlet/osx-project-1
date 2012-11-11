//
//  Cell+mutator.m
//  NDA
//
//  Created by Tsyganov Stanislav on 12.11.12.
//  Copyright (c) 2012 Tsyganov Stanislav. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void)mutate:(int)percents{
    //generate set with numbers to mutate
    //fill set until "percents" eements in it
    NSMutableSet* mutNumbers = [[NSMutableSet alloc] init];
    while ([mutNumbers count] < percents) {
        [mutNumbers addObject:[NSNumber numberWithInt:arc4random_uniform(kDnaLength)]];
    }
//    NSLog(@"%@", mutNumbers);
    
    //mutate now
    for (NSNumber* num in mutNumbers) {
        NSArray *dnaSymbols = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        int count = (int)[dnaSymbols count];
        NSString* newSym = [dnaSymbols objectAtIndex: arc4random_uniform(count)];
        //have to change!
        while ([[self.DNA objectAtIndex:[num integerValue]] isEqual:newSym]) {
            newSym = [dnaSymbols objectAtIndex: arc4random_uniform(count)];
        }
        [self.DNA setObject:newSym atIndexedSubscript:[num integerValue]];
    }
}

@end
