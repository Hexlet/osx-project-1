//
//  Cell+mutator.m
//  DNA
//
//  Created by Александр Борунов on 02.11.12.
//  Copyright (c) 2012 Александр Борунов. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void) mutate: (int) percentageMutations {
    if (percentageMutations > 100) percentageMutations=100; // что бы все работало
    if (percentageMutations < 0) percentageMutations=0;     // на всякий случай
    
    // поймем для начала сколько именно мутаций в штуках надо произвести
    int mutations = percentageMutations * CHAIN_LENGTH / 100 ;
    
    int flag[CHAIN_LENGTH]; for (int i=0; i<CHAIN_LENGTH; i++) flag[i]=0; // на всякий случай
    
    // теперь определимся какие именно по счету протеины будут мутировать
    while (mutations) {
        int n = (int)arc4random()%CHAIN_LENGTH; // взяли случайное число в диапазоне 0..CHAIN_LENGTH
        if (!flag[n]){                      // и если там уже не запланирована мутация
            flag[n]=1;                      // планируем ее
            mutations--;                    // уменьшая количество оставшихся мутаций
        }
    }
    
    // теперь осуществим запланированные мутации
    for (int i=0; i<CHAIN_LENGTH; i++)
        if (flag[i]) [[chain objectAtIndex:i] setRand]; // если белок помечен для мутации вызываем setRand
    
}
@end
