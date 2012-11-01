//
//  main.m
//  ProjectOne_DNA
//
//  Created by mac on 30.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutator:(int)x;

@end

@implementation Cell (mutator)

-(void)mutator:(int)x
{    
    //Создал массив чисел от 0 до 99
    NSMutableArray *unicNumbers = [NSMutableArray array];
    for(int i = 0; i < 100; i++) 
        [unicNumbers addObject: [NSNumber numberWithInt:i]];
    
    NSUInteger size, position;
    for (int i = 0; i < x; i++) {
        size = [unicNumbers count];
        if (size > 0) 
            //Выбираю уникальное число (номер позици в dna)
            position = (arc4random() % size);
            NSNumber *unicRandomNumber = [unicNumbers objectAtIndex:position];
            //Мутирую днк по выбранной позиции
            [self.dna replaceObjectAtIndex:[unicRandomNumber intValue]
                                withObject:[self.dnaCode objectAtIndex:arc4random() % [self.dnaCode count]]];
            //Удаляю использованную позицию из массива, чтоб больше не повторялось
            [unicNumbers removeObjectAtIndex:position];
    }
}

@end

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
                
        NSLog(@"result 1 = %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutator:18];
        [cell2 mutator:63];
        
        NSLog(@"result 2 = %i", [cell1 hammingDistance:cell2]);
          
    }
    return 0;
}

