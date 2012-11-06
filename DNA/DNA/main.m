//
//  main.m
//  DNA
//
//  Created by Андрей on 03.11.12.
//  Copyright (c) 2012 MKM. All rights reserved.
//

// переменная для проверки введеного пользователем значения
int test = 1;

// интерфейс класса Cell
@interface Cell : NSObject
{
    NSMutableArray *DNA;
}
// метод установки массива DNA
-(void) setDNA;
// возврат значения массива DNA
-(NSMutableArray*) DNA;
// инициализация массива DNA
-(id) initDNA;
// метод сравнения двух массивов
-(int) hammingDistance: (Cell *) cl;
// печать массива
-(void) print;

@end


// интерфейс категории munator
@interface Cell (mutator)
-(void) mutator: (int) percent;
@end


// реализация класса Cell
@implementation Cell

// заполнение массива DNA объектами: A, T, G, C в случайном порядке
-(void) setDNA
{
    DNA = [[NSMutableArray alloc] init];
    NSArray *arrayChar = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C",  nil];
    int index;
    for (int i = 0; i < 100; ++i) {
        
        index = rand() % [arrayChar count];
        [DNA addObject:[arrayChar objectAtIndex:index]];
    }
}

// инициализация объекта Cell
-(id) initDNA
{
    self = [super init];
    if (self) {
        [self setDNA];
    }
    return self;
}

// метод возврата массива
-(NSMutableArray*) DNA
{
    return DNA;
}


// метод сравнения двух массивов (ДНК)
-(int) hammingDistance:(Cell *)cl
{
    int ham_dist = 0;
    for (int i = 0; i < 100; ++i) {
        if ([[cl DNA] objectAtIndex:i] != [DNA objectAtIndex:i]) {
            ++ham_dist;
        }
    }
    return ham_dist;
}

// печать массива
-(void) print
{
    NSLog(@"%@", DNA);
}
@end


// реализация категории класса Cell
@implementation Cell (mutator)

// реализация метода замены 
-(void) mutator:(int)x
{
    // объявление массива для контроля использаванных индексов
    int testAr[100];
    for (int v = 0; v < 100; ++v) {
        testAr[v] = 0;
    }
    
    NSArray *arrayChar = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C",  nil];
    int i = 0;
    // проверка введеного пользовательм кол-ва процентов (диапазон 0-100)
    if (x >= 0 && x <= 100) {
        while (i < x) {
            
            int index = rand() % [arrayChar count];
            int index1 = rand() % 100;
            if (!testAr[index1]) {
                [DNA replaceObjectAtIndex:index1 withObject:[arrayChar objectAtIndex:index]];
                testAr[index1] = 1;
                ++i;
            }
        }
        test = 1;
        
    }
    // если пользователь ввел не корректное число, выводим соответствующее сообщение
    // и глобальной переменной test присваиваем - 0 для дальнейшей проверки в main
    else{
        NSLog(@"Проценты должны находится в диапазоне 0-100");
        test = 0;
    }
}

@end


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] initDNA];
        Cell *cell2 = [[Cell alloc] initDNA];
        
        NSLog(@"Hamming distance между ДНК");
        NSLog(@"%i", [cell1 hammingDistance:cell2]);
        
        int x = 1;
        
        // цикл для введения кол-ва процентов для мутации 
        while (x) {
            NSLog(@"Введите кол-во процентов для мутации ДНК (в диапазоне 0-100)");
            
            int m;
            scanf("%i", &m);
            
            [cell1 mutator:m];
            
            // если пользователь ввел число не из диапазона 0-100,
            // то мутация второго cell не происходит и не расчитывается hamming distance
            // до тех пор пока не введет значение из необходимого диапазона
            if (test){
                [cell2 mutator:m];
                NSLog(@"hamming distance между ДНК после мутации");
                NSLog(@"% i", [cell1 hammingDistance:cell2]);
                
                x = 0;            
            }
        }
    }

    return 0;
}

