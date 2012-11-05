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
-(NSMutableArray *) generateDNA:(long int) length{
    NSMutableArray *dna = [NSMutableArray arrayWithCapacity:length];
    
    for (int i=0; i<length; i++) {
        [dna addObject:[self getRandomMolecule]];
    }
    
    return dna;
}

// случайным образом возвращаем одну из возможных молекул
-(NSString *) getRandomMolecule {
    NSArray *molecule = [NSArray arrayWithObjects: @"A",@"T",@"G",@"C",nil];
    return [molecule objectAtIndex:[self getRandomNumber:[molecule count]]];
}

// возвращаем случайное число не более length
-(int) getRandomNumber:(NSUInteger) length {
    return (arc4random() % length);
}

// возвращаем количество различий
-(int) hammingDistance:(Cell *)cell {
    int distance = 0;
    
    for (int i=0;i< cell->DNA.count; i++) {
        if (![[cell->DNA objectAtIndex:i] isEqual:[self->DNA objectAtIndex:i]]) {
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
