//
//  main.m
//  osx-project-1
//
//  Created by Alexander Kazanskiy on 30.10.12.
//  Copyright (c) 2012 haxlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (muttator)

-(void) mutate: (int)numebr;

@end

@implementation Cell (muttator)

-(void) mutate:(int)num{

    int numMutate = (self->capacity/100) * num;
    NSMutableArray *checkPosition = [NSMutableArray arrayWithCapacity:numMutate];
    for (int i=0; i<numMutate; i++)
    {
        NSNumber *r =  [NSNumber numberWithInt: arc4random() % self->capacity];
        if ([checkPosition indexOfObject: r]){
            [checkPosition insertObject:r atIndex:i];
            [self->DNA replaceObjectAtIndex:i  withObject: [Cell getRandGen]];
        } else {
            i--;
            //NSLog(@" match %@", r );
        }
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *cellOne = [[Cell alloc] init];
        Cell *cellTwo = [[Cell alloc] init];
        int matches = [cellOne hummingDistance: cellTwo];
        NSLog(@"%d",matches);
        
        [cellOne mutate:10];
        [cellTwo mutate:20];
        matches = [cellOne hummingDistance: cellTwo];
        NSLog(@"%d",matches);

    }
    return 0;
}

