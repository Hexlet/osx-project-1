//
//  main.m
//  ProjectOne
//
//  Created by Pavel Gerashchenko on 09.11.12.
//  Copyright (c) 2012 Pavel Gerashchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
@interface Cell (mutator) {

}
-(void) mutate:(int) x;
@end

@implementation Cell (mutator) 

//Проблема :( не успеваю разобраться
-(void) mutate: (int) x {
    int p,h;
    for (p=0;p<=x;p++) {
        h = arc4random_uniform(4);
        [arrayTemp insertObject:chars[h] atIndex:p];
        if (arrayTemp[p] == DNA[p]) {
            p=p-1;
        }
        else

            [DNA insertObject:arrayTemp[p] atIndex:p];
        }
}

@end



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *dnaCell  = [[Cell alloc] init];
        Cell *dnaTwoCell = [[Cell alloc] init];
        NSLog(@"Isss %d", [dnaCell hammingDistance:dnaTwoCell]);
        
        [dnaCell mutate:25 ];
        
        NSLog(@"Isss %d %lu", [dnaCell hammingDistance:dnaTwoCell],[dnaCell.DNA count]);
        
    }
    return 0;
}


