//
//  main.m
//  dna
//
//  Created by Maksim Kuleshov on 02.11.12.
//  Copyright (c) 2012 Maksim Kuleshov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
-(void)mutate:(int)percentForSuffle;
@end

@implementation Cell (Mutator)

-(void)mutate:(int)percentForSuffle {
    //Принцип работы: Создаём массив индексов для всей длинны ДНК. Рандомно удаляем из этого массива 100%-Х% индексов. В итоге получаем набор уникальных индексов которые нужно заменить. Далее заменяем нуклеотиды по этим индексы в ДНК на новые предварительно убедившись, что новый нуклеотид отличается от старого.
    if (percentForSuffle > 100) {percentForSuffle = 100;}
    if (percentForSuffle < 0) {percentForSuffle = 0;}
    
    NSInteger lengthOfDNA = [self.DNA count];
    
    NSMutableArray *indexesForSuffle = [NSMutableArray arrayWithCapacity:lengthOfDNA];
    for (int i=0; i<lengthOfDNA; i++) {
        [indexesForSuffle addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    float countIndexesForNotSuffle = lengthOfDNA - round(lengthOfDNA/100.0*percentForSuffle);
    for (int i=0; i<countIndexesForNotSuffle; i++) {
        [indexesForSuffle removeObjectAtIndex:(arc4random() % (lengthOfDNA - i))];
    }
    
    NSInteger countIndexesForSuffle = [indexesForSuffle count];
    NSMutableArray *setOfDNAWithoutCurrent = [NSMutableArray arrayWithCapacity:[self.setOfDNA count]];
    for (int i=0; i<countIndexesForSuffle; i++) {
        [setOfDNAWithoutCurrent removeAllObjects];
        [setOfDNAWithoutCurrent addObjectsFromArray:self.setOfDNA];
        [setOfDNAWithoutCurrent removeObject:[self.DNA objectAtIndex:[[indexesForSuffle objectAtIndex:i] integerValue]]];
        
        [self.DNA replaceObjectAtIndex:[[indexesForSuffle objectAtIndex:i] integerValue] withObject:[setOfDNAWithoutCurrent objectAtIndex:(arc4random() % 3)]];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *dna1, *dna2;
        dna1 = [[Cell alloc] initWithLength:100];
        dna2 = [Cell new];
        NSLog(@"%i",[dna1 hammingDistance:dna2]);
        
        [dna1 mutate:33];
        [dna1 mutate:60];
        NSLog(@"%i",[dna1 hammingDistance:dna2]);
    }
    return 0;
}

