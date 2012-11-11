//
//  main.m
//  osx-project-1
//
//  Created by smoke on 11.11.12.
//  Copyright (c) 2012 smoke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void)mutate:(int)percent;
+ (id)mutateDNAElement:(id)element;
@end

@implementation Cell (mutator)
+ (id)mutateDNAElement:(id)element {     //mutateDNAElement возвращает случайный элемент массива DNA_ELEMENTS отличающийся от значения element    
    NSMutableArray *elements = [NSMutableArray arrayWithArray:DNA_ELEMENTS];      //клонируем массив DNA_ELEMENTS в массив elements
    [elements removeObjectAtIndex:(int) [elements indexOfObject:element]];      //удаляем из массива elements значение совпадающее с element
    return [elements objectAtIndex:arc4random() % [elements count]];          //возвращаем один элемент массива elements из оставшихся 
}
- (void)mutate:(int)percent { //надо добавить проверку что percent в пределах от 0 до 100    
    NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
    for (int i = 0; i < DNA_LENGTH; i++) {
        [indexes addObject:[NSNumber numberWithInt:i]];
    }
    int index;
    int counter = round(DNA_LENGTH*percent / 100);
    for(; counter > 0; counter--) {
        index =  [[indexes objectAtIndex: arc4random() % [indexes count]] intValue];
        [self.DNA replaceObjectAtIndex:index withObject: [Cell mutateDNAElement:[self.DNA objectAtIndex:index]]];
    }
    return;
  }
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"hamming distance before mutate: %d", [cell1 hammingDistance:cell2]);
        [cell1 mutate:22];
        [cell2 mutate:56];
        NSLog(@"hamming distance after mutate: %d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}

