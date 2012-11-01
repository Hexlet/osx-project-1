//
//  Cell.m
//  dnaproject
//
//  Created by Andrey Zasorin on 10/31/12.
//  Copyright (c) 2012 Andrey Zasorin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

//Внутри цикла при добавлении объектов в массив пробовал вместо dna1 писать [_dna AddObject...] но тогда на выходе  получаем вместо массива (null), поясните кто может в комментариях почему так

-(id) init{
    self = [super init];
    if(self){
        NSArray *elements = [[NSArray alloc] initWithObjects: @"A",@"T",@"G",@"C", nil];
        NSMutableArray *dna1 = [[NSMutableArray alloc] init];
        for (int i=0;i<100;i++){
            NSInteger random = arc4random() % [elements count];
            [dna1 addObject:[NSString stringWithFormat:@"%@",[elements objectAtIndex:random]]];
        }
        _dna = dna1;
        _dnastring = [_dna componentsJoinedByString: @""];
    }
    return self;
}

//Сравниваем property self и переданного объекта и считаем

-(int) getHummingDistance:(Cell *) anCell {
    counter = 0;
    for (int i=0;i<100;i++){
            if([self.dna objectAtIndex:i]!=[anCell.dna objectAtIndex:i])
        {
            counter++;
        };
    }
    return counter;
}

@end
