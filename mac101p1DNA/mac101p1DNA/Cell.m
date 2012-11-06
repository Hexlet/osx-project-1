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

-(NSMutableArray *) makeDNA:(NSUInteger)l {
    
    DNA = [[NSMutableArray alloc] init];
    for (int i = 0; i < l; i++)[DNA addObject:[self newNucleotide]];
    return DNA;
}

-(NSArray *) newNucleotide {
    mols = [[NSArray alloc] initWithObjects:@"A", @"C", @"G", @"T", nil];
    return [mols objectAtIndex:arc4random()%mols.count];
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

-(void) mutate:(NSUInteger) x {
    // Использую NSIndexSet для генерации уникальных наборов индексов
    NSUInteger num = (NSUInteger)floor([self->DNA count]*x/100); // кол-во изменяемых молекул ДНК
    // получаем номера изменяемых молекул
    // NSIndexSet *molnum = [[NSIndexSet alloc] initWithIndexSet:[self generateRandomIndexes:num]];
    // Генерируем молекулы
    for (int i=0;i<num;i++) {
        [self->DNA replaceObjectAtIndex:i withObject:[self newNucleotide]];
    };
    
//    NSMutableArray *newcell = [NSMutableArray arrayWithArray:[self makeDNA:num]];
//    
//    [self->DNA replaceObjectsAtIndexes:molnum withObjects:newcell];
}

-(NSIndexSet *) generateRandomIndexes:(NSUInteger) l {
    NSMutableIndexSet *places = [[NSMutableIndexSet alloc] init];
    NSUInteger number = 0;
//    do {
//        number = arc4random()%self->DNA.count;
//        [places addIndex:number];
//    } while (places.count < l);
    
    while (places.count < l) {
        number = arc4random()%self->DNA.count;
        [places addIndex:number];
    }
    return places;
    
}
@end
