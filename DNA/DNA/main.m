//
//  main.m
//  DNA
//
//  Created by Администратор on 10/31/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *c1, *c2;
        
        c1 = [[Cell alloc] init];
        c2 = [[Cell alloc] init];
               
        [c1 print];
        [c2 print];
        
        NSLog(@"Hamming distance before mutation: %d",[c1 hammingDistance: c2]);
        
        [c1 mutate: 10];
        [c2 mutate: 20];
        //[c1 print];
        //[c2 print];
                
        NSLog(@"Hamming distance afther mutation: %d",[c1 hammingDistance: c2]);
    }
    return 0;
}

