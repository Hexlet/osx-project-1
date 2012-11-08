//
//  main.m
//  03_dna
//
//  Created by Stas on 11/2/12.
//  Copyright (c) 2012 Stas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Evolution.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *myCell1, *myCell2;
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        [myCell1 print];
        [myCell2 print];
        printf("hammingDistance до мутации = %d\n", [myCell1 hammingDistance:myCell2]);
        
        [myCell1 mutate:22];
        [myCell2 mutate:18];
        
        [myCell1 print];
        [myCell2 print];
        printf("hammingDistance после мутации = %d\n", [myCell1 hammingDistance:myCell2]);
    }
    return 0;
}
