//
//  Cell.m
//  DNA
//
//  Created by deron on 04.11.12.
//  Copyright (c) 2012 deron. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init{
    self=[super init];
    if(self){
        _DNAsrc= [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        _DNA=[self createDNA];
    }
    return self;
}


-(id)createDNA{
    NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:100];
    for(int i=0;i<100;++i){
        [array addObject:[_DNAsrc objectAtIndex:arc4random()%4]];
    }
    return array;
}
-(int)hammingDistance:(Cell *)cell{
    int value=0;
    for (int i=0;i<100;++i){
        if([[cell DNA]objectAtIndex:i] !=[_DNA objectAtIndex:i]){
            ++value;
        }
    }
    return value;
}

@end
