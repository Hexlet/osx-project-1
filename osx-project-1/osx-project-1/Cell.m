//
//  Cell.m
//  osx-project-1
//
//  Created by Murat Temirov on 26.12.12.
//  Copyright (c) 2012 Murat Temirov. All rights reserved.
//

#import "Cell.h"

@implementation Cell{
    NSArray *arraySymbol;
}

@synthesize dna;

- (id)init
{
    if (self = [super init]) {
        dnaLenght = 100;
        arraySymbol = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        dna = [self generateRandomArrayWithLenght:dnaLenght];
//        NSLog(@"%@",dna);
    }
    return self;
}

-(int) hammingDistance:(Cell*) myCell{
    int hammingDistance = 0;
    for (int i = 0; i < [dna count]; i++) {
        if ([dna objectAtIndex:i] != [[myCell dna] objectAtIndex:i]) {
            hammingDistance++;
        }
    }
    return hammingDistance;
}

-(NSMutableArray*) generateRandomArrayWithLenght:(int) lenght{
    NSMutableArray *rArray = [NSMutableArray arrayWithCapacity:lenght];
    for (int i=0; i<lenght; i++) {
        [rArray addObject:[self generateChar]];
    }
    return rArray;
}

-(id) generateChar{
    int r = arc4random() % [arraySymbol count];
    return [arraySymbol objectAtIndex:r];
}

@end
