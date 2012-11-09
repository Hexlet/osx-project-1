//
//  main.m
//  DNAProject
//
//  Created by Olga Andreyeva on 11/4/12.
//  Copyright (c) 2012 Olga Andreyeva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* c1 = [[Cell alloc] init];
        Cell* c2 = [[Cell alloc] init];
        
        NSLog(@"%d", [c1 hammingDistance:c2]);
        
    }
    return 0;
}

