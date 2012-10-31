//
//  Cell+Mutate.m
//  DNA
//
//  Created by Max Bazaliy on 31.10.12.
//  Copyright (c) 2012 Max Bazaliy. All rights reserved.
//

#import "Cell+Mutate.h"

@implementation Cell(Mutate)


- (void)mutate: (int)percent {
    
    NSMutableArray *newSymbols = [NSMutableArray arrayWithCapacity:percent];
    newSymbols = [self fillArray:newSymbols withRandomSymbolsCount:percent];
    
    for (int a = 0; a < percent; a++) {
     //   NSLog(@"Object %@ at index: %i would be replaced with: %@",self.DNA[a], a, newSymbols[a]);
        self.DNA[a] = newSymbols[a];
     
    }
}

@end
