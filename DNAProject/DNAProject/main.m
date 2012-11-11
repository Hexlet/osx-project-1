//
//  main.m
//  DNAProject
//
//  Created by VITALIY NESTERENKO on 05.11.12.
//  Copyright (c) 2012 VITALIY NESTERENKO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "main.h"




int main(int argc, const char * argv[])
{

    @autoreleasepool {

       Cell *cell =[[Cell alloc] init];
       Cell *cell1 =[[Cell alloc] init];
        
       
       NSLog(@"Hamming distance before mutation: %d",[cell hammingDistance:cell1]);
       [cell mutate:60];
       [cell1 mutate:40];
        
       NSLog(@"Hamming distance after mutation: %d",[cell hammingDistance:cell1]);
        
    }
    return 0;
}

