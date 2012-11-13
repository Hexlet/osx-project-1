//
//  Cell.m
//  DNA
//
//  Created by wumin on 06.11.12.
//  Copyright (c) 2012 wumin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) initWhisLenghtDna: (int) LenghtDNA {
    self = [super init];
    if (self) {
        
        numLenghtDNA = LenghtDNA;
        
        // массив возможных  кислот
        acids = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        
        // массив ДНК
        DNA = [NSMutableArray arrayWithCapacity: LenghtDNA];
        
        // заполняем ДНК
        for (int i=0; i<LenghtDNA; i++) {
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
    
    int collisionCount = numLenghtDNA;
    
    // сравниваем DNA 
    for (int i=0; i < [DNA count]; i++) {
        if ([[DNA objectAtIndex:i] isEqualToString: [cellDNA objectAtIndex: i]]) {
            collisionCount--;
        }
    }
    
    return  collisionCount;
}

//-(int)lDNA{
//    return [DNA count];
//}

@end


