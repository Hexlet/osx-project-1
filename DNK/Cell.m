//
//  Cell.m
//  DNK
//
//  Created by someone on 11/1/12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "Cell.h"

@implementation Cell : NSObject

-(id) init {
    
    // Увы, магические числа
    DNALength = 100;
    aphabet = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C",nil];
    
    // Чтобы каждый раз не считать
    alphabetLength = [aphabet count];
    
    self = [super init];
    
    if (self) {
        self.DNA = [[NSMutableArray alloc] init];
        
        // Генерируем DNA
        for (int i = 0; i < DNALength; i++) {
            [self.DNA addObject:[self generateGen]];
        }
    }
    
    return self;
}


// Вынес в отдельный метод, потому что код используется в двух местах
-(NSString *) generateGen {
    return [aphabet objectAtIndex:(arc4random() % alphabetLength)];
}


-(int) hammingDistance: (Cell *) anotherDNA {
    
    int distance = 0;
    
    // Перебираем индексы массива, в котором хранится DNA
    for (int i = 0; i < DNALength; i++) {
        if ([[self.DNA objectAtIndex:i] isEqualTo:[anotherDNA.DNA objectAtIndex:i]] == NO) {
            // Если на данной позиции различные символы, увеличиваем дистанцию
            distance++;
        }
    }
    return distance;
}


-(void) print {
    
    // Ощущение, что можно сделать проще
    
    NSMutableString *output = [[NSMutableString alloc] init];
    
    for (int i = 0; i < DNALength; i++) {
        [output appendString:[_DNA objectAtIndex:i]];
    }
    
    NSLog(@"%@", output);
}


@end
