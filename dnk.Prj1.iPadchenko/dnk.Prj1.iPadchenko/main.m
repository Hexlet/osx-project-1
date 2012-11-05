//
//  main.m
//  DNK.Prj1.iPadchenko
//
//  Created by yury on 31.10.12.
//  Copyright (c) 2012 Yury Radchenko. All rights reserved.
//

#define oneDNAMutatorPercent 60 //процент мутации для первой ДНК
#define twoDNAMutatorPercent 80 //процент мутации для второй ДНК

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

- (void) mutate: (int) xPercentMutator;

@end

@implementation Cell (mutator)

- (void) mutate: (int) xPercentMutator {
    
    if (xPercentMutator >= 0 && xPercentMutator <= 100) {
    
        int xCount = (int) dnaLength * xPercentMutator / 100; //кол-во ячеек ДНК, подлежащих изменению
        
        NSString *newCell = [[NSString alloc] init]; //здесь будем хранить новое значение ячейки ДНК
        
        NSMutableSet *cellMutator = [[NSMutableSet alloc] init];//хранения номеров измененных ячеек ДНК
        //работа с NSMutableSet быстрей, чем с обычным массивом
        
        int i = 0;
        
        do {
            int randomIndex = (int) (arc4random() % (dnaLength));  //выбираем случайную ячейку ДНК
            
            //сравниваем выбранный номер с ранее выпадавшими и запомненными
            
            if (![cellMutator containsObject:[NSString stringWithFormat:@"%d", randomIndex]]) {//если совпадений нет
                
                //запоминаем выбор
                [cellMutator addObject:[NSString stringWithFormat:@"%d", randomIndex]];
                
                do {
                    newCell = [self randomCellValueATGC];
                    
                        //новое равно старому - продолжаем цикл
                } while ([newCell isEqualToString:[self.DNA objectAtIndex:randomIndex]]);
                
                [self.DNA replaceObjectAtIndex:randomIndex withObject:newCell]; //меняем ячейку ДНК
                
                i++; //увеличиваем счетчик уже измененных ячеек ДНК
                
            }
            
        } while (i < xCount);
        
    }
    
    else {
        
        NSLog(@"Ошибочное значение процента мутации = %d", xPercentMutator);
    
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *oneDNA = [[Cell alloc] init];
        Cell *twoDNA = [[Cell alloc] init];
        
        [oneDNA print];//расскоментить чтобы выводился код ДНК
        [twoDNA print];//расскоментить чтобы выводился код ДНК
        
        NSLog(@"Несовпадений до мутации = %d",[oneDNA hammingDistance:twoDNA]);
        
        [oneDNA mutate:oneDNAMutatorPercent];
        [twoDNA mutate:twoDNAMutatorPercent];

        [oneDNA print];//расскоментить чтобы выводился код ДНК
        [twoDNA print];//расскоментить чтобы выводился код ДНК
        
        NSLog(@"Несовпадений после мутации = %d",[oneDNA hammingDistance:twoDNA]);
        
    }
    return 0;
}
