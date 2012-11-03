//
//  main.m
//  03_dna
//
//  Created by Stas on 11/2/12.
//  Copyright (c) 2012 Stas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Evolution)                             // категория Cell (Evolution) 
-(void) mutate: (int) percent;                          // интерфейс метода категории
@end                                                    // конец интерфейса категории

@implementation Cell (Evolution)

-(void) mutate: (int) percent{                          // категория Cell (Evolution) 
    extern int const LENGTH_ARRAY;
    extern NSString const *ch[4];
    
// создание массива размером исходного (NSMutableArray *dna), из элементов Boolean,
// где столько значение TRUE, сколько процентов нужно изменить.
    Boolean mas [LENGTH_ARRAY];                         // создаем массив из логических эл-тов размером исходного массива
    int count = LENGTH_ARRAY;                           // вводим переменную-счетчик count, инициализировав ее размером массива
    while (count--)                                     // цикл перебора всех эл-тов массива
        if (count < percent)                            // если счетчик меньше процента
            mas [count] = 1;                            // заполняем единицей
            else                                        // иначе
                mas [count] = 0;                        // заполняем нулем
///////////////////////////////////////////////////////////////////////////////////
// перемешиваем массив логических эл-тов Boolean //////////////////////////////////
                count = LENGTH_ARRAY;                   // возвращаем переменной count значения количества эл-тов массива
                int temp_index;                         // вводим переменную-буфер для запоминания индекса изменяемого эл-та
    Boolean temp_value;                                 // вводим переменную-буфер для запоминания значения изменяемого эл-та
    while (count--){                                    // цикл перебора всех эл-тов массива
        temp_index = arc4random()%LENGTH_ARRAY;         // заполняем переменную-буфер индексом изменяемтого эл-та
        temp_value = mas [temp_index];                  // заполняем переменную-буфер изменяемым эл-том
        mas [temp_index] = mas [count];                 // меняем местами 1
        mas [count] = temp_value;                       // меняем местами 2
    }
///////////////////////////////////////////////////////////////////////////////////
// процесс мутации ////////////////////////////////////////////////////////////////
    count = LENGTH_ARRAY;                               // возвращаем переменной count значения количества эл-тов массива
    NSString *temp;                                     // вводим переменную-буфер для запоминания значения изменяемого эл-та (для проверки изменения)
    while (count--)                                     // цикл перебора всех эл-тов массива
        if (mas[count]){                                // изменяем только те эл-ты, для которых в mas[count] == TRUE
            temp = [dna objectAtIndex:count];           // заполняем переменную-буфер изменяемым эл-том
            while ([dna objectAtIndex:count] == temp)   // проверяем изменилось ли значение? повторяем до тех пор, пока не изменится
                [dna replaceObjectAtIndex:count withObject:ch[arc4random()%4]]; // метод изменения значения в массиве *dna
        }
///////////////////////////////////////////////////////////////////////////////////
}
// метод mutate закончен //////////////////////////////////////////////////////////
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *myCell1, *myCell2;
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        //[myCell1 print];
        //[myCell2 print];
        printf("hammingDistance = %d\n", [myCell1 hammingDistance:myCell2]);
        
        [myCell1 mutate:50];
        [myCell2 mutate:50];
        
        //[myCell1 print];
        //[myCell2 print];
        printf("hammingDistance = %d\n", [myCell1 hammingDistance:myCell2]);
    }
    return 0;
}
