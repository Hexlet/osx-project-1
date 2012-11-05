//
//  main.m
//  DNA
//
//  Created by Андрей on 03.11.12.
//  Copyright (c) 2012 MKM. All rights reserved.
//

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
    while (i < x) {
        int index = rand() % [arrayChar count];
        int index1 = rand() % 100;
        if (!testAr[index1]) {
            [DNA replaceObjectAtIndex:index1 withObject:[arrayChar objectAtIndex:index]];
            testAr[index1] = 1;
            ++i;
        }
    }
    
}

@end


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] initDNA];
        Cell *cell2 = [[Cell alloc] initDNA];
        
        
        NSLog(@"%i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutator:30];
        [cell2 mutator:30];
        
        NSLog(@"%i", [cell1 hammingDistance:cell2]);
       
        
    }

    return 0;
}

