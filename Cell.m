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

- (id)init {
	
    self = [super init];

	if (self) {
        
        DNA = [[NSMutableArray alloc]initWithCapacity:countDNA];
        
        countDNA = 100;
        
        for (int i=0; i<countDNA; i++) {
            
            [DNA addObject:[self generateSymbol]];
            
        }
   }
        return self;
}

-(int)hammingDistance:(Cell *)cell1 {
    
    int countEqual=0;
    for (int i=0; i<countDNA; i++) {
        BOOL equal = [[self.DNA objectAtIndex:i] isEqualToString:[cell1.DNA objectAtIndex:i]];
        if (equal){
            countEqual++;
        }
    }
    return countEqual;
    
}

-(NSString*)generateSymbol {
    int randomNumber = arc4random() % 4;
    NSString *symbol = [[NSString alloc]init];
    switch(randomNumber) {
        case 0: symbol = @"A"; break;
        case 1:symbol = @"T";break;
        case 2:symbol = @"G"; break;
        case 3:symbol = @"C"; break;
    }
    return symbol;
}
@end
