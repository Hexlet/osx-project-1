//
//  Cell.m
//  DNAProcessor
//
//  Created by Sergey Nebolsin on 10.11.12.
//  Copyright (c) 2012 Sergey Nebolsin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

+(Cell *) cell {
    return [Cell cellWithLength:DNA_DEFAULT_LENGTH];
}

+(Cell *) cellWithLength:(int)length {
    return [[Cell alloc] initWithLength:length];
}

+(NSString *) randomNucleicBase {
    switch (arc4random_uniform(4)) {
        case 0: return @"A";
        case 1: return @"T";
        case 2: return @"G";
        default: return @"C";
    }
}

-(id) init {
    return [self initWithLength:DNA_DEFAULT_LENGTH];
}

-(id) initWithLength:(int) length {
    if (self = [super init]) {
        _dna = [NSMutableArray arrayWithCapacity:length];
        while (_dna.count < length) {
            [_dna addObject:[Cell randomNucleicBase]];
        }
    }
    return self;
    
}

-(int) hammingDistance:(Cell *)anotherCell {
    int distance = 0;
    for(int i = 0; i < [self.dna count] && i < [anotherCell.dna count]; i++) {
        if (![[self.dna objectAtIndex:i] isEqualToString:[anotherCell.dna objectAtIndex:i]]) {
            distance++;
        }
    }
    return distance;
}

-(void) print {
    NSLog(@"DNA: %@", [_dna componentsJoinedByString:@""]);
}

@end
