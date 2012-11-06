//
//  Cell.m
//  DNA
//
//  Created by Arthur Belous on 05.11.12.
//  Copyright (c) 2012 Arthur Belous. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init // Переопределяем метод init
{
    DNA = [[NSMutableArray alloc]init];
    NSString * letters = @"ATGC"; // Задаем строку символов
    self = [super init];
    if (self)
    {
		NSMutableString *randomLetter = [NSMutableString stringWithCapacity:1]; //  Случайно выбераем символ из строки
        for (int i=0; i<100; i++) // В цикле от 0 до 100 заполняем масив
        {
            [randomLetter appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
            [DNA insertObject:randomLetter atIndex:i];
            //NSLog(@"%@", [DNA objectAtIndex:i]);
            //NSLog(@"%d", [DNA count]);
        }
    }
             return self;
}

-(int) hammingDistance :(Cell*) newCell
{
    int distanceCount = 0;
    NSString * letters = @"ATGC"; 
    NSMutableArray * selfDNA = [[NSMutableArray alloc]init];
    NSMutableString *randomLetter = [NSMutableString stringWithCapacity:1]; //  Случайно выбераем символ из строки
    
    for (int i=0; i<100; i++) // В цикле от 0 до 100 заполняем масив
    {
        [randomLetter appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
        [selfDNA insertObject:randomLetter atIndex:i];
           NSLog(@"%ld", [selfDNA objectAtIndex:i]);
           NSLog(@"%d", [selfDNA count]);
    }
   
    //----  Compare Arrays
    
    for (int x = 0; x < 100; x++)
    {
        NSString * simbulFromSelfDNAArray = [selfDNA objectAtIndex:x];
        NSString * simbulFromDNAArray = [DNA objectAtIndex:x];
        
        BOOL check = [simbulFromSelfDNAArray isEqualToString: simbulFromDNAArray];
        
        if (check == NO)
        {
            distanceCount = distanceCount +1;
            NSLog(@"%i", distanceCount);
            
        }
        
    }
return 0;
}


@end
