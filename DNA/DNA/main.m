//
//  main.m
//  DNA
//
//  Created by oleksandr sharov on 11/6/12.
//  Copyright (c) 2012 oleksandr sharov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

// This category enhances NSMutableArray by providing
// methods to randomly shuffle the elements.
@interface NSMutableArray (Shuffling)
- (void)shuffle;
@end

@implementation NSMutableArray (Shuffling)

- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}
@end    

@interface Cell (Mutation)
-(void)mutateBy:(int)percentage;

@end

@implementation Cell (Mutation)

- (void)mutateBy:(int)percentage {
    
    //чтобы менять одну букву только один раз - используем след алгоритм:
    // Создаем корзину с номерками.
    // Перемешиваем номерки в корзине
    // берем первый номерок из корзины и смотрим какое число на нем написано
    // Нуклеоид под этим номером и меняем в клетке
    // Убираем номерок из корзины, чтоб боле не попадался
    
    //подготовка к мутации
    int percentInNumbers = [self.DNA count]/100*percentage;
    NSMutableArray *basketWithNumbers = [[NSMutableArray alloc]initWithCapacity:[self.DNA count]];//корзина
    //кладем номерки в корзину
    for (int i=0; i<[self.DNA count]; i++) {
        NSNumber *iAsAnObject = [NSNumber numberWithInt:i];//превращаем число в обЪект
        [basketWithNumbers addObject:iAsAnObject];
    }
    
    //мутируем
    for (int i=0; i < percentInNumbers; i++) {
        [basketWithNumbers shuffle];//перемешиваем
        NSInteger index = [[basketWithNumbers objectAtIndex:0]integerValue];//смотрим че попалось
//        NSLog(@"номерок %d",index);
        int random_num = arc4random()%[self.DNA count];//определяем порядк. номер буквы на которую будем менять
        [self.DNA replaceObjectAtIndex:index withObject:[self.DNA objectAtIndex:random_num]];//меняем
        [basketWithNumbers removeObjectAtIndex:0];//Убираем номерок из корзины
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
        [aCell mutateBy:99];
        [anotherCell mutateBy:99];
//        NSLog(@"%@",aCell.DNA);
        
         NSLog(@"%d",[aCell hammingDistance:anotherCell]);
//        NSLog(@"%@",anotherCell.DNA);
//        NSLog(@"%@",aCell.DNA);
    }
    return 0;
}

