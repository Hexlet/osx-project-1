//
//  main.m
//  dna
//
//  Created by Ilya Batozskiy on 31.10.12.
//  Copyright (c) 2012 Ilya Batozskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate:(int)X;
@end
@implementation Cell(mutator)

-(void) mutate:(int)X{
    int amino;
    int RandomNumber;
    int oldamino;
    
    float percent = (float)X/100;                                           //Вычисляю какое количетсво аминокислот
    int percentFromDNAamount = (int)round((float)self.DNAamount*percent);   // соответствуют данным процентам
    
    int aminoCount = (int)[self.DNAtypes count]; // количество различных типов аминокислот из которых мы выбираем 1
    
    long numberOfAminoToChange;
    
    NSMutableArray *numbers = [[NSMutableArray alloc] initWithCapacity:100];
    for (int i=0; i<self.DNAamount; i++) { //инициализирую массив номеров от 0 до 99
        [numbers    addObject:[NSNumber numberWithInt:i]];
    }
    
    for (int i=0; i<percentFromDNAamount; i++) {
        RandomNumber = arc4random()%(self.DNAamount-i); //выбираем случайной элемент из массива с номерами
        numberOfAminoToChange = [[numbers objectAtIndex:RandomNumber] integerValue];//из массива с номерами получаем номер ячейки в ДНК, которую будем менять
        
        for (int a=0; a<4; a++) {
            if ([[self.DNA objectAtIndex:numberOfAminoToChange] isEqual:[self.DNAtypes objectAtIndex:a]] ) {oldamino=a;break;}//выясняю какая аминокислота была в этой ячейке
        }
        
        amino = (arc4random()%(aminoCount-1)+oldamino+1)%aminoCount; // случайным образом выбираю новую, но так, чтоб не совпала со старой
        
        [self.DNA replaceObjectAtIndex:numberOfAminoToChange withObject:[self.DNAtypes objectAtIndex:amino]]; //заменяю значение ячейки в ДНК
         
        [numbers removeObjectAtIndex:RandomNumber]; //убираем использованный номер ячейки, чтобы не было повторений
        
    }
    
}

@end

int main(int argc, const char * argv[])
{
    
        @autoreleasepool {
            
                Cell *cell, *cell1;
                cell=[[Cell alloc]init];
                cell1=[[Cell alloc]init];
                NSLog(@"%i",[cell hammingDistance:cell1]);
                [cell1 mutate:10];
                [cell mutate:55];
                NSLog(@"%i",[cell hammingDistance:cell1]);
            }
        return 0;
    }


