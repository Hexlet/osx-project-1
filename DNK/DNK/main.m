//
//  main.m
//  DNK
//
//  Created by Администратор on 10/25/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell + Mutator.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *obj1, *obj2;
        obj1 = [[Cell alloc] init];
        obj2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance is:%i",[obj1 hammingDistance:obj2]);
        [obj1 mutate:arc4random() %101];
        [obj2 mutate:arc4random() %101];
        NSLog(@"Hamming distance is:%i",[obj1 hammingDistance:obj2]);
    }
    return 0;
}

