//
//  main.m
//  osx-project-1
//
//  Created by Roman Dolgopolov on 06.11.12.
//  Copyright (c) 2012 Roman Dolgopolov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate: (int) percent;
@end

@implementation Cell (mutator)

-(void) mutate: (int) percent {
    
    // сохраняем состояние молекулы
    NSArray *oldDNA = [[NSArray alloc] initWithArray:self.DNA];
    
    // считаем столько элемнтов заменять в штуках
    int elements = round((self.dnaCapacity * percent) / 100);
    
    //NSLog(@"Заменяем %i процентов, %i штук", percent, elements);
    
    while (elements>0) {
        
        // берем случайный элемент из молекулы и из набора для замены
        NSUInteger DNAIndex = arc4random() % [self.DNA count];
        NSUInteger NucleobasesIndex = arc4random() % [self.Nucleobases count];
             
        // если случайный элемент не изменялся
        if ( [self.DNA objectAtIndex:DNAIndex] == [oldDNA objectAtIndex:DNAIndex]){
        
            // и новый элемент не равен старому
            if ( [self.DNA objectAtIndex:DNAIndex]  != [self.Nucleobases objectAtIndex:NucleobasesIndex] ) {
                
                // производим замену
                [self.DNA replaceObjectAtIndex:DNAIndex withObject:[self.Nucleobases objectAtIndex:NucleobasesIndex]];
                --elements;
            }
            
        }
        
    }
    
    //NSLog(@"Mutate values: %@", self.DNA);
    
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1, *cell2;
        
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:arc4random() % 100];
        [cell2 mutate:arc4random() % 100];
        
        NSLog(@"New Hamming distance: %i", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}

