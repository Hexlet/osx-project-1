//
//  main.m
//  DNAProject
//
//  Created by S.Lebedev on 30.10.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator) // категория Mutator класса Cell
-(void)mutate:(int)x; //в этой категории объявлен только один метод - mutate
@end

@implementation Cell (Mutator) // имплементация категории Mutator
// Метод mutate нам нужен, чтобы сформировать новую ДНК, изменив х% исходной последовательности
-(void)mutate:(int)x{
    // если неверно задан процент изменения, дальнейшие действия бессмысленны
    if (x<0||x>100) {
        @throw [NSException exceptionWithName:@"InvalidXInMutator" reason:[NSString stringWithFormat:@"Invalid value %i!",x] userInfo:nil];
    }
    NSUInteger generated = 0; //индекс заменяемого символа
    NSUInteger amount = lroundf((capacityOfDNA*x)/100.0f); // кол-во символов для изменения (x - процентный показатель)
    id sourceGene,modifiedGene; //переменные для анализа исходного символа и модифицированного символа
    NSMutableIndexSet *setOfDNA = [[NSMutableIndexSet alloc] init]; // эта коллекция индексов нужна для предотвращения повторного изменения в последовательности
    do {
        // сначала сформируем случайным образом индекс, по которому будем обращаться
        // немаловажное условие - чтобы элемент по одному индексу менялся ровно один раз
        do {
            generated = arc4random() % capacityOfDNA;
        } while ([setOfDNA containsIndex:generated]);
        [setOfDNA addIndex:generated]; // запоминаем изменяемый индекс
        sourceGene = [DNA objectAtIndex:generated]; // запоминаем исходное значение в последовательности по индексу
        // и меняем значение символа, помня о том, что оно в любом случае должно отличаться от исходного!
        do {
            modifiedGene = gene[(arc4random() % capacityOfGene)];
        } while ([sourceGene isEqualToString:modifiedGene]);
        [DNA replaceObjectAtIndex:generated withObject:modifiedGene];
    } while ([setOfDNA count]<amount);
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *myCell = [[Cell alloc] init]; // первая ДНК
        NSLog(@"%@",myCell);
        Cell *myCell2 = [[Cell alloc] init]; // вторая ДНК
        NSLog(@"%@",myCell2);
        NSLog(@"Hamming distance: %d",[myCell hammingDistance:myCell2]);
        @try {
            [myCell mutate:12];
        }
        @catch (NSException *exception) {
            NSLog(@"Error while mutating myCell1! %@",exception);
        }
        @finally {
            NSLog(@"%@",myCell);
        }
        @try {
            [myCell2 mutate:37];
        }
        @catch (NSException *exception) {
            NSLog(@"Error while mutating myCell2! %@",exception);
        }
        @finally {
            NSLog(@"%@",myCell2);
        }
        NSLog(@"Hamming distance: %d",[myCell hammingDistance:myCell2]);
        
    }
    return 0;
}

