//
//  CellMutator.m
//  osx-1
//
//  Created by Александр Турченко on 31.10.12.
//  Copyright (c) 2012 TurchenkoAlex. All rights reserved.
//

#import "Cell+Mutator.h"
#import "DNA.h"

@implementation Cell (Mutator)

-(NSString *)mutateDNASymbol:(NSString *)theSymbol{
    int randomShift = random() % DNALength;
    if ([theSymbol isEqual:DNASymbols[randomShift]]){
        randomShift = (randomShift + 1) % DNALength;
    }
    return DNASymbols[randomShift];
}

-(void)mutateDNAWithPercentage:(int)thePercentage{
    NSUInteger length = [[self DNA] count];
    NSUInteger mutationCount = ((length / 100) * thePercentage);
    if (mutationCount > length) {
        mutationCount = length;
    }

    BOOL mutation[length];
    
    for(NSUInteger i = 0; i < length; ++i){
        mutation[i] = NO;
    }
    
    // Создаем схему мутации
    for(NSUInteger i = 0; i < mutationCount; ++i){
        NSUInteger randomIndex = random() % length;
        BOOL setted = NO;
        while(!setted){
            if(mutation[randomIndex]){
                randomIndex = (randomIndex + 1) % length;
            } else {
                mutation[randomIndex] = YES;
                setted = YES;
            }
        }
    }
    
    // Накладываем схему мутации
    for(NSUInteger i = 0; i < length; ++i){
        if(mutation[i]){
            // Мутируем символ - случайным другим символом
            [[self DNA] replaceObjectAtIndex:i withObject:[self mutateDNASymbol:[self DNA][i]]];
        }
    }
}
@end

