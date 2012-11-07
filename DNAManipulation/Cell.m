//
//  Cell.m
//  DNAManipulation
//
//  Created by MapC on 06.11.12.
//  Copyright (c) 2012 wiifit. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {

    self = [super init];
    if (self) {

        //размер массива DNA
        int capacityOfDNA = 100;
        int randomElementIndex = 0;
        
        //создание временного массива для выбора случайного элемента
        NSArray *elements;
        elements = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
 
        //инициализация массива DNA размером в 100 элементов
        _DNA = [NSMutableArray arrayWithCapacity:capacityOfDNA];

        //заполнение массива DNA случайными элементами
        for (NSUInteger index=0; index<capacityOfDNA; index++) {
            randomElementIndex = arc4random()%4;
            [_DNA insertObject:[elements objectAtIndex:randomElementIndex] atIndex:index];
        }
    }
    return self;
}
-(int) hammingDistance: (Cell *) c {

    int distance = 0;
    
    NSMutableArray *arrayToCompare1 = self.DNA;
    NSMutableArray *arrayToCompare2 = c.DNA;
    
    for (int index=0; index< [arrayToCompare1 count]; index++) {
        NSString *element1 = [arrayToCompare1 objectAtIndex:index];
        NSString *element2 = [arrayToCompare2 objectAtIndex:index];

        if (![element1 isEqualToString:element2]) {
            distance++;
        }
    }
    return distance;
}
@end
