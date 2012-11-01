//
//  main.m
//  DNAProject
//
//  Created by alex on 31/10/2012.
//  Copyright (c) 2012 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // то, что просили по заданию
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"hamming distance: %i", [cell1 hammingDistance:cell2]);
        [cell1 mutate:10];
        [cell2 mutate:10];
        NSLog(@"hamming distance after mutation: %i", [cell1 hammingDistance:cell2]);

        // тестируем правильность расчетов: берем два одинаковых и мутируем один на 10%
        /**
        Cell *cell3 = [Cell copyCell:cell1];
        NSLog(@"hamming distance: %i", [cell1 hammingDistance:cell3]);
        [cell1 mutate:10];
        NSLog(@"hamming distance after mutation: %i", [cell1 hammingDistance:cell3]);
        **/
    }
    return 0;
}

