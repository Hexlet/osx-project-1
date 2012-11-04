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
        printf("%d\n", distance);
        
        [c1 mutate: 2];
        distance = [c1 hammingDistance: c1];
        printf("%d\n", distance);
        [c1 print];
    }
    return 0;
}

