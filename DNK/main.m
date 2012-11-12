//
//  main.m
//  DNK
//
//  Created by Alexey Popov on 11.11.12.
//  Copyright (c) 2012 Alexey Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(Mutator)
-(void) mutate: (int) m;
@end

@implementation Cell(Mutator)
-(void)mutate:(int)m {
    for(int i = 0; i <= m - 1; i++) {
        [self.DNA insertObject:self.getVariant atIndex:i];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell *dnk1 = [[Cell alloc] init];
        Cell *dnk2 = [[Cell alloc] init];

        NSLog(@"%i", [dnk1 hammingDistance:dnk2]);
        [dnk1 mutate:30];
        [dnk2 mutate:60];

        NSLog(@"%i", [dnk1 hammingDistance:dnk2]);
        
    }
    return 0;
}

