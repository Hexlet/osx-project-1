//
//  main.m
//  DNAProject
//
//  Created by S.Lebedev on 30.10.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Формируем первую последовательность ДНК");
        Cell *myCell = [[Cell alloc] init]; // первая ДНК
        NSLog(@"%@",myCell);
        NSLog(@"Сформировано");
        NSLog(@"Формируем вторую последовательность ДНК");
        Cell *myCell2 = [[Cell alloc] init]; // вторая ДНК
        NSLog(@"%@",myCell2);
        NSLog(@"Сформировано");
        NSLog(@"Hamming distance: %d",[myCell hammingDistance:myCell2]);
        // модифицируем обе ДНК
        NSLog(@"Модифицируем первую последовательность");
        [myCell mutate:0];
        NSLog(@"%@",myCell);
        NSLog(@"done");
        NSLog(@"Модифицируем вторую последовательность");
        [myCell2 mutate:100];
        NSLog(@"%@",myCell2);
        NSLog(@"done");
        NSLog(@"Hamming distance: %d",[myCell hammingDistance:myCell2]);
        
    }
    return 0;
}

