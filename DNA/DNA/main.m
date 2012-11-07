//
//  main.m
//  DNA
//
//  Created by oleksandr sharov on 11/6/12.
//  Copyright (c) 2012 oleksandr sharov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutation)
-(void)mutateBy:(int)percentage;

@end

@implementation Cell (Mutation)

- (void)mutateBy:(int)percentage {
    //подготовка к мутации
    int percentInNumbers = [self.DNA count]/100*percentage;
    NSArray *codes = [[NSArray alloc]initWithObjects:@"A",@"T",@"G",@"C", nil];//похоже пора вынести из методов
    NSMutableArray *numbersUsedinRandomChange = [[NSMutableArray alloc]init];//сюда будем складывать индексы кодов, которые поменяли
    
    
    //мутируем и обеспечиваем рандомизацию
    //чтобы менять один код только один раз используем след алгоритм: случайное число проверяем
    //использовали ли мы его или нет. Если нет - то используем и складываем в спец. массив и тд
    for (int i=0; i < percentInNumbers; i++) {
        int random_num = arc4random()%[self.DNA count];
        NSNumber *random_numAsObject = [NSNumber numberWithInt:random_num];//превращаем число в обЪект
        
        if (![numbersUsedinRandomChange containsObject:random_numAsObject]) {
            [numbersUsedinRandomChange addObject:random_numAsObject];
            int random_num2 = arc4random()%4;
            [self.DNA replaceObjectAtIndex:random_num withObject:[codes objectAtIndex:random_num2]];
            
        }
    }
}


@end



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *aCell = [[Cell alloc] init];
        Cell *anotherCell = [[Cell alloc] init];
//       NSLog(@"%@",aCell.DNA);
        NSLog(@"%d",[aCell hammingDistance:anotherCell]);
        [aCell mutateBy:30];
        [anotherCell mutateBy:50];
//        NSLog(@"%@",aCell.DNA);
        
         NSLog(@"%d",[aCell hammingDistance:anotherCell]);
//        NSLog(@"%@",anotherCell.DNA);
//        NSLog(@"%@",aCell.DNA);
    }
    return 0;
}

