//
//  Cell.m
//  DNKProject
//
//  Created by IT-Dimension on 11/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell 

@synthesize DNA, countDNA;

-(Cell*)init {
    [super init];
    if (self) {
        
        DNA = [[NSMutableArray alloc]initWithCapacity:countDNA];
        
        countDNA = 100;
        
        for (int i=0; i<countDNA; i++) {
            
            NSString *symbol = [[NSString alloc]init];
            symbol = [self generateSymbol];
            [DNA addObject:symbol];
            
        }
   }
        return self;
}

-(int)hammingDistance:(Cell *)cell1 {
    
    int countEqual=0;
    int countNotEqual=0;
    for (int i=0; i<countDNA; i++) {
        BOOL equal = [[self.DNA objectAtIndex:i] isEqualToString:[cell1.DNA objectAtIndex:i]];
        if (!equal){
            countNotEqual++;
        }
        else {
            countEqual++;
        }
            
    }
    return countEqual;
    
}

-(NSString*)generateSymbol {
    int randomNumber =1+arc4random() % 4;
    NSString *symbol = [[NSString alloc]init];
    switch(randomNumber) {
        case 1: symbol = @"A"; break;
        case 2:symbol = @"T";break;
        case 3:symbol = @"G"; break;
        case 4:symbol = @"C"; break;
    }
    return symbol;
}
@end
