//
//  main.m
//  Project1_DNA
//
//  Created by Alexander on 06.11.12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell = [[Cell alloc]init];
        Cell *cell2 = [[Cell alloc]init];
        
        int hammFirst = [cell hammingDistance:cell2];
        
        NSLog(@"%i",hammFirst);
        
        [cell mutator:60];
        [cell2 mutator:60];
        
        int hammSecond = [cell hammingDistance:cell2];
        NSLog(@"%i",hammSecond);
        
    }
    return 0;
}

