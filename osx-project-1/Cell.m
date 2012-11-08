//
//  Cell.m
//  osx-project-1
//
//  Created by Tkachenko Vitalii on 11/1/12.
//  Copyright (c) 2012 Sanitariumlab. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init {
    self = [super init];
    if (self) {
        _dna = [[NSMutableArray alloc] init];
        
        int i;
        for (i = 0; i < 100; i++) {
            [_dna insertObject:[Cell getRandomChar] atIndex:i];
        }
    }
    return self;
}

-(NSString *)description {
    return [_dna componentsJoinedByString:@""];
}

- (int)hammingDistance:(Cell *)cell {
    int i, hammingDistance;
    NSMutableArray *dna2;
    
    hammingDistance = 0;
    dna2 = [cell dna];
    
    for (i = 0; i < _dna.count; i++) {
        if ([[_dna objectAtIndex:i] isNotEqualTo: [dna2 objectAtIndex:i]]) {
            hammingDistance++;
        }
    }
    
    return hammingDistance;
}

+ (NSString *)getRandomChar {
    NSArray *values = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
                       
    return [values objectAtIndex:arc4random()%values.count];
}

@end

@implementation Cell (Mutator)

- (void)mutator:(int)percent {
    if (percent < 0 || percent > 100) {
        return;
    }
    
    NSMutableArray *usedIndexes = [[NSMutableArray alloc] init];
    
    int replaceIndex;
    long replaceChars = lroundf(_dna.count * percent / 100.0f);
    for (int i = 0; i < replaceChars; i++) {
        while (YES) { // в этом цикле находим индекс, который еще не мутировал
            replaceIndex = arc4random()%_dna.count;
            if (![usedIndexes containsObject:[NSNumber numberWithInt:replaceIndex]]) {
                [usedIndexes addObject:[NSNumber numberWithInt:replaceIndex]];
                break;
            }
        }
        while (YES) { // в этом цикле находим символ, отличный от исходного, для мутации
            NSString *newChar = [Cell getRandomChar];
            if ([[_dna objectAtIndex:replaceIndex] isNotEqualTo: newChar]) {
                [_dna replaceObjectAtIndex:replaceIndex withObject:newChar];
                break;
            }
        }
    }
}

@end
