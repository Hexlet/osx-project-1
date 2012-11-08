//
//  main.m
//  DNK
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 witem.artem@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Call.h"
#import "Call+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Call *myDna1,*myDna2;
        myDna1 = [[Call alloc] init];
        myDna2 = [[Call alloc] init];
        
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

