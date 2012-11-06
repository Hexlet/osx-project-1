//
//  main.m
//  DNAproject
//
//  Created by Lilumi Odi on 05.11.12.
//  Copyright (c) 2012 Lilumi Odi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {        
        Cell *Cell1, *Cell2;
        Cell1 = [[Cell alloc] initWithLenght:100];
        Cell2 = [[Cell alloc] init]; // по-умолчанию инициализируем масив из 100 символов
        NSLog(@"%@", Cell1);
        NSLog(@"%@", Cell2);
        NSLog (@"ДНК не совпадают в %i позициях", [Cell1 hammingDistance:Cell2]);
        
        [Cell1 mutate:20];
        [Cell2 mutate:20];
        NSLog(@"%@", Cell1);
        NSLog(@"%@", Cell2);
        NSLog (@"ДНК не совпадают в %i позициях", [Cell1 hammingDistance:Cell2]);
    }
    return 0;
}

