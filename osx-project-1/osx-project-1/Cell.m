//
//  Cell.m
//  osx-project-1
//
//  Created by Victor Mylcin on 09.11.12.
//  Copyright (c) 2012 Victor Mylcin. All rights reserved.
//

#import "Cell.h"
#import "NSString+Nucleotides.h"

@implementation Cell

-(id) init {
    self = [super init];
    DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
    // заполняем массив ДНК случайными нуклеотидами
    for (int i = 0; i < DNA_LENGTH; i++) {
        [DNA addObject:[@"" randomNucleotide:nil]];
    }
    
    return self;
}

-(int) hammingDistance: (Cell *)testCell {
    int findDiff = 0;
    
    for (int i = 0; i < DNA_LENGTH; i++) {
        if (![[DNA objectAtIndex: i] isEqualToString: [testCell getByIndex: i]]) {
            findDiff++;
        }
    }
    
    return findDiff;
}

-(NSString *) getByIndex:(int)index {
    return [DNA objectAtIndex: index];
}

-(NSString *) description {
    return [DNA componentsJoinedByString:@"-"];
}

@end
