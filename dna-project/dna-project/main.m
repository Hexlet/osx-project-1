//
//  main.m
//  dna-project
//
//  Created by Илья Бельский on 11/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* cellOne = [[Cell alloc] init];
        NSLog(@"%@", [cellOne getDnaAsString]);
    }
    return 0;
}

