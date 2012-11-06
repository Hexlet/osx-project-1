//
//  Cell.m
//  DNK
//
//  Created by Admin on 05.11.12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSMutableArray *DNA;
}

-(id) init {
    self = [super init];
    if (self) {
        DNA = [NSMutableArray array];
        for (int i = 0; i < 100; i++) {
            [DNA addObject:
                [NSString stringWithFormat:@"%C",
                    [@"ATGC" characterAtIndex:arc4random()%4]]];
            }
        }
    return self;
}

-(int)hammingDistance:(Cell*) prob1 {
    int n = 0;
    for (int i = 0; i < 100; i++) {
        if ([DNA[i] self] == [prob1 getCell:i]) {
            n++;
        }
    }
    return n;
}

-(id) getCell:(int) n {
    return DNA[n];
}

@end

@implementation Cell (mutator)

-(void) mutate:(int)mut {
    int i = 0;
    int k = random()%100;
    NSString *Mutstr;
    NSMutableArray *TEMP = [NSMutableArray array];
        do {
            while ([TEMP containsObject:[NSString stringWithFormat:@"%d",k]]) {
                k = arc4random()%100;
            }
            Mutstr = [NSString stringWithFormat:@"%C", [@"ATGC" characterAtIndex:arc4random()%4]];
            if (Mutstr != [DNA[k] self ]) {
                [TEMP addObject:[NSString stringWithFormat:@"%d",k]];
                [DNA replaceObjectAtIndex:k withObject:Mutstr];
                i++;
            }
        } while (i < mut);
}

@end
