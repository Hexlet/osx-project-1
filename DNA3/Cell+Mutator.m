//
//  NSObject+Mutator.m
//  DNA3
//
//  Created by Igor Nikonov on 04.11.12.
//  Copyright (c) 2012 ngoro. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void)mutate:(int)perc {
    
    int cnt = perc*100/[self.DNA count];
    NSLog(@"%d mutations, %d percents", cnt, perc);
    
    NSMutableArray* idx = [[NSMutableArray alloc] init];
    
    while([idx count] < cnt) {
        NSInteger r = arc4random() % [self.DNA count];
        NSNumber *n = [NSNumber numberWithInt:(int)r];
        
        if([idx containsObject:n ]) {
            NSLog(@"letter at %ld already mutated", r);
            continue;
        }
        
        NSString* oldLetter = [self.DNA objectAtIndex:r];
        NSString* newLetter = Cell.getRandomLetter;
        
        if([oldLetter isEqualToString:newLetter]) {
            NSLog(@"old and new letter are equal");
            continue;
        }
        
        [idx addObject: n];
        
        [self.DNA replaceObjectAtIndex:r withObject: newLetter];
        NSLog(@"%ld: letter at %ld changed: %@ -> %@", [idx count], r, oldLetter, newLetter);
        
    }
    
    
}

@end
