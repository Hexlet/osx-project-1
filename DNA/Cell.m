//
//  Cell.m
//  DNA
//
//  Created by Rustem Sayargaliev on 10/30/12.
//  Copyright (c) 2012 sensation. All rights reserved.
//

#import "Cell.h"


@implementation Cell 
-(void) print {
    NSLog(@"%@", _DNA);
}

-(id) init {
    if (self = [super init]) {
        _DNA = [[NSMutableArray alloc]initWithCapacity:100];  //создали переменную для массива размером в 100 символов
        for (int i=0; i<100; i++) { //перебираем все элементы массива...
            switch (arc4random() % 4) {       //...задавая каждому элементу случайную букву из множества {A, T, G, С}
                case 0:
                    _DNA[i] = @"A";
                    break;
                case 1:
                    _DNA[i] = @"T";
                    break;
                case 2:
                    _DNA[i] = @"G";
                    break;
                case 3:
                    _DNA[i] = @"C";
                    break;
                default:
                    break;
            }
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)c {  //создаем метод hammingDistance для сравнения двух ДНК
    int hammlingDistance = 0;
    for (int i=0; i<100; i++) { //поэлементно сравниваем два массива
        if (_DNA[i] != c.DNA[i]) {hammlingDistance++;};
    }
        return hammlingDistance;
}

@end
