//
//  Cell.m
//  osx-project-1
//
//  Created by Mac on 09.11.12.
//  Copyright (c) 2012 Mac. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init{
    self = [super init];
    NSArray *array = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
    _DNA = [[NSMutableArray alloc] init];
    if(self){
        for(int i = 0; i < 100; i++){
            NSUInteger rChar = arc4random_uniform(4);
            [_DNA addObject:[NSString stringWithFormat:@"%@",[array objectAtIndex: rChar]]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell{
    int j = 0;
    for(int i = 0; i < 100; i++){
        if(![[self.DNA objectAtIndex:i] isEqual:[cell.DNA objectAtIndex:i]] ){
            j +=1;
        }
    }
    return j;
}

@end
