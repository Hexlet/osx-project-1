//
//  Cell.m
//  pr1dna
//
//  Created by админ on 11.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell 

-(id) init {
    self = [super init];
    
    if (self) {
        DNA = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < 100; i++) {
            [DNA addObject:[NSString stringWithString:[self getLetter]]];
        }
    }
    return self;
}

-(NSString *) getLetter {
    NSString *newElement;
    int r = arc4random_uniform(4);
    if (r == 0)
        newElement = @"A";
    else if (r == 1)
        newElement = @"T";
    else if (r == 2)
        newElement = @"G";
    else
        newElement = @"C";
    return newElement;
}

-(int) hammingDistance: (Cell*) myCell {
    int hammingDistance=0;//Сколько всего элементов не совпало
    //Сравнение элементов:
    NSArray *cell1 = DNA;
    NSArray *cell2 = myCell->DNA;
    
    for (int i=0; i<cell2.count; i++) {
        NSString *element1 = [cell1 objectAtIndex:i];
        NSString *element2 = [cell2 objectAtIndex:i];
        if (![element1 isEqualToString:element2]) {
            hammingDistance++;
        }
    }
    return hammingDistance;
}


@end
