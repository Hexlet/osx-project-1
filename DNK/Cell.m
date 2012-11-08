//
//  Cell.m
//  DNK
//
//  Created by MiShutka on 11/8/12.
//  Copyright (c) 2012 MiShutka. All rights reserved.
//  mishutka@programist.ru

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    // если не равен nil
    if (self) {
        // инициализируем массив
        DNA = [NSMutableArray array];
        
        // создаем 100 элементов, со случайным символом
        for (int i=0; i<100; i++) {
            [DNA addObject: [Cell getRandomSymbol]];
        }
    }
    return self;
}

+(NSString*) getRandomSymbol {
    // массив, хранящий символы
    NSArray *symbols = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    return [symbols objectAtIndex: arc4random() % 4];
}

-(NSString*) getItemAtIndex:(int)index {
    return [DNA objectAtIndex:index];
}

-(int) hammingDistance:(Cell*)cell {
    int distance = 0;
    
    for (int i=0; i<100; i++) {
        if (![[DNA objectAtIndex:i] isEqual:[cell getItemAtIndex:i]] ) {
            distance ++;
        }
    }
    return distance;
}
// вывод цепочки на консоль
-(void) print {
    NSMutableString *s = [NSMutableString stringWithString:@""];
    
    for (int i=0; i < [DNA count];  i++) {
        [s appendString: [DNA objectAtIndex:i]];
    }
    
    NSLog(@"%@",s);
}

@end
