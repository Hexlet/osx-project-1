//
//  Cell.m
//  dna
//
//  Created by Алексей on 12.11.12.
//  Copyright (c) 2012 Алексей. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if(self) {
        _dna = [NSMutableArray arrayWithCapacity:100];
        for(int i=0; i<100; i++) {
            int rndGenerator;
            rndGenerator = arc4random() %4;
            if (rndGenerator == 0) {
                [_dna addObject:@"A"];
            } else if (rndGenerator == 1) {
                [_dna addObject:@"T"];
            } else if (rndGenerator == 2) {
                [_dna addObject:@"G"];
            } else if (rndGenerator == 3) {
                [_dna addObject:@"C"];
            }
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell {
    _counter = [[self dna] count];
    int iter = 0;
    for(int i=0; i<_counter; i++) {
            if ([[self dna] objectAtIndex:i] != [[cell dna] objectAtIndex:i])
                iter++;
    }
    
    return iter;
}


-(id)copyWithZone:(NSZone *)zone

{
    
    Cell *another = [[Cell alloc] init];
    
    another.dna = [[self dna] copyWithZone: zone];
    
    return another;
    
}

@end

@implementation Cell(mutator)

//Метод mutate не дописан, подключился к проекту только 12  ноября
-(void) mutate:(int)perc {
    NSMutableArray *mutateIndex;
    mutateIndex = [NSMutableArray arrayWithCapacity:[[self dna] count]];
    NSNumber *index;
    NSUInteger rndIndex;
    //Подсчитываем количество мутирующих элементов массива
    perc = perc * [[self dna] count] / 100;
    
    //Иницилизируем массив индексов
    for(int i = 0; i < [[self dna] count]; i++) {
        index = [NSNumber numberWithInt:i];
        [mutateIndex addObject:index];
    }    
    //Заменяем элементы мутирующего массива
    int random;
    for(int i = 0; i < perc;) {
        rndIndex =  [mutateIndex indexOfObject:[mutateIndex objectAtIndex:(arc4random() % [mutateIndex count])]];
        random = arc4random() %4;
        NSLog(@"%i %li %li %@ %i %@",i, [mutateIndex count], rndIndex, [[self dna] objectAtIndex:rndIndex], random, [self nucleide:random]);
        if([[self dna] objectAtIndex:rndIndex] != [self nucleide:random]) {
            i++;
            [[self dna] replaceObjectAtIndex:rndIndex withObject:[self nucleide:random]];
            [mutateIndex removeObjectAtIndex:rndIndex];
        }
            
    }

}

-(NSString *) nucleide:(int)i {
    if(i == 0)
        return @"A";
    else if(i == 1)
        return @"T";
    else if(i == 2)
        return @"G";
    else if(i == 3)
        return @"C";
    else
        return @"";
}

@end
