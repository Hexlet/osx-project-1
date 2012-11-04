//
//  Cell.m
//  DNA
//
//  Created by Eraser on 11/4/12.
//  Copyright (c) 2012 Eraser. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA;

-(id) init
{
    DNALenght= 100;
    
    if ((self = [super init]))
    {
        DNA = [NSMutableArray arrayWithCapacity: DNALenght];
        
        for (int i = 0; i < DNALenght; i++) DNA[i] = [[Nucleotid alloc] init];
    }
    
    return self;
}

-(int) hammingDistance: (Cell *) c
{
    int hd = 0;

    for (int i = 0; i < DNALenght; i++) if ( ![DNA[i] isEqual: c.DNA[i]] ) hd++;
    
    return hd;
}

-(void) print
{
    char DNAString[DNALenght+1];
    
    for (int i = 0; i < DNALenght; i++) DNAString[i] = [DNA[i] getSymbol];
    
    DNAString[DNALenght] = '\0';
    
    NSLog(@"%s", DNAString);
}

@end

    

@implementation Nucleotid : NSObject

@synthesize nucleo;


+(nucleotides) random
{
    return (nucleotides)(arc4random() % (int) 4);
}

-(id) init
{
    if ((self = [super init])) nucleo = [Nucleotid random];
    
    return self;
    
}

-(BOOL) isEqual:(Nucleotid *) n
{
    return (nucleo == [n nucleo])? TRUE : FALSE;
}

-(char) getSymbol
{
    switch (nucleo)
    {
        case A: return 'A';
        case T: return 'T';
        case G: return 'G';
        case C: return 'C';
    }
}

@end