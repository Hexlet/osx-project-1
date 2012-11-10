//
//  main.m
//  DNK
//
//  Created by Artem Osipov on 11/10/12.
//  Copyright (c) 2012 Artem Osipov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)persent;
@end;


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *c1, *c2;
        int distance, percent;
        percent =15;
        c1 = [[Cell alloc] init];
        c2 = [[Cell alloc] init];
        distance = [c1 hammingDistance: c2];
        NSLog(@"Distance before mutation: %u", distance);
        [c2 mutate: percent];
        distance = [c1 hammingDistance: c2];
        NSLog(@"Distance after nutation: %u", distance);
    }
    return 0;
}

