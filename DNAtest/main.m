//
//  main.m
//  DNAtest
//
//  Created by herku on 11/12/12.
//  Copyright (c) 2012 herku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *rdna1 = [[Cell alloc] init];
        NSLog(@"DNA 1: %@",rdna1);
       
        
        Cell *rdna2 = [[Cell alloc] init];
        NSLog(@"DNA 2: %@",rdna2);
        
        NSLog(@"Hamming Distance: %d",[rdna1 hammingDistance:rdna2]);

        
    }
    return 0;
    
}




