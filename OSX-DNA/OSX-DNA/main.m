//
//  main.m
//  OSX-DNA
//
//  Created by Pavlo Svirin on 11/3/12.
//  Copyright (c) 2012 Pavlo Svirin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* c1 = [[Cell alloc] init];
        Cell* c2 = [[Cell alloc] init];
        [c1 print];
        [c2 print];
        int distance = [c1 hammingDistance: c2];
        printf("%d\n\n", distance);
        
        [c1 mutate: 10];
        [c2 mutate: 10];
        distance = [c1 hammingDistance: c2];
        printf("%d\n\n", distance);
        [c1 print];
    }
    return 0;
}

