//
//  main.m
//  osx-project-1
//
//  Created by Vadim on 03.11.12.
//  Copyright (c) 2012 Vadim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
    -(void) mutate:(int) per;
@end

@implementation Cell (mutator)
    -(void) mutate:(int) percent {
        // кол-во необходимых изменений
        int count = round([[self DNA] count] * percent / 100);

        NSMutableArray *IndexArray;
        IndexArray = [NSMutableArray array];

        int i=1;
        while (i<=count)
        {
            // индекс массива -- генерим случайное число от 0 до 99
            srandom((unsigned)(mach_absolute_time() & 0xFFFFFFFF));
            int randomInt = random() % 99;
            
            // массив индексов которые будем заменять
            NSNumber *number = [NSNumber numberWithInt:randomInt];
            
            int f=0;
            int j;
            if ([IndexArray count] != 0)
            {
                for (j=0;j<=[IndexArray count]-1;j++) {
                    //
                    if (randomInt == [[IndexArray objectAtIndex:j] intValue]) {
                        // найден такой же, устанавливаем флаг
                        f=1;
                        break;
                    }
                }
            }
            
            if (f == 0) {
                [IndexArray addObject:number];
                i++;
            }
        }

        // Замена
        i=0;
        while (i<=count-1)
        {
            NSNumber *Char = [NSNumber numberWithChar: [self randomChar]];
                        
            if ([self.DNA objectAtIndex:[[IndexArray objectAtIndex:i] intValue]] != Char )
            {
                [self.DNA replaceObjectAtIndex:[[IndexArray objectAtIndex:i] intValue] withObject:Char];
                i++;
            }
        }
    }
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // первый объект
        Cell *myCell;
        myCell = [[Cell alloc] init];
        
        // второй объект
        Cell *myCell2;
        myCell2 = [[Cell alloc] init];
        
        // вывод hamming distance
        NSLog(@"hamming distance = %d",[myCell hammingDistance:myCell2]);

        // мутируем на 20 процентов
        [myCell mutate:20];
        [myCell2 mutate:20];
        
        // вывод hamming distance
        NSLog(@"hamming distance = %d",[myCell hammingDistance:myCell2]);
        //[myCell print];
        //[myCell2 print];
    }
    return 0;
}

