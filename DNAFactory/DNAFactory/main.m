//
//  main.m
//  DNAFactory
//
//  Created by Ilya Rezyapkin on 01.11.12.
//  Copyright (c) 2012 Ilya Rezyapkin. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate: (int) percent;

@end

@implementation Cell (mutator)

-(void) mutate:(int)percent {
    for (int i = 0; i < MAX_NUCLEOTIDES; i++) {
        if (percent > arc4random() % 100) {
            self.DNA[i] = [Cell getRandomNucleotide];
        }
    }
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1, *cell2;
        
        // Инициализация двух цепочек
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        // Проверяем
        NSLog(@"%d",[cell1 hammingDistance:cell2]);
        
        // Мутируем
        [cell1 mutate:100];
        [cell2 mutate:100];
        
        // Снова проверяем
        NSLog(@"%d",[cell1 hammingDistance:cell2]);
        
    }
    return 0;
}

