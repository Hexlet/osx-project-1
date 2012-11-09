//
//  main.m
//  DNAManipulation
//
//  Created by MapC on 06.11.12.
//  Copyright (c) 2012 wiifit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

//Создание категории Mutator для класса Cell
@interface Cell (Mutator);
    -(void) mutate:(int) x;
@end

//Реализация метода mutate категории Mutator класса Cell
@implementation Cell (Mutator)

-(void) mutate:(int) x {

    int randomElementIndex = 0;
    int randomMutationIndex = 0;
    int numberOfElementsToMutate = 0;
    NSUInteger indexOfDNAForMutation = 0;
    NSString *currentElementInDNA;
    
    NSMutableArray *mutationIndexes;
    NSMutableArray *elements;
    
    //проверка корректности введенного значения процента мутации
    if (x<0||x>100) {
        @throw [NSException exceptionWithName:@"InvalidPercentage" reason:[NSString stringWithFormat:@"Invalid percentage: %i. Percentage must be from 0 to 100!",x] userInfo:nil];
    }
    //создание массива ATGC
    elements = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];

    //создание массива для хранения индексов еще не мутировавших элементов
    mutationIndexes = [NSMutableArray arrayWithCapacity: [self.DNA count]];
    
    //определение количества элементов DNA, которые необходимо мутировать
    numberOfElementsToMutate = (int) lroundf(0.01*x*[self.DNA count]);
    
    //заполнение массива mutationIndexes индексами массива DNA
    for (NSUInteger index=0; index<[self.DNA count]; index++) {
        [mutationIndexes insertObject:[NSNumber numberWithUnsignedInteger:index] atIndex:index];
    }
    for (NSUInteger index=0; index<numberOfElementsToMutate; index++) {
                
        //случайный индекс элемента массива еще не мутировавших элементов
        randomMutationIndex = arc4random()%([self.DNA count] - index);
        
        
        //индекс немутировавшего элемента из массива DNA
        indexOfDNAForMutation = [[mutationIndexes objectAtIndex:randomMutationIndex] integerValue];

        //текущий элемент массива DNA под индексом randomMutationIndex
        currentElementInDNA = [self.DNA objectAtIndex:indexOfDNAForMutation];

        //удаление из временного массива ATGC текущего элемента DNA
        [elements removeObjectIdenticalTo:currentElementInDNA];

        //случайный индекс для для выбора элемента из массива мутации
        randomElementIndex = arc4random()% [elements count];
        
        //замена элемента массива DNA с индексом indexOfDNAForMutation случайным элементом
        [self.DNA replaceObjectAtIndex:indexOfDNAForMutation withObject:[elements objectAtIndex:randomElementIndex]];
        
        //удаление из массива mutationIndexes индекса смутировавшего элемента массива DNA
        [mutationIndexes removeObjectAtIndex:randomMutationIndex];

        //возврат в массив ATGC текущего элемента DNA
        [elements addObject:currentElementInDNA];
    }
}
@end
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int distance = 0;
        Cell* myCell1, *myCell2;
       
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        distance = [myCell1 hammingDistance:myCell2];
        NSLog(@"Distance1 =  %i",distance);

        [myCell1 mutate:30];
        [myCell2 mutate:30];

        distance = [myCell1 hammingDistance:myCell2];
        NSLog(@"Distance2 =  %i",distance);
        
    }
    return 0;
}

