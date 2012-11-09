//
//  Cell.m
//  DNA
//
//  Created by Dmytro Povechanin on 06.11.12.
//  Copyright (c) 2012 Dmytro Povechanin. All rights reserved.
//

#import "Cell.h"

const int CELL_DIMENTION = 100;

@implementation Cell
    {
        NSMutableArray *DNA;
    }

    -(id) init {
        self = [super init];
        if(self){
            DNA = [NSMutableArray arrayWithCapacity:CELL_DIMENTION];
            int i;
            NSArray *DNA_SRC = [NSArray arrayWithObjects:@"A", @"T", @"G",@"C", nil];
            for(i = 0; i < CELL_DIMENTION; i++){
                [DNA insertObject:[DNA_SRC objectAtIndex:arc4random()%4] atIndex:i];
            }
        }
        return self;
    }

    -(NSMutableArray *) getDNA{
        return DNA;
    }

    +(int) hammingDistance:(Cell *)srcDNA trgt:(Cell *)trgtDNA {
        int i, distance = 0;
        for( i = 0; i < CELL_DIMENTION; i++){
            if([srcDNA.getDNA objectAtIndex:i] != [trgtDNA.getDNA objectAtIndex:i]){
                distance ++;
            }
        }
        return distance;
    }

    -(NSString *) description {
        int i;
        NSString *lineRepresentation = @"";
        for(i = 0; i < CELL_DIMENTION; i++)
            lineRepresentation = [lineRepresentation stringByAppendingString:[DNA objectAtIndex:i]];
        return lineRepresentation;
    }

@end
