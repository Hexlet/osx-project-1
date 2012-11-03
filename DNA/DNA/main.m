//
//  main.m
//  DNA
//
//  Created by Pavel Krishtalskiy on 03.11.12.
//  Copyright (c) 2012 Pavel Krishtalskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate: (int)nucleotids;
@end

@implementation Cell (mutat2or)
-(void) mutate: (int)nucleotids{
    if(nucleotids >100) {
//      Если на вход пришло значение больше, чем 100%, то примем, что заменить необходимо все нуклеотиды
        nucleotids = 100;
    }
    if (nucleotids <= 0)
    {
//      Если указано значение ноль или меньше, то заменять ничего не нужно. Завершаем мутацию без изменений в клетке
        return;
    }
    
//  Определяем целое количество нуклеотидов, которые необходимо заменить
    int nucleotidsCount = ([self cellLength] * nucleotids) / 100;
    NSLog(@"Nucleotids to be mutated: %i.", nucleotidsCount);

    int k;
    NSNumber *position;
    NSString *newNucleotid;
    NSMutableArray *mutableNucleotids = [NSMutableArray arrayWithCapacity:nucleotidsCount], *newDNA = [NSMutableArray arrayWithArray:[self DNA]];
//  Из интервала [0; cellLength - 1] выбираем nucleotidsCount целых чисел, которые будут обозначать позиции нуклеотидов, которые необходимо мутировать
    for (int j = 0; j < nucleotidsCount;)
    {
//      Произвольно выбираем номер позиции в интервале от ноля до «cellLength - 1»
        k = arc4random() % [self cellLength];
        position = [NSNumber numberWithInt:k];
//      Если такого значениея в массиве еще нет, то
        if(![mutableNucleotids containsObject:position])
        {
//          добавляем это значение в массив, чтобы более не повторяться
            [mutableNucleotids addObject:position];
//          и мутируем соответствующий нуклеотид
            switch (arc4random() % 4) {
                case 0:
                    newNucleotid = @"A";
                    break;
                    
                case 1:
                    newNucleotid = @"T";
                    break;
                    
                case 2:
                    newNucleotid = @"G";
                    break;
                    
                default:
                    newNucleotid = @"C";
                    break;
            }
            [newDNA replaceObjectAtIndex:k withObject:newNucleotid];
            j++;
        }
    }
    
//  Заменяем старый ДНК на новый
    [self setDNA:newDNA];
    
//    NSLog(@"%@", mutableNucleotids);
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        int i;
        
//        [cell1 printDNA];
//        [cell2 printDNA];
        
        i = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance before mutation is %i.", i);
        
        [cell1 mutate:60];
        [cell2 mutate:26];
        
//        [cell1 printDNA];
//        [cell2 printDNA];
        
        i = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance after mutation is %i.", i);
        
    }
    return 0;
}

