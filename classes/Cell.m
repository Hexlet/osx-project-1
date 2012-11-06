//
//  Cell.m
//  DNA
//
//  Created by wumin on 06.11.12.
//  Copyright (c) 2012 wumin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init{
    self = [super init];
    if (self) {
        
        // массив возможных  кислот
        acids = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C",nil];
        
        // массив ДНК
        DNA = [NSMutableArray arrayWithCapacity:100];
        
        // заполняем ДКН
        for (int i=0; i<100; i++) {
            int randomAcid = arc4random()%4;
            [DNA addObject:[acids objectAtIndex:randomAcid]];
        }
    
    }
    return self;
}

-(NSArray *)getDNA{
    return DNA;
}

-(int) hammingDistance: (Cell *) cell{
    
    // получаем DNA переданного объекта
    NSArray *cellDNA;
    cellDNA = [cell getDNA];
    
    int collisionCount = 0;
    
    // сравниваем DNA 
    for (int i=0; i < [DNA count]; i++) {
        if ([[DNA objectAtIndex:i] isEqualToString: [cellDNA objectAtIndex: i]]) {
            collisionCount++;
        }
    }
    
    return  collisionCount;
}

@end


