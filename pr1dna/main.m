//
//  main.m
//  pr1dna
//
//  Created by админ on 11.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
    -(void) mutate: (int) x;
@end

@implementation Cell (mutator)

-(void) mutate:(int)x {
    //Копируем массив. Кажется плохим решением
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithArray:DNA];
    
    for (int i =0; i<x; i++) {
        int rnd = arc4random_uniform(DNA.count);
        
        //Проверка меняли ли этот элемент массива или нет
        while (![[tempArray objectAtIndex:rnd] isEqualToString:@"1"]) {
            
            NSString *myLetter = [self getLetter];
            //Проверка на совпадение букв
            while ([[DNA objectAtIndex:rnd] isEqualToString:myLetter]) {
                //если буквы одинаковы, то выдаем новую букву
                myLetter = [self getLetter];
            }
            //заменяем букву новой
            [DNA replaceObjectAtIndex:rnd withObject:myLetter];
            //Отмечаем что этот элемент уже меняли
            [tempArray replaceObjectAtIndex:rnd withObject:@"1"];
        }
    }
}

@end

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell1, *myCell2;
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        NSLog(@"hammingDistance = %i",[myCell1 hammingDistance:myCell2]);
        
        [myCell1 mutate:20];
        [myCell2 mutate:30];
        
        NSLog(@"new hammingDistance = %i",[myCell1 hammingDistance:myCell2]);
        
        
    }
    return 0;
}

