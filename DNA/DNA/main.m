//
//  main.m
//  DNA
//
//  Created by Администратор on 10/31/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
    -(void)mutate: (int) x;
@end

@implementation Cell (Mutator)
-(void)mutate: (int) x {
    // начальные проверки для входных данных
    if (x > 100) x = 100;
    if (x < 0) NSLog(@"Inccorect percent for mutation");
    else { // процесс мутации
        int count = DNA_CAPACITY * x / 100; // высчитываем количество клеток для мутации в общем случае (когда DNA_CAPACITY != 100)
        //NSLog(@"%d",count);
        
        // выбираем случайно Х клеток, заменяем их значение на "М"
        for (int i = 0; i < count; i++)
        {
            int shot = arc4random() % DNA_CAPACITY;
            while ([self.DNA objectAtIndex: shot] == @"M") { // если "попали" в уже мутирующий элемент клетки, то перевыбираем
                shot = arc4random() % DNA_CAPACITY;
            }
            [self.DNA setObject:@"M" atIndexedSubscript: shot];
        }
        // мутируем все клетки с "M"
        NSString *letter;
        for (int i = 0; i < DNA_CAPACITY; i++)
            if ([self.DNA objectAtIndex: i] == @"M")
            {
                letter = [LETTERS substringWithRange: NSMakeRange(arc4random() % LETTERS.length, 1)];
                [self.DNA setObject: letter atIndexedSubscript: i];
            }
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *c1, *c2;
        
        c1 = [[Cell alloc] init];
        c2 = [[Cell alloc] init];
               
        //[c1 print];
        //[c2 print];
        
        NSLog(@"Hamming distance before mutation: %d",[c1 hammingDistance: c2]);
        
        [c1 mutate: 30];
        [c2 mutate: 50];
        
        NSLog(@"Hamming distance afther mutation: %d",[c1 hammingDistance: c2]);
    }
    return 0;
}

