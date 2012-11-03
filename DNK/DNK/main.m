//
//  main.m
//  DNK
//
//  Created by Администратор on 11/3/12.
//  Copyright (c) 2012 Rustam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        [cell hammingDistance:cell2];

        [cell mutate:arc4random()%100];
        [cell2 mutate:arc4random()%100];
        
        [cell hammingDistance:cell2];

       }
    return 0;
}

