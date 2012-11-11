//
//  main.m
//  test
//
//  Created by smoke on 11.11.12.
//  Copyright (c) 2012 smoke. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //NSMutableArray *elements = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D", nil];
        //[elements removeObjectAtIndex:1];
        NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:10];
        for (int i = 0; i < 10; i++) {
            [indexes addObject:[NSNumber numberWithInt:i]];
        }
        for (int i=0; i < [indexes count]; i++){
            NSLog(@"%d - %@",i, [indexes objectAtIndex: i]);
        }
    }
    return 0;
}

