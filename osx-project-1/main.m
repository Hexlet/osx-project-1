//
//  main.m
//  osx-project-1
//
//  Created by Максим Пелевин on 02.11.12.
//  Copyright (c) 2012 Максим Пелевин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate: (int) xPercent;

@end

@implementation Cell (mutator)

-(void) mutate:(int)xPercent {
    // временный массив с именами молекул A, T, C, G
    NSArray *molecules = [NSArray arrayWithObjects: @'A', @'T', @'C', @'G', nil];
    // вычисляем максимальный шаг смещения, чтобы не вылезти за границы массива
    int maxStep = floor(100/xPercent);
    for (int i = 0; i < 100; i = i + arc4random() % maxStep) {
        // меняем молекулы случайным образом
        int randomIndex = (arc4random() % 2) * (arc4random() % 2);
        [DNA replaceObjectAtIndex:i withObject:[molecules objectAtIndex:randomIndex]];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* cellOne = [[Cell alloc] init];
        Cell* cellTwo = [[Cell alloc] init];
        NSLog(@"%d\n" , [cellOne hammingDistance:cellTwo]);
        [cellOne mutate:50];
        [cellTwo mutate:46];
        NSLog(@"%d\n" , [cellOne hammingDistance:cellTwo]);
        
    }
    return 0;
}

