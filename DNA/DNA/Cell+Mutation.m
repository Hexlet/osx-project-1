//
//  Cell+Mutation.m
//  DNA
//
//  Created by Moonkid on 10/31/12.
//  Copyright (c) 2012 Moonkid. All rights reserved.
//

#import "Cell+Mutation.h"

@implementation Cell (Mutation)

- (void)mutate:(int)percents {
    //Получаем кол-во елементов которые нужно заменить, делим массив на равные части, выбераем случайный элемент на каждом из отрезков.
    int segmentOrigin = 0;
    float segmentMod = 0;
    float countOfElementsToMutate = ((float)self.dna.count/100.0f)*(float)percents;
    for (int i = 0; i < countOfElementsToMutate; i++) {
        float segmentLength = (float)self.dna.count/countOfElementsToMutate;
        segmentMod += segmentLength - (int) segmentLength;
        if (segmentMod > 1.0f) {
            segmentLength +=(int)segmentMod;
            segmentMod = segmentMod - (int)segmentMod;
        }
        int randomIndex = arc4random()%(int) segmentLength;
        randomIndex += segmentOrigin;
        NSString *newSymbol = [self generateRandomSymbol];
        NSString *oldSymbol = [dna objectAtIndex:randomIndex];
        while ([newSymbol isEqualToString:oldSymbol]) {
            newSymbol = [self generateRandomSymbol];
        }
        [dna replaceObjectAtIndex:randomIndex withObject:newSymbol];
        segmentOrigin = (segmentOrigin + (int) segmentLength);
    }
}

@end