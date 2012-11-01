//
//  Cell.m
//  DNAProject
//
//  Created by Denys Volokh on 1/11/12.
//  Copyright (c) 2012 Denys Volokh. All rights reserved.
//

#import "Cell.h"

#define dnaChars [NSArray arrayWithObjects: @"A",@"T",@"G",@"C",nil]
#define CHAIN_LENGTH 10

@implementation Cell

@synthesize DNA;

- (id) init
{
    if ((self = [super init]))
    {
        DNA = [[NSMutableArray alloc] initWithCapacity:100];
        
        int i=0;
        for (i = 0; i < CHAIN_LENGTH; i++)
        {
            [DNA setObject:[self generateChar] atIndexedSubscript:i];
        }
    }
    
    return self;
}

-(int) hammingDistance: (Cell *) cell
{
    int i, distance = 0;
    
    for (i = 0; i < CHAIN_LENGTH; i++)
    {
        if (![[cell.DNA objectAtIndex:i] isEqualToString: [self.DNA objectAtIndex:i]])
            distance++;
    }
    
    return distance;
}

#pragma Utils

// Функция генерирует случайный символ из заданной коллекции
-(NSString *) generateChar
{
    int randomIndex = arc4random() % 4;
    return [dnaChars objectAtIndex:randomIndex];
}

- (NSString *)toString
{
    return [DNA componentsJoinedByString:@""];
}

@end
