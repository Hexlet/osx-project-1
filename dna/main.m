//
//  main.m
//  dna
//
//  Created by User on 31.10.12.
//  Copyright (c) 2012 d. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void)mutate:(int)part;

@end


@implementation Cell (mutator)
// мутация ДНК
-(void)mutate:(int)part {
    
    if ((part > 0) && (part < 101)) {
        
        NSInteger arrValue = [self.DNA count];
        
        // создаем шаблон мутации - массив индексов, используя которые, будем обращаться к массиву ДНК
        NSMutableArray *mutatorPattern = [[NSMutableArray alloc] initWithCapacity:arrValue];
        for (int i = 0; i < arrValue; i++) {
            [mutatorPattern addObject:[NSNumber numberWithInt:i]];
        }
        
        // Случайным образом перемешиваем шаблон мутации.
        // В результате получим случайный набор индексов, последовательно проходя по которому
        // будем вибирать элементы из массива ДНК
        [mutatorPattern shuffle];
        
        NSArray *tempDNA = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        NSInteger index = 0;
        for (NSInteger i = 0; i < part * arrValue / 100; i++) {
            index = [[mutatorPattern objectAtIndex:i] integerValue];
            [self.DNA replaceObjectAtIndex:index withObject:[tempDNA objectAtIndex:arc4random() % [tempDNA count]]];
        }
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myCell = [[Cell alloc] init];
        Cell *sCell = [[Cell alloc] init];
        
        NSLog(@"Hamming Distance: %d", [myCell hammingDistance:sCell]);
        
        [myCell mutate:100];
        [sCell mutate:5];
        
        NSLog(@"Hamming Distance: %d", [myCell hammingDistance:sCell]);
    }
    return 0;
}

