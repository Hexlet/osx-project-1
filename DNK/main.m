//
//  main.m
//  DNK
//
//  Created by Дмитрий Арефьев on 06.11.12.
//  Copyright (c) 2012 Дмитрий Арефьев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int hammingDistance = 0;
        Cell *myCell1, *myCell2;
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        hammingDistance = [myCell1 hammingDistance:myCell2];
        NSLog(@"hammingDistance: %d", hammingDistance);
        
        [myCell1 mutate:30];
        [myCell2 mutate:50];
        
        hammingDistance = [myCell1 hammingDistance:myCell2];
        NSLog(@"hammingDistance: %d", hammingDistance);
    }
    return 0;
}

