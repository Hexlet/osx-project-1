//
//  main.m
//  project_OSX1
//
//  Created by Sergey on 31.10.12.
//  Copyright (c) 2012 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import </Users/sergey/repos/osx-project-1/project_OSX1/project_OSX1/Cell.h>

@interface Cell (mutator)
- (void) mutate: (int) x;
@end

@implementation Cell (mutator)

-(void) mutate: (int) X{
    NSArray *tempArray = [NSArray arrayWithObjects: @'A', @'T', @'C', @'G', nil];
    int maxStep = floor(100/X);
    for (int i = 0; i < 100; i = i + arc4random() % maxStep) {
        int randomIndex = (arc4random() % 2) * (arc4random() % 2);
        [[self dna] replaceObjectAtIndex:i withObject:[tempArray objectAtIndex:randomIndex]];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        // создадим пару объектов Cell
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        // выводим в консоль результат работы функции hammingDistance
        NSLog(@"Hamming distance: %d", [cell1 hammingDistance: cell2]);
        
        // применим mutate к обоим объектам
        [cell1 mutate:30];
        [cell2 mutate:25];
        
        // и выведем в консоль hammingDistance между мутировавашими объектами
        
        NSLog(@"Hamming distance(mutated): %d", [cell1 hammingDistance:cell2]);
        
        
    }
    return 0;
}

