//
//  main.m
//  Progect1-DNK
//
//  Created by omoroot on 06.11.12.
//  Copyright (c) 2012 omoroot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)

- (void) mutate:(int) k;

@end

@implementation Cell (Mutator)

- (void) mutate:(int) k {
    
    /* процент замен не может быть больше 100 */
    if (k<=100){
        
        /* Вычисляем индексы, которые будем менять */
        int position; // тестовая позиция
        int isReplace; // признак, что позиция уже должна быть изменена
        
        NSMutableArray *randomPosition = [NSMutableArray arrayWithCapacity:k]; // эти ячейки ДНК будут перегенерированы
        NSArray *DNKLetter = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil] ;
        
        for (int i=0; i<k; ){
            
            position = arc4random()%100 ; // 100 элементов в массиве ДНК
            isReplace = 0;
            
            for ( NSString *pos in randomPosition)
                if (pos == [NSString stringWithFormat:@"%d", position])
                    isReplace = 1;
            
            if (!isReplace)
                [randomPosition insertObject:[NSString stringWithFormat:@"%d", position] atIndex:i++] ;
            
            
            
        }
        
        // мутируем
        
        NSString *newGEN = [[NSString alloc] init];
        
        for(NSUInteger i=0; i<k;){
            
            newGEN = [DNKLetter objectAtIndex:arc4random()%4];
            
            
            if (![newGEN isEqualToString:[self.DNA objectAtIndex:[[randomPosition objectAtIndex:i] integerValue]]]) { // Нельзя мутировать в тот же ген
                [self.DNA replaceObjectAtIndex:[[randomPosition objectAtIndex:i] integerValue] withObject:[NSString stringWithFormat:@"%@", [DNKLetter objectAtIndex:arc4random()%4]]];
                i++;
                
            }
            
            
        }
        
        
    }
    
    
    
}


@end


int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        Cell *oneCell, *twoCell;
        
        oneCell = [[Cell alloc] init];
        twoCell = [[Cell alloc] init];
        
        [oneCell hammingDistance:twoCell] ;
        
        [oneCell mutate:10];
        [twoCell mutate:10];
        
        [oneCell hammingDistance:twoCell] ;
        
        
    }
    return 0;
}

