//
//  main.m
//  osx-project-1
//
//  Created by m g on 11/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (mutator)
-(void)mutate:(int)percent;
@end

@implementation Cell (mutator)

-(void)mutate:(int)percent
{
    // mutate
}

@end

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell, *seconCell;
        firstCell = [[Cell alloc ] init];
        seconCell = [[Cell alloc] init];
        
        [firstCell print];
        [seconCell print];
        int distanse = [firstCell hummingDistance:seconCell];
        NSLog(@"humming distanse = %i", distanse);
        
        // mutate
    }
    return 0;
}

