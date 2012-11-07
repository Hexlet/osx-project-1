//
//  main.m
//  SimpleCell
//
//  Created by Dmitry Svetlakov on 11/2/12.
//  Copyright (c) 2012 Dmitry Svetlakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@implementation Cell (mutator)

- (void)mutate:(int)fraction{
    //массив в котором содержаться ИД мутировавших элементов, используется для проверки
    NSMutableArray *mutatedItems = [NSMutableArray array];
    
    int mutatedID;
    NSString *mutatedElement;
    
    for (int i=0; i<fraction&&i<MAX_ITEMS; i++) {
        //генерируем ид объекта до тех пор пока удостоверяемся что он ещё не мутировал
        do {
            mutatedID = arc4random()%[self.DNA count];
        } while ([mutatedItems containsObject:[NSNumber numberWithInt:mutatedID]]);
        
        [mutatedItems addObject:[NSNumber numberWithInt:mutatedID]];
        
        //генерируем новый элемент до тех пор пока он не станет отличен от текущего
        do {
            mutatedElement = [avaiableKeys objectAtIndex:(arc4random()%[avaiableKeys count])];
        } while ([(NSString*)[self.DNA objectAtIndex:mutatedID] isEqualToString:mutatedElement]);
//        NSLog(@"%i, %@->%@", mutatedID, mutatedElement, [self.DNA objectAtIndex:mutatedID]); //если раскомментировать то будет выводить какие объекты мутировали и на что заменены
        
        //заменяем объект на мутировавший
        [self.DNA replaceObjectAtIndex:mutatedID withObject:mutatedElement];
    }
}

@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] initWithGeneratedDNA];
        Cell *cell2 = [[Cell alloc] initWithGeneratedDNA];
        NSLog(@"hamming distance:");
        NSLog(@"\tbefore mutate:%i", [cell1 hammingDistance:cell2]);
        [cell1 mutate:50];
        NSLog(@"\tafter mutate:%i", [cell1 hammingDistance:cell2]);
//        NSLog(@"%@", [[cell1 DNA] componentsJoinedByString:@""]);//если раскомментировать выведет всю последовательность в консоль
//        NSLog(@"%@", [[cell2 DNA] componentsJoinedByString:@""]);
    }
    return 0;
}

