//
//  main.m
//  Cell
//
//  Created by padawan on 31.10.12.
//  Copyright (c) 2012 padawan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // Левая клетка
        Cell *leftCell = [[Cell alloc] init];
        [leftCell print];
        
        // Правая клетка
        Cell *rightCell = [[Cell alloc] init];
        [rightCell print];
        
        // Сравниваем
        [leftCell hammingDistance:rightCell];
        
        // Мутируется левая клетка
        [leftCell mutate:10];
        
        // Мутируется правая клетка
        [leftCell mutate:50];
        
        // Сравниваем
        [leftCell hammingDistance:rightCell];
    }
    return 0;
}

