//
//  Gene.m
//  dna
//
//  Created by Evgeny Trefilov on 11/4/12.
//  Copyright (c) 2012 Evgeny Trefilov. All rights reserved.
//

#import "Gene.h"

static NSMutableOrderedSet* genes;

@implementation Gene

+(NSMutableOrderedSet*) allGenes
{
    if(genes==nil)
    {
        genes=[NSMutableOrderedSet orderedSetWithObjects:@"A",@"T",@"G",@"C",nil];
    }
    return genes;
}

-(id)init
{
    self=[super init];
    if (self)
    {
        //init nucleotid with random value out of all possible
        NSUInteger random=arc4random()%4;
        self.value=[[Gene allGenes] objectAtIndex:random];
    }
    return self;
}

-(void)mutate
{
    //current nucleotid value removed from nucleotids array, new one is selected randomly out of remaining ones
    NSString* currentValue=self.value;
    [[Gene allGenes] removeObject:currentValue];
    NSUInteger random=arc4random()%3;
    self.value=[[Gene allGenes] objectAtIndex:random];
    //push back removed value
    [[Gene allGenes] addObject:currentValue];
}


@end
