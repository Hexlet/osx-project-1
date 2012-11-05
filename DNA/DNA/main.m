//
//  main.m
//  DNA
//
//  Created by NordWind on 05.11.12.
//  Copyright (c) 2012 YurySokolov. All rights reserved.
//

#import <Foundation/Foundation.h>
// Подключаем класс Cell
#import "Cell.h"
#import "CellMutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Cell *cellOne = [[Cell alloc]init];
        
        Cell *cellTwo = [[Cell alloc] init];
        
        int difference = [cellOne hammingDistance:cellTwo];
        NSLog(@"%@: %i", @"Различие ДНК с исследуемой клеткой", difference);
        
        [cellOne mutate:10];
        [cellTwo mutate:69];
        
        int difference2 = [cellOne hammingDistance:cellTwo];
        NSLog(@"%@: %i", @"Различие ДНК с исследуемой клеткой", difference2);
        
    }
    return 0;
}

