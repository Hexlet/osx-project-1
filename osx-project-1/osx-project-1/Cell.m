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
        for(int i = 0; i < 10; i++){
            NSUInteger rChar = random()%3+1;
            [_DNA addObject:[NSString stringWithFormat:@"%@",[array objectAtIndex: rChar]]];
        }
       NSLog(@"%@", _DNA);
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell{
    int j = 0;
    for(int i = 0; i < 10; i++){
        NSLog(@"1-%@",[self.DNA objectAtIndex:i]);
        NSLog(@"2-%@",[cell.DNA objectAtIndex:i]);
        if(![[self.DNA objectAtIndex:i] isEqual:[cell.DNA objectAtIndex:i]] ){
            j +=1;
        }
    }
    NSLog(@"%i",j);
    return j;
}

@end
