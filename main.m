//
//  main.m
//  DNK
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 witem.artem@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myDna1,*myDna2;
        myDna1 = [[Cell alloc] init];
        myDna2 = [[Cell alloc] init];
        
        NSLog(@"%d",[myDna1 hammingDistance:myDna2]);
        //[myDna1 print];
        //[myDna2 print];
        
        [myDna1 mutate:100];
        [myDna2 mutate:25];
        
        NSLog(@"%d",[myDna1 hammingDistance:myDna2]);
        //[myDna1 print];
        //[myDna2 print];
        
        
    }
    return 0;
}

