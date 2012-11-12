//
//  main.m
//  DNK
//
//  Created by eldar on 06.11.12.
//  Copyright (c) 2012 eldar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void) mutate: (int) X;

@end


@implementation Cell (mutator)

//процедура для мутации ДНК
- (void) mutate: (int) X{
    NSNumber *newIndex = [NSNumber numberWithInt:0];
    NSArray *arr = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    NSMutableArray *intArr = [[NSMutableArray alloc] init];
    
    //определяем массив из Х уникальных чисел - индексов элементов для мутации
    if (X != 0) {
        newIndex = [NSNumber numberWithInt: arc4random_uniform(100)];
        [intArr insertObject:newIndex atIndex: 0];
    }
    
    for (int i = 1; i < X; i++) {
        while ([intArr containsObject: newIndex] == YES) {
            newIndex = [NSNumber numberWithInt: arc4random_uniform(100)];
        }
        [intArr insertObject:newIndex atIndex:i];
    }
    
    //мутируем Х элементов
    for (int i = 0; i < X; i++) {
        newIndex = [NSNumber numberWithInt: [intArr[i] intValue]];
        NSString * currentDNACell = self.DNA[ [newIndex intValue] ];
        NSString * newDNACell = self.DNA[ [newIndex intValue] ];
        while ([currentDNACell isEqualToString: newDNACell] == YES ) {
            newDNACell = arr[arc4random_uniform(4)];
        }
        self.DNA[ [newIndex intValue] ] = newDNACell;
    }
}

@end


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        //создаем два объекта
        Cell * myDNA = [[Cell alloc] init];
        Cell * newDNA = [[Cell alloc] init];
        
        //их разность
        NSLog(@"hamming distance между объектами = %i", [myDNA hammingDistance:newDNA]);
        
        //мутируем на 10%
        [myDNA mutate : 10];
        [newDNA mutate : 10];
        
        NSLog(@"hamming distance между мутировавшими объектами = %i", [myDNA hammingDistance:newDNA]);
        
    }
    return 0;
}

