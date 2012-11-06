//
//  Cell.m
//  DNA
//
//  Created by Eraser on 11/4/12.
//  Copyright (c) 2012 Eraser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@implementation Cell

-(id) init
{
    DNALenght= 100;
    
    if ((self = [super init]))
    {
        _DNA = [NSMutableArray arrayWithCapacity: DNALenght];
        
        for (int i = 0; i < DNALenght; i++) _DNA[i] = [[Nucleotid alloc] init];
    }
    
    return self;
}

-(int) hammingDistance: (Cell *) c
{
    int hd = 0;

    for (int i = 0; i < DNALenght; i++) if ([_DNA[i] isNotEqual: c.DNA[i]]) hd++;
    
    return hd;
}

-(void) print
{
    char DNAString[DNALenght+1];
    
    for (int i = 0; i < DNALenght; i++) DNAString[i] = [_DNA[i] getSymbol];
    
    DNAString[DNALenght] = '\0';
    
    NSLog(@"%s", DNAString);
}

@end

    

@implementation Nucleotid : NSObject

+(nucleotides) random
{
    return (nucleotides)(arc4random() % (int) 4);
}

-(id) init
{
    if ((self = [super init])) _nucleic = [Nucleotid random];
    
    return self;
    
}

-(BOOL) isNotEqual:(Nucleotid *) n
{
    return _nucleic != [n nucleic];
}

-(char) getSymbol
{
    switch (_nucleic)
    {
        case A: return 'A';
        case T: return 'T';
        case G: return 'G';
        case C: return 'C';
    }
}

@end