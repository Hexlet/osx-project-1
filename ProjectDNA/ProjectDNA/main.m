//
//  main.m
//  ProjectDNA
//
//  Created by Alexander Kipman on 04.11.12.
//  Copyright (c) 2012 Alexander Kipman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
- (void)mutate:(int)percent;
@end

@implementation Cell (Mutator)

//  Замена X процентов символов в массиве DNA в случайном порядке
- (void)mutate:(int)percent{
    NSMutableArray* uniqNumbers = [[NSMutableArray alloc] init];
    
    // заменять одну ячейку можно максимум один раз.
    while ([uniqNumbers count] < percent){
        int idx = arc4random() % 100; // случайное число
        
        if (![uniqNumbers containsObject:[NSNumber numberWithInteger:idx]]){  // если uniqNumbers содержит случайное число...
            [uniqNumbers addObject:[NSNumber numberWithInteger:idx]];         // добавить число в массив
            [DNA setObject:[self getRandomChar] atIndexedSubscript:idx];      // заменить значение ячейки в массиве DNA
        }
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        
        NSLog(@"First hammingDistance: %i", [cell1 hammingDistance:[cell2 getDNA]]);
        
        [cell1 mutate:50];
        [cell2 mutate:50];
        
        NSLog(@"Mutated hammingDistance: %i", [cell1 hammingDistance:[cell2 getDNA]]);
        
    }
    return 0;
}

