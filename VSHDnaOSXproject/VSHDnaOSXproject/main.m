//
//  main.m
//  VSHDnaOSXproject
//
//  Created by vshcryabets@gmail.com on 11/1/12.
//  Copyright (c) 2012 vshcryabets@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Cell+CellMuattor.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        [cell1 print];
        [cell2 print];
        NSLog(@"Hamming disctance=%d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:20];
        [cell2 mutate:30];
        [cell1 print];
        [cell2 print];
        NSLog(@"Hamming disctance after mutation=%d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}

