//
//  Cell.m
//  osx-project-1
//
//  Created by Tkachenko Vitalii on 11/1/12.
//  Copyright (c) 2012 Sanitariumlab. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSMutableArray *dna;
}

- (id)init {
    self = [super init];
    if (self) {
        dna = [[NSMutableArray alloc] init];
        
        int i;
        for (i = 0; i < 100; i++) {
            [dna insertObject:[Cell getRandomChar] atIndex:i];
        }
    }
    return self;
}

- (NSMutableArray *)dna {
    return dna;
}

- (void)print {
    NSLog(@"%@", [dna componentsJoinedByString:@""]);
}

- (int)hammingDistance:(Cell *)cell {
    int i, hammingDistance;
    NSMutableArray *dna2;
    
    hammingDistance = 0;
    dna2 = [cell dna];
    
    for (i = 0; i < 100; i++) {
        if ([dna objectAtIndex:i] != [dna2 objectAtIndex:i]) {
            hammingDistance++;
        }
    }
    
    return hammingDistance;
}

+ (NSString *)getRandomChar {
    NSArray *values = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
                       
    return [values objectAtIndex:arc4random()%[values count]];
}

@end

@implementation Cell (Mutator)

- (void)mutator:(int)percent {
    if (percent < 0 || percent > 100) {
        return;
    }
    
    NSMutableArray *usedIndexes = [[NSMutableArray alloc] init];
    
    int i, replaceIndex;
    for (i = 0; i < percent; i++) {
        while (YES) {
            replaceIndex = arc4random()%[dna count];
            if (![usedIndexes containsObject:[NSNumber numberWithInt:replaceIndex]]) {
                [usedIndexes addObject:[NSNumber numberWithInt:replaceIndex]];
                break;
            }
        }
        [dna replaceObjectAtIndex:replaceIndex withObject:[Cell getRandomChar]];
    }
    srand((unsigned)time(NULL));
}

@end
