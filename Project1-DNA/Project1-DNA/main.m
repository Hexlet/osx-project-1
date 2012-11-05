//
//  main.m
//  Project1-DNA
//
//  Created by Nick Wishnyakov on 05.11.12.
//  Copyright (c) 2012 Nick Wishnyakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void)mutate: (int)percent;

@end

@implementation Cell (mutator)

-(void)mutate: (int)percent
{
    //массив для хранения индексов уже измененных элементов
    NSMutableArray *mutateDNA = [NSMutableArray arrayWithCapacity:percent];
    //заменяем percent символов в массиве DNA
    for (int i = 0; i < percent; i++)
    {
        int index;  //индекс заменяемого элемента
        do
        {
            index = arc4random() % 100; //берем случайное число от 0 до 99
        }
        while ([mutateDNA containsObject: [NSString stringWithFormat:@"%i", index]]); //повторяем до тех пор, пока не появится случайное число не содержащиееся в массиве
        [mutateDNA addObject: [NSString stringWithFormat:@"%i", index]]; //добавляем инжекс в массив
        NSString *simbol = [NSString string];
        int rand_num;   //индекс символа в множестве
        //производим замену на другой символ, изменение символа на такй же не будет считаться заменой
        do
        {
            rand_num = arc4random() % [self.cellCollect count]; //случайный индекс
            simbol = [self.cellCollect objectAtIndex: rand_num]; //теперь у нас есть символ
        }
        while (simbol == [self.DNA objectAtIndex: index]); //повторяем до тех пор, пока символ не будет отличатся от уже стоящего на месте index
        [self.DNA replaceObjectAtIndex: index withObject: simbol]; // заменяем символ на месте index придуманым нами символом
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myCell = [[Cell alloc] init], *myCell2 = [[Cell alloc] init];
        
//        NSLog(@"%@",myCell.DNA);
//        NSLog(@"%@",myCell2.DNA);
        
        NSLog(@"%i",[myCell hammingDistance:myCell2]);
        
        [myCell mutate:10];
        [myCell2 mutate:42];
                
//        NSLog(@"%@",myCell.DNA);
//        NSLog(@"%@",myCell2.DNA);
        
        NSLog(@"%i",[myCell hammingDistance:myCell2]);
        
        
    }
    return 0;
}

