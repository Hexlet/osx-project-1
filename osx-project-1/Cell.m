//
//  Cell.m
//  osx-project-1
//
//  Created by Sergey Chebotarev on 30.10.12.
//  Copyright (c) 2012 Sergey Chebotarev. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA, lengthDNA;

/*
    Инициализация
 */
-(id)init{
    self = [super init];
    if(self){
        lengthDNA = 100; // размер цепочки ДНК
        DNA = [NSMutableArray arrayWithCapacity:lengthDNA];
        for(int i = 0; i < lengthDNA ; i++){
            // Заполение массива случайными допустимыми занчениями
            [DNA addObject: [[self class] getRandomElement]];
        }
    }
    return self;
}

/*
    Вычислить рассояние между цепочками
 */
-(int)hammingDistance:(Cell*)otherCell{
    int distance = 0;
    for (int i = 0; i < lengthDNA ; i++) {
        if([[DNA objectAtIndex:i] isNotEqualTo:[otherCell.DNA objectAtIndex:i]]){
            distance++;
        }
    }
    return distance;
}

/*
    Получить случайный элемент
*/
+(NSString*)getRandomElement{
    static NSArray* validChar;
// Инициализация массива допустимых значений
    if (!validChar){
        validChar = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    }
// Выбор случайного значения
    return [validChar objectAtIndex: arc4random() % [validChar count]];
}
@end


@implementation Cell (Mutator)

/*
    Выполнить мутацию
*/
-(void)mutate:(int)persent{

    bool updateArray[lengthDNA];
    int updateCount = 0;
// Инициализация массива для отметок замен
    for (int j = 0; j < lengthDNA ; j++)
        updateArray[j] = NO;
// Количество необходимых замен в штуках (округлим как математики)
    updateCount = (int)round((lengthDNA  * persent) / 100.0);
// Проверка введенного значения процента замен
    if(updateCount < 0 || updateCount > lengthDNA ){
        NSLog(@"Value %i - incorrectly", persent);
    }
    else{
// Замена
        int i = 0;
        int rnd = 0;
        NSString* tempStr = nil;
        while(i < updateCount){
            rnd = arc4random() % lengthDNA ;
            if(updateArray[rnd] == NO){
                // Новая замена на символ отличный от предыдущего
                tempStr = [DNA objectAtIndex:rnd];
                while(YES){
                [DNA setObject:[[self class] getRandomElement] atIndexedSubscript:rnd];
                    if([tempStr isNotEqualTo:[DNA objectAtIndex:rnd]])
                        break; // Заменили 
                }
                // Отмечаем эллемент как замененный
                updateArray[rnd] = YES;
                i++;
                    
            }
            else{
                // Уже заменяли. Следующая попытка
                continue;
            }
        }
    }

}

@end
