//
//  Cell.h
//  DNK
//
//  Created by MiShutka on 11/8/12.
//  Copyright (c) 2012 MiShutka. All rights reserved.
//  mishutka@programist.ru

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

// метод класса, возвращающий случайный символ ДНК
+(NSString*) getRandomSymbol;
// метод объекта, возвращающий указанный символ цепочки ДНК
-(NSString*) getItemAtIndex:(int)index;
// вычисление количества различий
-(int) hammingDistance:(Cell*)c;
// вывод на консоль цепочки ДНК
-(void) print;

@end
