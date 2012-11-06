//
//  main.m
//  project1
//
//  Created by Василий Слепцов on 01.11.12.
//  Copyright (c) 2012 Василий Слепцов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void) mutate: (int)x;
@end

@implementation Cell (mutator)
- (void) mutate:(int)x {
    NSMutableArray *objects = [[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"С", nil];
    int i;
    for (i = 0; i < x; i++) {
        
    }
}
@end

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Cell *one = [[Cell alloc] init];
        Cell *two = [[Cell alloc] init];
        
        NSLog(@"%i", [one hammingDistance: two]);
    
    }
    return 0;
}

