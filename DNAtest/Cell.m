//
//  Cell.m
//  DNAtest
//
//  Created by herku on 11/14/12.
//  Copyright (c) 2012 herku. All rights reserved.
//


#import "Cell.h"

@implementation Cell

@synthesize DNA; 

-(id)init 
{
    self = [super init];
    
    if (self) {
        
        DNA = [[NSMutableArray alloc] initWithCapacity:100];
        
        for (int i=0; i<100; i++) {
            
            [DNA addObject:[[self class] getRandomDNA:nil]];
            
        }
    }
    return self;
}


+(NSString *)getRandomDNA:(id)rGenom{
    
    NSArray *genom;
   
    genom = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
    
    return genom[arc4random_uniform([genom count])];
}


-(id)genomIndex:(NSUInteger)index {
    
    return DNA[index];
    
}

-(NSString *)description
{
    return [DNA componentsJoinedByString:@""];
}

-(int)hammingDistance:(Cell *)HD {
    
    int hd = 0;
    
    for (int i=0; i<100; i++) {
        
        if ([[DNA objectAtIndex:i] isNotEqualTo:[HD genomIndex:i]]) hd++;
        
    }
    
    return hd;
}

@end