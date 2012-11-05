//
//  Cell.m
//  DNK
//
//  Created by Danil Galeev on 03.11.12.
//  Copyright (c) 2012 Danil Galeev. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

@implementation Cell

int dnkLenght = 100;

-(id) init {
    self = [super init];
    if (self) {
        dnksymbols = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
        _dnk = [[NSMutableArray alloc] initWithCapacity: dnkLenght];
        for (int i=0; i<dnkLenght; i++) {
            [_dnk addObject: [self getRandomDnkSymbol]];
        }
    }
    return self;
}

-(NSString *) getRandomDnkSymbol {
    //Вспомогательный метод для получения случайного символа ДНК
    int randIndex = arc4random() % [dnksymbols count];
    NSString *nextDnkSymbol;
    nextDnkSymbol = [dnksymbols objectAtIndex: randIndex];
    return nextDnkSymbol;
}

-(int) hammingDistance: (Cell *)cell {
    int counter = 0;
    for (int i=0; i<dnkLenght; i++) {
        if(![[self.dnk objectAtIndex:(i)] isEqualToString: [cell.dnk objectAtIndex:(i)]]) {
            counter++;
        }
    }
    return counter;
}

@end
