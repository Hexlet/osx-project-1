//
//  Cell.m
//  Project 1
//
//  Created by Администратор on 11/5/12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Cell.h"

@implementation Cell

-(id) init{
    
    self=[super init];
    if(self){
        
        DNACharArray=@[@"A",@"T",@"G",@"C"];       
        DNA= [NSMutableArray arrayWithCapacity:DNAArrayLength];
        for (int i=0; i<DNAArrayLength; i++) {
            [DNA addObject:[DNACharArray objectAtIndex:arc4random()%[DNACharArray count]]];
        }

    }
    return self;
}

-(int) hammingDistance:(Cell*) cell{
    int j=0;
    for (int i=0; i<DNAArrayLength; i++) {
        if ([[self getDNKLetter:i] isEqualToString:[cell getDNKLetter:i]]) {
            j++ ;
        }
    }
    return j;
}

-(NSString*) getDNKLetter:(int) position{
    return [DNA objectAtIndex:position];
}
@end
