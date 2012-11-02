//
//  main.m
//  project_OSX1
//
//  Created by Sergey on 31.10.12.
//  Copyright (c) 2012 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cell.h>

@interface Cell (mutator)
-(void) mutate: int
@end

@implementation Cell (mutator)

-(void) mutate: (int) X{
    NSArray *tempArray = [NSArray arrayWithObjects: @'A', @'T', @'C', @'G', nil];
    int maxStep = floor(100/XPercent);
    for (int i = 0; i < 100; i = i + arc4random() % maxStep) {
        int randomIndex = (arc4random() % 2) * (arc4random() % 2);
        [DNA replaceObjectAtIndex:i withObject:[tempArray objectAtIndex:randomIndex]];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
    }
    return 0;
}

