//
//  Cell+mutator.m
//  DNK
//
//  Created by someone on 11/1/12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "Cell+mutator.h"

extern int DNALength;

@implementation Cell (mutator)

-(void) mutate: (int) percents {
    
    int position;
    
    NSString *currentLetter = [NSString string];
    NSString *mutatedLetter = [NSString string];
    
    // Массив, в котором запоминаем уже позицию уже мутировавших генов
    NSMutableArray *mutatedPositions = [[NSMutableArray alloc] init];
    
    // Мутируем, пока не наберёся нужной количество мутаций
    while ([mutatedPositions count] < (percents * DNALength / 100)) {
        
        // Выбираем случайную позицию в DNA
        position = arc4random() % DNALength;
        
        if ([mutatedPositions containsObject:[NSNumber numberWithInt:position]]){
            // Если ген на данной позиции уже мутировал, то выбираем другую позицию
            continue;
        } else {
            // Если ген ещё не мутировал, то заменяем его на случайный
            // и запоминаем его позицию, чтобы не мутировать повторно
            
            // При генерации мутации проверяем, чтобы случайно не сгенерировать
            // точно такой же
            
            currentLetter = [self.DNA objectAtIndex:position];
            
            while ([mutatedLetter = [self generateGen] isEqualTo:currentLetter]){
                // После завершения цикла mutatedGen будет
                // гарантированно отличаться от currrenGen
            }
            
            [self.DNA replaceObjectAtIndex:position withObject:mutatedLetter];
            [mutatedPositions addObject:[NSNumber numberWithInt:position]];
        }
        
    }
    
}

@end
