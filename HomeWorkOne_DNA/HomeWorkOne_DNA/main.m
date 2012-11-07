//
//  main.m
//  HomeWorkOne_DNA
//
//  Created by Anatoly Yashkin on 07.11.12.
//  Copyright (c) 2012 Anatoly Yashkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ScreenSaver/ScreenSaver.h>
#import "Cell.h"

@interface Cell(mutator)
-(void)mutate:(int)X;
@end

@implementation Cell(mutator)

-(void)mutate:(int)X
{
    if (X>0 & X<=100)
    {
        
        //массив для индексов символов ДНК, которые будут заменены
        NSMutableArray *mutatedIndexes = [NSMutableArray arrayWithCapacity:X];
        //случайное число
        int randomNumber=0;
        
        //Мутируем нашу последовательность ДНК, земеняя символы со случайными индексами на не менее случайные символы,
        //чтобы символы не индексы не повторялись, будем их запоминать в массиве для индексов
        for (int i=0; i<X; i++) {
            randomNumber = SSRandomIntBetween(0, 100);
            if (![mutatedIndexes containsObject:[NSNumber numberWithInteger:randomNumber]]) {
                [self.DNA replaceObjectAtIndex:randomNumber withObject:[Cell getRandomDNAPart]];
                [mutatedIndexes addObject:[NSNumber numberWithInteger:randomNumber]];
            }
        }          
    }

    
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"cell1: %@", cell1);
        NSLog(@"cell2: %@", cell2);
        NSLog(@"Humming distance: %d", [cell1 hammingDistance:cell2]);
        [cell1 mutate:50];
        [cell2 mutate:50];
        NSLog(@"mutated cell1: %@", cell1);
        NSLog(@"mutated cell2: %@", cell2);
        NSLog(@"Humming distance after mutation: %d", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}

