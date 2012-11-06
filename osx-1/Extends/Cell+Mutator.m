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

-(NSString *)mutatedDNAAtIndex:(NSUInteger)theIndex{
    int randomShift = arc4random() % DNALength;
    NSString *gene = [[self DNA] objectAtIndex:theIndex];
    
    if ([gene isEqual:DNASymbols[randomShift]]) {
        randomShift = (randomShift + 1) % DNALength;
    }
    return DNASymbols[randomShift];
}

-(void)mutateDNAWithPercentage:(int)thePercentage{
    NSAssert(thePercentage >= 0 && thePercentage <= 100, @"Wrong percentage parameter");
    
    NSUInteger length = [[self DNA] count];
    NSUInteger mutationCount = ((length / 100) * thePercentage);
    if (mutationCount > length) {
        mutationCount = length;
    }
    if (mutationCount > 0) {
    
        NSUInteger mutation[length];
        for(NSUInteger i = 0; i < length; ++i){
            mutation[i] = i;
        }
        // Создаем схему мутации и сразу реализуем ее
        for(NSUInteger i = 0; i < mutationCount; ++i){
            NSUInteger randomIndex = (arc4random() % (length - i)) + i;
            NSUInteger mutateIndex = mutation[randomIndex];
            mutation[randomIndex] = mutation[i];
            [[self DNA] replaceObjectAtIndex:mutateIndex withObject:[self mutatedDNAAtIndex:mutateIndex]];
        }
    }
}
@end

