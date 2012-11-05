//
//  main.m
//  DNA
//
//  Created by Buxxter on 05.11.12.
//  Copyright (c) 2012 Buxxter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *c1 = [[Cell alloc] init]; // первая цепочка
        Cell *c2 = [[Cell alloc] init]; // вторая цепочка
        
        
        //NSLog(@"ДНК_1:%@", c1.mStringView);
        //NSLog(@"ДНК_2:%@", c2.mStringView);
        
        NSLog(@"Первая ДНК отличается от второй на %i хромосом", [c1 hammingDistance:c2]);
        
        NSLog(@"Мутировавшая ДНК_1: %@", [[c1 mutateOn:10] mStringView]);
        NSLog(@"Мутировавшая ДНК_2: %@", [[c2 mutateOn:100] mStringView]);
        
        NSLog(@"Первая ДНК отличается от второй на %i хромосом", [c1 hammingDistance:c2]);
        
    }
    return 0;
}

