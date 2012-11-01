//
//  Cell+Mutator.m
//  AssingmentDNA
//
//  Created by LEV on 30.10.12.
//  Copyright (c) 2012 LEV. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) percentage {
    //initialize random variables
    int random = 0;
    unichar random_char;
    
    //replace random (percentage) characters from DNA
    //with new random characters
    for (int i=0; i<percentage; i++) {
        random = arc4random() % [self.genes length];
        random_char = [self.genes characterAtIndex:random];
        [self.DNA replaceObjectAtIndex:arc4random() % [self.DNA count] withObject:[[NSString class] stringWithCharacters:&(random_char) length:1]];
    }
    
}

@end
