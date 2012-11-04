//
//  main.m
//  osx-project-1
//
//  Created by Alexander Kazanskiy on 30.10.12.
//  Copyright (c) 2012 haxlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+muttator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *cellOne = [[Cell alloc] init];
        Cell *cellTwo = [[Cell alloc] init];
        int matches = [cellOne hummingDistance: cellTwo];
        NSLog(@"Match gens %d",matches);
        
        [cellOne mutate:10];
        [cellTwo mutate:20];
        matches = [cellOne hummingDistance: cellTwo];
        NSLog(@"Match gens %d",matches);

    }
    return 0;
}

