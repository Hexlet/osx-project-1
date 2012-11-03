//
//  Cell.m
//  DNA
//
//  Created by Mac on 01.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

@implementation Cell 

//@synthesize dna;

-(id) getDna:(int) index {
    if (index >= 0 && index < [dna count]){
        return [dna objectAtIndex:index];
    }
    else
    {
        return nil;
    }
}

-(void)setDna:(int)index :(id)value {
    if (index >= 0 && index < SIZE){
        if (index >= [dna count]){
            [dna insertObject:value atIndex:index];
        }
        else if (index < [dna count]){
            [dna replaceObjectAtIndex:index withObject:value];
        }
    }
}

-(id) init {
    self = [super init];
    if (self) {
        SIZE = 100;
        dna = [NSMutableArray arrayWithCapacity:SIZE];
        for (int i=0; i<SIZE; i++){
            // создаем массив с последовательностью символов
            NSArray *a = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
            // выбираем произвольный символ и добавляем его в массив dna
            int rnd = arc4random() % 4;
            [dna addObject:[a objectAtIndex:rnd]];
            
        }
    }
    return self;
}

-(void) print {
    NSString *dnaString = [dna componentsJoinedByString:@""];
    NSLog(@"%@",dnaString);
}

-(int) hammingDistance:(Cell*) mCell{
    int dist = 0;
    for (int i = 0; i<SIZE; i++){
        NSString *c1 = [self getDna:i];
        NSString *c2 = [mCell getDna:i];
        if (![c1 isEqualToString:c2])
            dist++;
    }
    return dist;
}


@end
