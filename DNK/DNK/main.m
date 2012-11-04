//
//  main.m
//  DNK
//
//  Copyright (c) 2012 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell;
        myCell = [[Cell alloc] init];
        
        [myCell  DNA:1];
        
    }
    return 0;
}

