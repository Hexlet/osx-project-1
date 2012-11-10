//
//  Cell.m
//  DNA
//
//  Created by Oleg on 05.11.12.
//  Copyright (c) 2012 Oleg. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(NSString*)randomNuclide{ //Метод выдают на выходе случайное значение A, T, G и С.
    NSString *retNuc = @"";
    switch (arc4random() % 4) {
        case 0:
            retNuc = @"A";
            break;
        case 1:
            retNuc = @"T";
            break;
        case 2:
            retNuc = @"G";
            break;
        case 3:
            retNuc = @"C";
            break;
    }
    return retNuc;
}

-(id) init {
    self = [super init];
    if (self) {
        DNA = [[NSMutableArray alloc]init];
        for (int i= 1; i < 100; i++)  [DNA addObject: self.randomNuclide]; //Заполняем массив при помощи метода randomNuclide,
                                                                           //потому что использю этот код в двух разных местах.
    }
    return self;
}

-(int)hammingDistance:(Cell *)foreignCell {
    int hd = 0;
    for (NSUInteger i = 0; i < 99; i++) {
        if (![[DNA objectAtIndex: i] isEqualToString:[foreignCell->DNA objectAtIndex: i]]) { //Сравниваю элемнтны массивов.
            hd++;
        }
    }
    return hd;
}

@end
