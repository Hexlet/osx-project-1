//
//  main.m
//  DNK
//
//  Created by Danil Galeev on 03.11.12.
//  Copyright (c) 2012 Danil Galeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "NSMutableArray+Shuffling.h"
#import "Cell+Mutating.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell1;
        Cell *myCell2;
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        NSLog(@"%i", [myCell1 hammingDistance: myCell2]);
        [myCell1 mutate: 50];
        [myCell2 mutate: 75];
        NSLog(@"%i", [myCell1 hammingDistance: myCell2]);
    }
    return 0;
}

