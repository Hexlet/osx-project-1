//
//  Cell.m
//  Cell
//
//  Created by padawan on 31.10.12.
//  Copyright (c) 2012 padawan. All rights reserved.
//

#import "Cell.h"

@implementation Cell
    @synthesize DNA, lengthOfDna, nucleotides;
- (id) init {
    self = [super init];
    
    if(self) {
        [self initProperty];
        [self initDNA];
    }
    return self;
}

- (void) initProperty {
    // Задаем длину
    lengthOfDna = 100;
    
    // Задаем нуклеотиды
    nucleotides = [[NSArray alloc] initWithObjects: @"T", @"A", @"G", @"C", nil];
}

- (void) initDNA {
    // Инициализируем DNA
    DNA = [NSMutableArray arrayWithCapacity:lengthOfDna];
    for (int i = 0; i < lengthOfDna; i++) {
        [DNA addObject: [nucleotides objectAtIndex:arc4random()%[nucleotides count]]];
    }
}

- (void) print {
    NSString *toPrint = [DNA componentsJoinedByString:@" "];
    NSLog(@"%@", toPrint);
}

//
- (int) hammingDistance:(Cell *)anotherDna{
    NSLog(@"=====================");
    NSLog(@"Сравнение");
    // счетчик несовпадений
    int k = 0;
    
    id left, right;
    // Сравнение DNA
    for (int i = 0; i < lengthOfDna; i++) {
        left    = [DNA objectAtIndex:i];
        right   = [[anotherDna DNA] objectAtIndex:i];
        if(![left isEqualTo:right]) {
            // Выводит неидентичные элементы
            NSLog(@"%@ <> %@ (позиция %i)", left, right, i);
            k++;
        }
    }
    // Выводим результат
    NSLog(@"Несовпадений: %i", k);
    return k;
}
@end
