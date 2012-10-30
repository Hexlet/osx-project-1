//
//  main.m
//  DNK
//
//  Created by Rybalko Dmitriy on 30.10.12.
//  Copyright (c) 2012 Rybalko Dmitriy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[]) {

    @autoreleasepool {
        
        Cell *myCell1 = [[Cell alloc] init];
        Cell *myCell2 = [[Cell alloc] init];
        uint hd = [myCell1 hammingDistance: myCell2];

        NSLog(@"hamming distance= %d", hd);
        
        [myCell1 mutate: 20];
        [myCell2 mutate: 20];
        
        hd = [myCell1 hammingDistance: myCell2];
        
        NSLog(@"hamming distance= %d", hd);
        
    }
    return 0;
}

