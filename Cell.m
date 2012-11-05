//
//  Cell.m
//  DNAProject
//
//  Created by test on 05.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id)init{
    NSString *letters = @"ATGС";    
    self = [super init];
    if(self){
        DNA = [[NSMutableArray alloc]init];
        for (int i=0; i<100; i++) {
            [DNA addObject: [NSString stringWithFormat: @"%C",[letters characterAtIndex:arc4random()%4]] ];
        }
    }
    return self;
}

-(id)getGene:(int)Pos{
    return [DNA objectAtIndex:Pos];
}

-(int)hammingDistance:(Cell *)BCell{
    int count;
    for (int i=0; i<100; i++) {
        if ([DNA objectAtIndex:i] != [BCell getGene:i]){
            count++;
        }
    }
    return count;
}

@end
