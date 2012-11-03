//
//  Cell.m
//  DNAProject
//
//  Created by Denys Volokh on 1/11/12.
//  Copyright (c) 2012 Denys Volokh. All rights reserved.
//

#import "Cell.h"

#define dnaChars @[@"A", @"T", @"G", @"C"]
#define CHAIN_LENGTH 100

@implementation Cell

@synthesize DNA;

- (id) init
{
    if ((self = [super init]))
    {
        DNA = [[NSMutableArray alloc] initWithCapacity:CHAIN_LENGTH];
        
        int i=0;
        for (i = 0; i < CHAIN_LENGTH; i++)
        {
            [DNA setObject:[self generateCharWithExclusion:nil] atIndexedSubscript:i];
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

// Функция генерирует случайный символ из заданной коллекции, может также учитывать исключение из коллекции 
-(NSString *) generateCharWithExclusion: (NSString *)exclude;
{
    NSMutableArray *chars = [[NSMutableArray alloc] initWithArray:dnaChars];
    if (exclude != nil)
    {
        [chars removeObject:exclude];
    }
    int randomIndex = arc4random() % [chars count];
    return [chars objectAtIndex:randomIndex];
}

- (NSString *)toString
{
    return [DNA componentsJoinedByString:@""];
}

@end
