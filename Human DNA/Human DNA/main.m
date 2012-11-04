//
//  main.m
//  Human DNA[
//
//  Created by Dmitry Marenich on 11/4/12.
//  Copyright (c) 2012 Dmitry Marenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];

        [cell1 DNA:1];
    }
    return 0;
}

