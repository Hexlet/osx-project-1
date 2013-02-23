//
//  main.m
//  os-project-1
//
//  Created by Михаил Поспелов on 24.02.13.
//  Copyright (c) 2013 Михаил Поспелов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
@interface Cell (mutator)
-(void) mutate:(int) integer;
@end
@implementation Cell(mutator)

-(void) mutate:(int) integer{
    NSArray *simbolsArray = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    for (int i=0; i < integer; ++i) {
        [[self DNA] insertObject:simbolsArray[arc4random() % 3] atIndex:i ];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell0 = [[Cell alloc] init], *myCell1 = [[Cell alloc] init];
        // insert code here...
        
        NSLog(@"Old distance %i", [myCell0 hammingDistance:myCell1]);
        [myCell0 mutate:20];
        [myCell1 mutate:90];
        NSLog(@"New distance %i", [myCell0 hammingDistance:myCell1]);

    }
    return 0;
}

