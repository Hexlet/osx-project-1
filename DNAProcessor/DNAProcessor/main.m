//
//  main.m
//  DNAProcessor
//
//  Created by Sergey Nebolsin on 10.11.12.
//  Copyright (c) 2012 Sergey Nebolsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell = [Cell cell];
        [cell print];
        Cell *anotherCell = [Cell cell];
        [anotherCell print];
    }
    return 0;
}

