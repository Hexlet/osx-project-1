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
    //Вычисляю процент
    int procent = (int)round((float)x/100*[self.dna count]);
    
    //Создал массив чисел от 0 до 99
    NSMutableArray *unicNumbers = [NSMutableArray array];
    for(int i = 0; i<100; i++) 
        [unicNumbers addObject: [NSNumber numberWithInt:i]];
    
    NSUInteger size, position;
    NSString *oldDnaCode, *newDnaCode;
    for (int i = 0; i<procent; i++) {
        size = [unicNumbers count];
        //Выбираю уникальное число (номер позици в dna)
        if (size > 0)
            position = (arc4random() % size);
        int unicRandomNumber = [[unicNumbers objectAtIndex:position] intValue];
        
        //Проверяю чтобы днк код не повторялся при замене
        oldDnaCode = [self.dna objectAtIndex:unicRandomNumber];
        newDnaCode = [self.dnaCode objectAtIndex:arc4random() % [self.dnaCode count]];
        while ([oldDnaCode isEqualToString:newDnaCode])
            newDnaCode = [self.dnaCode objectAtIndex:arc4random() % [self.dnaCode count]];
        
        //Мутирую днк по выбранной позиции
        [self.dna replaceObjectAtIndex:unicRandomNumber
                            withObject:newDnaCode];
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

