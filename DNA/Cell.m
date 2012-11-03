//
//  Cell.m
//  DNA
//
//  Created by Vadim Iskuchekov on 02.11.12.
//  Copyright (c) 2012 Egregors. All rights reserved.
//

#import "Cell.h"
#import "stdlib.h"  // arc4random

@implementation Cell

- (id)init {
    
    if (self = [super init]) {
        
        Nucleotides = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];  
        
        DNA = [[NSMutableArray alloc] init];
        
        for (unsigned int i = 0; i < 100; i++) {
            
            [DNA addObject:[Nucleotides objectAtIndex:arc4random()%4]];
            
        }
        
    }
    return self;
}

-(int)hammingDistance:(Cell *)inCell {
    
    unsigned int distCount = 0;
    
    for (unsigned int i = 0; i < 100; i++) {
        
        if ([DNA objectAtIndex:i] != [inCell->DNA objectAtIndex:i]) {
            distCount++;
        }
    }
    return distCount;
}

@end

@implementation Cell (mutator)

- (void)mutate:(int)x {
    
    if ((x > 0) && (x <= 100)) {    
        
        NSMutableArray *modifedNucleotides = [[NSMutableArray alloc] init]; // массив с индексами уже измененных нуклеотидов
        
        bool mutated = NO; // y - мутация произведена, n — мутация не произведена
        
        int index; // интекс изменяемого объекта
        
        
        for (unsigned int i = 1; i <= x; i++) {
            
            while (!mutated) { // пока мутация не произошла
                
                mutated = NO;
                index = arc4random()%x + 1; // выбираем случайный элемент в массиве
                
                if (![modifedNucleotides containsObject: [NSString stringWithFormat:@"%d", index]]) {  // если выбранный элемент еще не мутировал, то
                    
                    [modifedNucleotides addObject:[NSString stringWithFormat:@"%d", index]];  // запоминаем индекс уже мутировавшего элемента, что бы не мутировать его еще раз
                    
                    [DNA insertObject:[Nucleotides objectAtIndex:arc4random()%4] atIndex:index]; // мутируем элемент
                    
                    mutated = YES; 
                } // если выбранный элемент уже мутировал, генерируем следущих случайный индекс
            }
        }
    } else NSLog(@"Значение х должно быть в пределах интервала (0..100)");
}

@end
