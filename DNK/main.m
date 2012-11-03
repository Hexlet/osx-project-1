//
//  main.m
//  DNK
//
//  Created by sidney on 01.11.12.
//  Copyright (c) 2012 sidney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"



@interface Cell (Mutator) //категория мутации
-(void)mutate: (int) percent;
@end

@implementation Cell (Mutator)
-(void)mutate: (int) percent{ 
    if (percent >= 0 && percent <= 100) { // албсолютный процент не считается, потому что массив всего из 100 значений, иначе нужно высчитывать из не целых значений
        NSMutableArray *alreadyMutated = [[NSMutableArray alloc] init]; //массив, который будет запоминать позиции мутации
        while ([alreadyMutated count] < percent) {
            int rand = arc4random()%[self.DNA count]; // выбор рандомной позиции для мутации
            NSString *newChar = [self genCharSet]; // генерация символа для мутации
            if ([alreadyMutated containsObject:[NSNumber numberWithInt:rand]]) {
                continue;// символ на этой позиции уже мутировал
            }
            else {
                if ([self.DNA objectAtIndex:rand] == newChar) {
                    continue; // сгенерированный символ для мутации такой же, нечего мутировать
                }
                else {
                [alreadyMutated addObject:[NSNumber numberWithInt:rand]]; // запоминаем позицию
                [self.DNA replaceObjectAtIndex:rand withObject:newChar]; //мутация
                }
            }
        }
    }
    else {
        NSLog(@"Wrong percent value");
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *one = [[Cell alloc] init];
        Cell *two = [[Cell alloc] init];
                
        NSLog(@"Дистанция между двумя ДНК = %i", [one hammingDistance:two]);
        
        [one mutate:20];
        [two mutate:30];
       
        NSLog(@"Теперь дистанция между ДНК после мутации = %i", [one hammingDistance:two]);
        
        
        
    }
    return 0;
}

