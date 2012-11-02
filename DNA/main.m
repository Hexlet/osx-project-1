//
//  main.m
//  DNA
//
//  Created by Rustem Sayargaliev on 10/30/12.
//  Copyright (c) 2012 sensation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
    -(void)mutate:(int)m;
@end

@implementation Cell (mutator)  //имплементация категории mutator

-(void)mutate: (int)m {
    int numberDNAToChange = (int)[self.DNA count] / 100 * m ;    //получив процент, определяем количество символов на замену
    int mutatedNumber = 0;
    NSMutableArray *mutatedElements = [[NSMutableArray alloc] init];    //создаем массив с номерами уже мутированных элементов...
    while (mutatedNumber != numberDNAToChange) {                        //...для того чтобы избежать их повторной мутации
        int randomElement = arc4random() % [self.DNA count];
        if (![mutatedElements containsObject:[NSNumber numberWithInt:randomElement]]) {
            switch (arc4random() % 4) {
                    case 0:
                    if (self.DNA[randomElement] != @"A") {
                        self.DNA[randomElement] = @"A";
                        [mutatedElements addObject:[NSNumber numberWithInt:randomElement]];     //если заменили элемент, добавляем его в массив мутировавших
                        mutatedNumber++;
                    }
                    break;
                    case 1:
                    if (self.DNA[randomElement] != @"T") {
                        self.DNA[randomElement] = @"T";
                        [mutatedElements addObject:[NSNumber numberWithInt:randomElement]];    
                        mutatedNumber++;
                    }
                    break;
                    case 2:
                    if (self.DNA[randomElement] != @"G") {
                        self.DNA[randomElement] = @"G";
                        [mutatedElements addObject:[NSNumber numberWithInt:randomElement]];
                        mutatedNumber++;
                    }
                    break;
                    case 3:
                    if (self.DNA[randomElement] != @"C") {
                        self.DNA[randomElement] = @"C";
                        [mutatedElements addObject:[NSNumber numberWithInt:randomElement]];    
                        mutatedNumber++;
                    }
                    break;
                    default:
                    break;
            }
        }
    }
    
}

@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *myCell = [[Cell alloc] init];
        Cell *myCell2 = [[Cell alloc] init];
        NSLog(@"Hamming distance is %i.\n", [myCell hammingDistance:myCell2]);
        [myCell mutate:50];
        [myCell2 mutate:75];
        NSLog(@"Hamming distance after mutation is %i.\n", [myCell hammingDistance:myCell2]);
    }
    return 0;
}

