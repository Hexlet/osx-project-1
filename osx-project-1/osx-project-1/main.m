//
//  main.m
//  osx-project-1
//
//  Created by Victor Mylcin on 09.11.12.
//  Copyright (c) 2012 Victor Mylcin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        id cell1, cell2;
        srandom((unsigned)time(NULL)); // запуск генератора псевдослучайных чисел
        cell1 = [Cell new];
        srandom((unsigned)time(NULL)); // запуск генератора псевдослучайных чисел
        // результат одинаковые DNA
        cell2 = [Cell new];
        
//        NSLog(@"%@",cell1);
//        NSLog(@"%@",cell2);
        NSLog(@"%i",[cell1 hammingDistance: cell2]);
        
        [cell1 mutate:0];
        [cell2 mutate:100];
//        NSLog(@"%@",cell1);
//        NSLog(@"%@",cell2);
        NSLog(@"%i",[cell1 hammingDistance: cell2]);
        
    }
    return 0;
}

