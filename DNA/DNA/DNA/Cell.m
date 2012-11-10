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
    int capacity = 100;
    DNA = [[NSMutableArray alloc] initWithCapacity:capacity];
    // Adding elements - symbols
    for (int i=1;i<=capacity;i++){
        [DNA addObject:[self getNewSymbol]];
    }
    return self;
}

-(NSString *)getNewSymbol{
    NSArray *TypeDNA = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    int currIndex = arc4random() % TypeDNA.count;
    return [TypeDNA objectAtIndex:currIndex];
}

- (NSString *)description{
    NSString *descr;
    NSArray *copyDNA = [self getDNA];
    descr = [[NSString alloc] init];
    for (int i=0;i<copyDNA.count;i++){
        descr = [descr stringByAppendingString:[copyDNA objectAtIndex:i]];
    }
    return descr;
}

-(NSArray *)getDNA{
    return [DNA mutableCopy];
}

-(int)hammingDistance:(Cell *)toCell{
    NSArray *cell1 = self.getDNA;
    NSArray *cell2 = toCell.getDNA;
    int retCount = 0;
    
    for (int i=0;i<cell1.count;i++){
        NSString *val1 = [cell1 objectAtIndex:i];
        NSString *val2 = [cell2 objectAtIndex:i];
        if (![val1 isEqualToString:val2]){
            retCount = retCount + 1;
        }
    }
    return retCount;
}

@end
