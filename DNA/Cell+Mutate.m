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
    
    int replaceCount = roundf((percent * [self.DNA count]) / 100);
    
    NSMutableArray *newSymbols = [NSMutableArray arrayWithCapacity:replaceCount];
    newSymbols = [self fillArray:newSymbols withRandomSymbolsCount:replaceCount];
    
    for (int a = 0; a < replaceCount; a++) {
        NSString* first = self.DNA[a];              //Object from DNA
        NSString* second = newSymbols[a];           //Object from mutable array
        
        if ([first isEqualToString:second]) {
            //if equal, replace with non-equal object
            NSString *newSymbol = [self symbolFromArray:self.DNA withIgnoreSymbol:(NSString*)newSymbols[a]];
            NSLog(@"Object %@ at index: %i would be replaced with: %@",self.DNA[a], a, newSymbol);
            self.DNA[a] = newSymbol;
        } else {
            //replace
            NSLog(@"Object %@ at index: %i would be replaced with: %@",self.DNA[a], a, newSymbols[a]);
            self.DNA[a] = newSymbols[a];
        //    NSLog(@"%@",self.DNA);
        }
    }
}

- (NSString*)symbolFromArray:(NSMutableArray*)array withIgnoreSymbol: (NSString*)ignore {
for (NSString *symbol in array) {
    if (![symbol isEqualToString:ignore]) {
        return symbol;
        }
    }
    //else return ignore symbol or nil
    return ignore;
}

@end
