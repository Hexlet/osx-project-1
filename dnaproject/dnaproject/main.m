//
//  main.m
//  dnaproject
//
//  Created by Andrey Zasorin on 10/31/12.
//  Copyright (c) 2012 Andrey Zasorin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

//Категория Mutator класса Cell

@interface Cell (Mutator)

-(void) mutate:(int) x;

@end

@implementation Cell (Mutator)

-(void) mutate: (int) x {
    NSArray *elements = [[NSArray alloc] initWithObjects: @"A",@"T",@"G",@"C", nil];
    
    //Создал отдельный массив из 100 элементов для выбора элементов для мутации, после мутации элемента его номеру в данном массиве присваиваю "-1" затем повторяем процедуру рандома проверяя не является ли значение очередного элемента в этом массиве "-1"
    
    NSMutableArray *harray = [[NSMutableArray alloc] init];
    for (int i=0;i<100;i++){
        [harray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for (int i =1; i<=x; i++){
        
        NSUInteger random = arc4random() % 100;
        NSUInteger randomEl;
        
        do {
            random = arc4random() % 100;
        } while ([[harray objectAtIndex:random] isEqualTo:@"-1"]);
        
    //Здесь так же проверяем что бы мутация действительно произошла, то есть чтобы заново сгенерированный элемент не совпадал с уже имеющимся
        
        do {
            randomEl = arc4random() % [elements count];
        } while ([[self.dna objectAtIndex:random] isEqualTo:[elements objectAtIndex:randomEl]]);
    
    //Заменяем элемнты в массивах
        
        [self.dna removeObjectAtIndex:random];
        [self.dna insertObject:[elements objectAtIndex:randomEl] atIndex:random];
        [harray removeObjectAtIndex:random];
        [harray insertObject:@"-1" atIndex:random];
    }
    self.dnastring = [self.dna componentsJoinedByString: @""];
}

@end

int main(int argc, const char * argv[])
{

    //Для вывода на экран используем property dnastring которую получили методом componentsJoinedByString
    
    @autoreleasepool {        
        Cell *myCell1, *myCell2;
        
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        NSLog(@"%@",myCell1.dnastring);
        NSLog(@"%@",myCell2.dnastring);
        int someint = [myCell1 getHummingDistance:myCell2];
        NSLog(@"HummingDistanceBeforeMutate - %d", someint);
        
        [myCell1 mutate:42];
        [myCell2 mutate:42];
        NSLog(@"%@",myCell1.dnastring);
        NSLog(@"%@",myCell2.dnastring);
        int someint2 = [myCell1 getHummingDistance:myCell2];
        NSLog(@"HummingDistanceAfterMutate - %d", someint2);
        
        }
    return 0;
}

