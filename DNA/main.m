//
//  main.m
//  DNA
//
//  Created by wumin on 05.11.12.
//  Copyright (c) 2012 wumin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate: (int) mutateFactor;

@end

@implementation Cell (mutator)

-(void) mutate: (int) mutateFactor{
    
    int DNAcount = [DNA count];
    
    int numPositionToChange = DNAcount*mutateFactor/100;
    
    // создаем массив для хранения индексов элементов которые будут заменены в ДНК
    NSMutableArray *pullIndex;
    pullIndex = [NSMutableArray arrayWithCapacity:numPositionToChange];
    
    // получаем этот массив
    while ([pullIndex count] < numPositionToChange) {
        // генерим индекс
        int index = arc4random()%DNAcount;
        
        int collision = 0;
        
        // в случае первой интерации добавляем первый элемент массива
        if ([pullIndex count] == 0) {
            [pullIndex addObject:[NSNumber numberWithInteger:index]];
        } else{
            // проверяем на совпадение сгенерированного индекса с предидущими
            for (int i=0; i < [pullIndex count]; i++) {
                
                if ([pullIndex objectAtIndex:i] == [NSNumber numberWithInteger:index]) {
                    collision++;
                }
            }
            // в случае отсутствия коллизий, добавляем элемент в массив
            if (collision == 0){
                [pullIndex addObject:[NSNumber numberWithInteger:index]];
            }

        }
        
        
            
    }
    
    // используя полученный массив индексов заменяем соответвующие значения кислот на случайные другие 
    for (int i=0; i< [pullIndex count]; i++) {
        
        NSNumber *index = [pullIndex objectAtIndex:i];
        
        int collision = 0;
        
        while (collision == 0) {
            int indexAcids = arc4random()%4;

            // заменяем значение нуклеотида только после проверки на не совпадение его значения
            if ([[DNA objectAtIndex:i] isEqualToString:[acids objectAtIndex: indexAcids]]) {
//                NSLog(@"Collision");
            } else{
                [DNA removeObjectAtIndex:[index integerValue]];
                [DNA insertObject:[acids objectAtIndex:indexAcids] atIndex:[index integerValue]];
                collision++;
            }
            
            

        }
        
    }

}

@end


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Cell *cell1;
        Cell *cell2;
        
        cell1 = [[Cell alloc] initWhisLenghtDna: 100 ];
        cell2 = [[Cell alloc] initWhisLenghtDna: 100 ];
        
        int resultHD1 = [cell1 hammingDistance: cell2];
        
        NSLog(@"hamming distance before mutation - %d", resultHD1 );
        
        int mutate = 30;
        
        NSLog(@"mutate : %d persents", mutate);
        
        [cell1 mutate:mutate];
        [cell2 mutate:mutate];
        
        int resultHD2 = [cell1 hammingDistance: cell2];
        
        NSLog(@"hamming distance after mytation - %d", resultHD2 );
        
//        NSLog(@"%d", [cell1 lDNA]);
        
        
    }
    return 0;
}

