//
//  Protein.m
//  DNA
//
//  Created by Александр Борунов on 01.11.12.
//  Copyright (c) 2012 Александр Борунов. All rights reserved.
//

#import "Protein.h"

@implementation Protein

// по умолчанию инициализация осуществляется методом setRand
- (id) init {
    self = [super init];
    if (self){
        [self setRand];
    }
    return self;
}

- (void) setA {
    self->type='A';
}

- (void) setT {
    self->type='T';
}

- (void) setG {
    self->type='G';
}

- (void) setC {
    self->type='C';
}

- (void) setRand {
    char s[]="ATGC";  // я конечно слукавил. тут в конце строки еще \0 образовался, ну и пусть
    int index = (int)arc4random()&3; //  получил long случайное число и обрезал его до промежутка 0-3
    self->type= s[index]; // взяли случайный индекс из строки s
}



- (void) print {
    NSLog(@"%c", type);
}


- (char)get{
    return type;
}




@end
