//
//  main.m
//  DNA
//
//  Created by Evgeniy Kozachenko on 04.11.12.
//  Copyright (c) 2012 Evgeniy Kozachenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutate.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *myCell=[[Cell alloc] init];
        Cell *myCell2=[[Cell alloc] init];
        NSLog(@"hamming distance = %i",[myCell hammingDistance:myCell2]);
        //считаем и выводим разницу
        [myCell mutate:25];
        //мутируем первый ДНК
        [myCell2 mutate:25];
        //мутируем второй ДНК
        NSLog(@"hamming distance2 = %i",[myCell hammingDistance:myCell2]);
        //считаем и выводим разницу
    }
    return 0;
}

