//
//  main.m
//  osx-project-1
//
//  Created by Sergey Chebotarev on 30.10.12.
//  Copyright (c) 2012 Sergey Chebotarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        NSLog(@"Distance = %i", [cell1 hammingDistance: cell2]);
        [cell1 mutate:75];
        [cell2 mutate:75];
        NSLog(@"Distance = %i", [cell1 hammingDistance: cell2]);
    }
    return 0;
}

