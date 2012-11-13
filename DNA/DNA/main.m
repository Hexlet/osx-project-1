//
//  main.m
//  DNA
//
//  Created by Антон Лебедев on 06.11.12.
//  Copyright (c) 2012 Антон Лебедев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entities/Cell.h"

@interface Cell (mutate)
-(void) mutate:(int)percentage;
@end

@implementation Cell (mutate)

-(void) mutate:(int)percentage {
    // создать массив индексов элементов, которые будут изменены в _DNA
    NSMutableArray *indexesToChange;
    indexesToChange = [[NSMutableArray alloc] init];
    
    // заполнить массив индексов элементов, которые будут изменены в _DNA
    for (int j = 0; j < percentage; j++)
    {
        // определяет, необходимо ли создать новый индекс,
        // который будет изменен в _DNA
        bool recreate = YES;
        
        while (recreate)
        {
            // создать новый индекс
            int currentIndex = arc4random()%100;
            
            // определить количество существующих элементов в массиве индексов
            int count = [indexesToChange count];
            
            // определить, существует ли индекс с номером currentIndex
            // в массиве индексов
            bool exists = NO;
            for (int i = 0; i < count; i++ )
            {
                // если существует, то выйти из цикла
                if ([[indexesToChange objectAtIndex:i] integerValue] == currentIndex)
                {
                    exists = YES;
                    break;
                }
            }
            
            // если индекс с номером currentIndex существует в массиве индексов
            // то создать новый индекс
            if (exists)
            {
                recreate = YES;
            }
            else
            {
                // если не существует, то добавить в массив индексов
                recreate = NO;
                NSNumber *adding = [NSNumber numberWithInt:currentIndex];
                [indexesToChange addObject: adding];
            }
        }
    }
    
    for (int i = 0; i < percentage; i++)
    {
        // задать строку из используемых в DNA символов
        NSString *template;
        template = [[NSString alloc] init];
        template = @"ATGC";
        
        // получить индекс элемента, значение которого будет изменено
        int currentIndex = [[indexesToChange objectAtIndex:i] integerValue];
        
        // получить элемент, значение которого будет изменено
        NSString *indexValue = (NSString *)[self.DNA objectAtIndex:currentIndex];
        
        NSString *mutateTo = (NSString *)[self.DNA objectAtIndex:currentIndex];

        // получить новое значение элемента
        while (mutateTo == indexValue)
        {
            int qwe = arc4random()%4;
            mutateTo = [template substringWithRange:NSMakeRange(qwe, 1)];
        }

        // заменить значение элемента
        [self.DNA replaceObjectAtIndex:currentIndex withObject: mutateTo];
    }
}

@end
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myCell, *myCell2;
        myCell = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        int difference = [myCell hammingDistance:myCell2];
        NSLog(@"hammingDistance before: %i", difference);
        
        int mutatingItemsCount = 10;
        [myCell mutate:mutatingItemsCount];
        NSLog(@"mutate items: %i", mutatingItemsCount);
        
        int difference2 = [myCell hammingDistance:myCell2];
        NSLog(@"hammingDistance after: %i", difference2);
    }
    
    return 0;
}

