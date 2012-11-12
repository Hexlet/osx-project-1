//
//  Cell.m
//  osx-project-1
//
//  Created by Maxim Zhukov on 05.11.12.
//  Copyright (c) 2012 Maxim Zhukov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// переопределённый инит со значением по-умолчанием
-(id) init {
    return [self initWithMoleculeLength:100];
}

// добавлен свой конструктор принимающий в качестве параметра длину молекулы
-(id) initWithMoleculeLength:(int)length {
    self = [super init];
    
    if (self) {
        DNA = [NSMutableArray arrayWithArray: [self generateDNA:length]];
    }
    
    return self;
}

// вспомогательный метод, заполняющий молекулу
-(NSMutableArray *) generateDNA:(long int) withLength{
    NSMutableArray *dna = [NSMutableArray arrayWithCapacity:withLength];
    
    for (int i=0; i<withLength; i++) {
        [dna addObject:[self getRandomMolecule]];
    }
    
    return dna;
}

// случайным образом возвращаем одну из возможных молекул
-(NSString *) getRandomMolecule {
    NSArray *molecule = [NSArray arrayWithObjects: @"A",@"T",@"G",@"C",nil];
    return [molecule objectAtIndex:[self getRandomNumber:[molecule count]]];
}

// возвращаем случайное число не более topLimit
-(int) getRandomNumber:(NSUInteger) topLimit {
    return (arc4random() % topLimit);
}

// возвращаем количество различий
-(int) hammingDistance:(Cell *)cell {
    int distance = 0;
    
    for (int idx=0;idx< cell->DNA.count; idx++) {
        if (![[cell->DNA objectAtIndex:idx] isEqual:[self->DNA objectAtIndex:idx]]) {
            distance++;
        }
    }
    
    return distance;
}

// отладочный метод
-(void) print {
    NSLog(@"%@", DNA);
}

@end
