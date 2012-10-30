//
//  main.m
//  DNA
//
//  Created by Kirill Morozov on 30.10.12.
//  Copyright (c) 2012 Kirill Morozov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(mutator)
-(void)mutate: (int) mutatePercent;
@end

@implementation Cell(mutator)
-(void)mutate: (int) mutatePercent {
    // mutatePercent - не может быть больше 100%
    if (mutatePercent > 100) {
        return;
    }
    
    NSMutableArray *mutateIndexArray = [[NSMutableArray alloc] initWithCapacity:mutatePercent];
    NSMutableArray *dnaIndexArray = [NSMutableArray array];
    for (NSInteger i = 0; i < [DNA count]; i++)
        [dnaIndexArray addObject:[NSNumber numberWithInteger:i]];

    while (mutatePercent > 0) {
        // добавляем только уникальные индексы, по которым будем мутировать
        int random_index = arc4random() % [dnaIndexArray count];
        [mutateIndexArray addObject:dnaIndexArray[random_index]];
        [dnaIndexArray removeObjectAtIndex:random_index];
        mutatePercent--;
    }

    for (id mIndex in mutateIndexArray) {
        // удаляем текущий нуклеотид из массива для замены,
        // чтобы нуклеотид в позиции был гарантированно заменен на другой
        NSMutableArray *copyOfNucleotides = [NSMutableArray arrayWithArray:self.nucleotides];
        [copyOfNucleotides removeObject:[DNA objectAtIndex:[mIndex integerValue]]];
        int nucleotides_index = arc4random() % [copyOfNucleotides count];
        id newNucleotide = self.nucleotides[nucleotides_index];
        [DNA replaceObjectAtIndex:[mIndex integerValue] withObject:newNucleotide];
    }
 }

@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        int distance;
        Cell *myCell1 = [[Cell alloc] init];
        Cell *myCell2 = [[Cell alloc] init];
        //[myCell1 printDNA];
        //[myCell2 printDNA];
        distance = [myCell1 hammingDistance:myCell2];
        NSLog(@"hamming distance: %d", distance);
        [myCell1 mutate:70];
        [myCell2 mutate:70];
        distance = [myCell1 hammingDistance:myCell2];
        //[myCell1 printDNA];
        //[myCell2 printDNA];
        NSLog(@"hamming distance: %d", distance);
    }
    return 0;
}

