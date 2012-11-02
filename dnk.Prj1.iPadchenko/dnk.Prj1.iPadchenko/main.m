//
//  main.m
//  DNK.Prj1.iPadchenko
//
//  Created by yury on 31.10.12.
//  Copyright (c) 2012 Yury Radchenko. All rights reserved.
//

#define oneDNAMutatorPercent 40 //процент мутации для первой ДНК
#define twoDNAMutatorPercent 70 //процент мутации для второй ДНК

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

- (void) mutate: (int) xPercentMutator;

@end

@implementation Cell (mutator)

- (void) mutate: (int) xPercentMutator {
    
    if (xPercentMutator > 100)
        
        NSLog(@"Некорректно введен процент мутации");
    
    else {
        
        int xCount = (int) dnaLenght * xPercentMutator / 100; //кол-во ячеек ДНК, подлежащих изменению
        
        NSString *newCell = [[NSString alloc] init]; //здесь будем хранить новое значение ячейки ДНК
        
        NSMutableArray *cellMutator = [NSMutableArray arrayWithCapacity:xCount]; //массив хранения номеров измененных ячеек ДНК
        
        int i = 0;
        
        do {
            int randomIndex = (int) (arc4random() % (dnaLenght));  //выбираем случайную ячейку ДНК
            
            //сравниваем выбранный номер с ранее выпадавшими и запомненными
            
            if (![cellMutator containsObject:[NSString stringWithFormat:@"%d", randomIndex]]) {//если совпадений нет
                
                //запоминаем выбор
                [cellMutator addObject:[NSString stringWithFormat:@"%d", randomIndex]];
                
                //меняем ячейку ДНК
                BOOL changeCellRun = YES;//метка о выходе из цикла по смене ячейки ДНК
                
                do {
                    newCell = [self randomCellValueATGC];
                                
                    if (![newCell isEqualToString:[self.DNA objectAtIndex:randomIndex]]) {//если ячейка меняется
                        [self.DNA replaceObjectAtIndex:randomIndex withObject:newCell]; //меняем ячейку ДНК
                        changeCellRun = NO;//метка о выходе
                    }

                } while (changeCellRun);
                
                                
                
                i++; //увеличиваем счетчик уже измененных ячеек ДНК
                
            }
            
        } while (i < xCount);
        
    }
    
}


@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *oneDNA = [[Cell alloc] init];
        Cell *twoDNA = [[Cell alloc] init];
        
//        [oneDNA print];//расскоментить чтобы выводился код ДНК
//        [twoDNA print];//расскоментить чтобы выводился код ДНК

        NSLog(@"Несовпадений до мутации = %d",[oneDNA hammingDistance:twoDNA]);
        
        [oneDNA mutate:oneDNAMutatorPercent];
        [twoDNA mutate:twoDNAMutatorPercent];
//        [oneDNA print];//расскоментить чтобы выводился код ДНК
//        [twoDNA print];//расскоментить чтобы выводился код ДНК
        
        NSLog(@"Несовпадений после мутации = %d",[oneDNA hammingDistance:twoDNA]);
        
    }
    return 0;
}

