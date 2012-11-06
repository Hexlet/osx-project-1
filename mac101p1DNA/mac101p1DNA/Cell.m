//
//  Cell.m
//  mac101p1DNA
//
//  Created by Voleg on 31.10.12.
//  Copyright (c) 2012 Voleg. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    // генерация DNA
    return [self initLength:100];
}

-(id) initLength:(int) l{
    self = [super init];
    if (self) {
        DNA = [NSMutableArray arrayWithArray:[self makeDNA:l]];
    }
    return self;
}

-(NSMutableArray *) makeDNA:(int)l {
    mols = [[NSArray alloc] initWithObjects:@"A", @"C", @"G", @"T", nil];
    DNA = [[NSMutableArray alloc] init];
    for (int i = 0; i < l; i++)[DNA addObject:[mols objectAtIndex:arc4random()%4]];
    return DNA;
}

-(int) hammingDistance:(Cell *)cell {
    int hd = 0;
    for (int i=0;i < DNA.count ;i++) {
        if (![[self->DNA objectAtIndex:i] isEqual:[cell->DNA objectAtIndex:i]])hd++;
    }
    return hd;
}

@end

@implementation Cell (mutator)

-(void) mutate:(int) x {
    // Использую NSIndexSet для генерации уникальных наборов индексов
    NSUInteger num = (int)floor(DNA.count*x/100); // кол-во изменяемых молекул ДНК
    // получаем номера изменяемых молекул
    NSIndexSet *molnum = [[NSIndexSet alloc] initWithIndexSet:[self generateRandomIndexes:num]];
    // Генерируем молекулы     
    
}

-(NSIndexSet *) generateRandomIndexes:(NSUInteger) l {
    NSMutableIndexSet *places = [[NSMutableIndexSet alloc] init];
    int num = 0;
    while (places.count < l) {
        num = arc4random()%self->DNA.count;
        [places addIndex:num];
    }
    return places;
    
}
@end
