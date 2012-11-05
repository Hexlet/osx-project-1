//
//  main.m
//  DNK
//
//  Created by Admin on 05.11.12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *DNK1 = [[Cell alloc] init];
        Cell *DNK2 = [[Cell alloc] init];
        int m = [DNK1 hammingDistance:DNK2];
        [DNK1 mutate:m];
        [DNK2 mutate:m];
        NSLog(@"m: %d", m);
        m = [DNK1 hammingDistance:DNK2];
        NSLog(@"m: %d", m);
    }
    return 0;
}

