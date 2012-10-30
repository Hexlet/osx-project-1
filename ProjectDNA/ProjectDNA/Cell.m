//
//  Cell.m
//  ProjectDNA
//
//  Created by Admin on 10/30/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id) init{
    /* this method fills the DNA array with one of symbols from "arr" array,
     chosen randomly*/
    NSArray *arr = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
    self = [super init];
    if(self){
        _DNA = [[NSMutableArray alloc] init];
        for(int i=0; i<100; i++){
            int num = arc4random() % 4;
            id letter = [arr objectAtIndex:num];
            [_DNA addObject:letter];
            //NSLog(@"%i:%@",i,letter);
        }
    }
    return self;
}

-(int) hammingDistance: (Cell*) cell{
    /*Quite obvious method - just comparing two arrays, object by object*/
    int distance=0;
    NSMutableArray *firstDNA = _DNA;
    NSMutableArray *anotherDNA= cell.DNA;
    for (int i=0; i<100; i++){
        if ([firstDNA objectAtIndex:i]==[anotherDNA objectAtIndex:i])
            distance++;
    }
    return distance;
}
@end
