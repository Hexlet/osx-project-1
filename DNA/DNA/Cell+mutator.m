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
    int mutations = percentageMutations * CHAIN_LENGTH / 100 ; //  NSLog(@"мутаций будет %i", mutations);
    
    // мутации будем планировать следуюшим образом: создадим массив flag где будем
    // метить те белки которые потом замутируем. сначала массив заполним единицами
    // в количестве запланированных мутаций, а потом этот массив перемешаем как
    // завещал товарищ Кнут в своей второй книге
    
    int flag[CHAIN_LENGTH];
    int *p = flag;
    for (int i=0; i<mutations; i++) *p++=1;             // эти мутируют
    for (int i=mutations; i<CHAIN_LENGTH; i++) *p++=0;  // а эти сохранятся
    
    
/* отладочное
    {
        NSMutableString *result = [NSMutableString string]; // создадим строку куда будем копировать посимвольно
        for (int i=0; i < CHAIN_LENGTH; i++){
            [result appendFormat:@"%i", flag[i]];          // и добавили к строке
        }
        NSLog(@"флаги до замеса %@",result);
    }
*/    
    // теперь перемешаем массив flag
    for (int i=CHAIN_LENGTH-1; i>0; i--) {
        int j = (unsigned int)arc4random()%i; // это тот индекс с которым будем менять i-й элемент
        int temp = flag[i];             // сохраним
        flag[i] = flag[j];              // и
        flag[j] = temp;                 // поменяем местами
    }
    
/* отладочное
    {
        NSMutableString *result = [NSMutableString string]; // создадим строку куда будем копировать посимвольно
        for (int i=0; i < CHAIN_LENGTH; i++){
            [result appendFormat:@"%i", flag[i]];          // и добавили к строке
        }
        NSLog(@"флаги после замеса %@",result);
    }
*/    
    
    // теперь осуществим запланированные мутации
    for (int i=0; i<CHAIN_LENGTH; i++)
        if (flag[i]) [[chain objectAtIndex:i] changeRand]; // если белок помечен для мутации вызываем changeRand
    
}
/*  это старый способ мутировать... просто корпорация Umbrella какая-то
 
- (void) mutate: (int) percentageMutations {
    if (percentageMutations > 100) percentageMutations=100; // что бы все работало
    if (percentageMutations < 0) percentageMutations=0;     // на всякий случай
    
    // поймем для начала сколько именно мутаций в штуках надо произвести
    int mutations = percentageMutations * CHAIN_LENGTH / 100 ; NSLog(@"мутаций будет %i", mutations);
    
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
        if (flag[i]) [[chain objectAtIndex:i] changeRand]; // если белок помечен для мутации вызываем changeRand
    
}
*/


@end
