//
//  main.m
//  DNA
//
//  Created by A ... on 11/6/12.
//  Copyright (c) 2012 check-engine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutator)

-(void) mutate:(int)x;  // мутация х (процентов) ячеек из 100
-(void) mutateAll;      // мутация всех ячеек
-(NSString*) mutateCode:(NSString*)n; // мутация одного значения (кода ячейки)

@end


@implementation Cell (Mutator)

-(void) mutate:(int)x {
    Cell *old = [[Cell alloc] init:self];   // копия текущего массива для поиска еще не мутировавших ячеек
    int mutCounter = 0; // количество совершенных мутаций
    int mutIndex;       // индекс ячейки текущей мутации
    while (mutCounter < x) {
        mutIndex = random() % (100 - mutCounter);  // случайный выбор индекса
        while ([old getDNACodeAtIndex:mutIndex] != [self getDNACodeAtIndex:mutIndex]) {
            // если по выбранному индексу мутация уже сделана, выбор следующего по порядку
            // индекса, по которому мутаций еще не было
            // по достижении конца списка возврат к начальному индексу
            if (mutIndex == 99) {
                mutIndex = 0;
            } else {
                mutIndex++;
            }
        }
        // мутация найденного индекса и увеличение счетчика мутаций
        [self setDNACode:[self mutateCode:[self getDNACodeAtIndex:mutIndex]] AtIndex:mutIndex];
        mutCounter++;
    }
}

-(void) mutateAll {
    for (int i = 0; i < 100; i++) {
        [self setDNACode:[self mutateCode:[self getDNACodeAtIndex:i]] AtIndex:i];
    }
}

-(NSString*) mutateCode:(NSString *)n {
    int newCode = random() % 3;
    if (n == [Cell getDNACodeByNumber:newCode]) {
        newCode++;
    }
    return [Cell getDNACodeByNumber:newCode];
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        srandom((int) time(NULL));
        NSLog(@"DNA");
        Cell *myCellA = [[Cell alloc] init];
        Cell *myCellB = [[Cell alloc] init];
        NSLog(@"Cell A");
        [myCellA print];
        NSLog(@"Cell B");
        [myCellB print];
        NSLog(@"A-B hamming distance: %i",[myCellA hammingDistance:myCellB]);
        [myCellA mutate:20];
        [myCellB mutate:20];
        NSLog(@"Cell A 20%% mutated");
        [myCellA print];
        NSLog(@"Cell B 20%% mutated");
        [myCellB print];
        NSLog(@"A-B hamming distance after 20%% mutation: %i",[myCellA hammingDistance:myCellB]);
    }
    return 0;
}

