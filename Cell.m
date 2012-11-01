//
//  Cell.m
//  DNANickToverovskiy
//
//  Created by Nick Toverovskiy on 30.10.12.
//  Copyright (c) 2012 Nick Toverovskiy. All rights reserved.
//

#import "Cell.h"


@implementation Cell //{
//    NSMutableArray *dna;
//}



-(id) init {
    
    NSLog(@"Initializint Cell instance.");
    
    self = [super init];
    
    //Create a DNA array.
    _dna = [[NSMutableArray alloc] init];
    
    //Init DNA array with 100 random nucleobase letters.
    for (int i=0; i < 100; i++) {
        
                
        //Fill the DNA array.
        [_dna addObject: [self getRandomNucleobaseChar]];
        
        //Debug init.
        //[_dna addObject: @"A"];
        
    }
    
    return self;
}

- (NSString *) getRandomNucleobaseChar {
    
    //Get random integer nucleobase code from 0 to 3.
    NSInteger randomNucleobaseCode = arc4random()%4;
    
    
    // Convert integer code to a letter.
    NSString *randomNucleobaseChar = @"";
    
    switch (randomNucleobaseCode) {
        case 0:
            randomNucleobaseChar = @"A";
            break;
        case 1:
            randomNucleobaseChar = @"G";
            break;
        case 2:
            randomNucleobaseChar = @"C";
            break;
        case 3:
            randomNucleobaseChar = @"T";
            break;
            
        default:
            break;
    }
    
    return randomNucleobaseChar;
}

- (int) hammingDistance: (Cell*) cell {
    
     NSLog(@"Calculatin hamming distance.");

    int hammingDistanceCount = 0;
    NSString *tempStr = @"";
    
    if (cell != nil) {
        for (int i = 0; i < [cell.dna count]; i++) {
            
            
            tempStr = @"";
            if ([cell.dna objectAtIndex: i] != [_dna objectAtIndex:i]) {
                hammingDistanceCount = hammingDistanceCount + 1;
                tempStr = @" *";
            }
            
            NSLog([@"№%d.\t%@ = %@" stringByAppendingString:tempStr], i, [cell.dna objectAtIndex: i], [_dna objectAtIndex:i]);
        }
    }
    
    return hammingDistanceCount;
}

@end
