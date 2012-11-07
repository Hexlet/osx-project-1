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
    
    fraction = MIN(MAX(fraction,0), 100);
    NSString *mutatedElement;
    
    int numElementsToChange = round(MAX_ITEMS*fraction/100);
    int numOfReplacedElements = 0;
    
    NSUInteger currentElementIndex;
    NSUInteger newElementIndex;
    NSUInteger countAvailableKeys = [[Cell availableKeys] count];
    
    for (int i=0;i<MAX_ITEMS&&numOfReplacedElements<numElementsToChange;i++){    
        if (arc4random()%100<=(100*(numElementsToChange-numOfReplacedElements)/(MAX_ITEMS-i))){
            numOfReplacedElements++;
            currentElementIndex = [[Cell availableKeys] indexOfObject:[self.DNA objectAtIndex:i]];
            
            newElementIndex = (currentElementIndex + 1 + arc4random()%(countAvailableKeys-1))%countAvailableKeys;
            mutatedElement = [[Cell availableKeys] objectAtIndex:newElementIndex];
//            NSLog(@"%i, %@->%@", i, mutatedElement, [self.DNA objectAtIndex:i]); //если раскомментировать то будет выводить какие объекты мутировали и на что заменены
            [self.DNA replaceObjectAtIndex:i withObject:mutatedElement];
        }
    }
}

@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"hamming distance:");
        NSLog(@"\tbefore mutate:%i", [cell1 hammingDistance:cell2]);
        [cell1 mutate:100];
        [cell2 mutate:50];
        NSLog(@"\tafter mutate:%i", [cell1 hammingDistance:cell2]);
        //        NSLog(@"%@", [[cell1 DNA] componentsJoinedByString:@""]);//если раскомментировать выведет всю последовательность в консоль
        //        NSLog(@"%@", [[cell2 DNA] componentsJoinedByString:@""]);
    }
    return 0;
}

