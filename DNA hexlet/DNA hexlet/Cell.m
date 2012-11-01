//
//  Cell.m
//  DNA hexlet
//
//  Created by Eugene on 01.11.12.
//  Copyright (c) 2012 Eugene. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize dna;

-(id)init{
    dna=[[NSMutableArray alloc]init];
    NSArray *lettersArray=@[@"A",@"T",@"C",@"G"];
    int randomIndex;
    for(int i=0;i<100;i++){
           randomIndex =(int)(arc4random() % lettersArray.count);
        [dna addObject:[lettersArray objectAtIndex:randomIndex]];

    }
    self=[super init];
    return  self;
}

-(int)hammingDistance:(Cell*)cell{
    int count=0;
    for(int index=0;index<cell.dna.count;index++){
        if (![[cell.dna objectAtIndex:index]isEqualToString:[self.dna objectAtIndex:index]]) {
            count++;
        }
    }
    
    return count;
}

-(void)print{
    
    for(int index=0;index<dna.count;index++){
        printf("%s",[[dna objectAtIndex:index]UTF8String]);
    }
    
    NSLog(@"\n");
}

@end

