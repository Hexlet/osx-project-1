//
//  CellMutator.m
//  osx-project-1
//
//  Created by Murat Temirov on 26.12.12.
//  Copyright (c) 2012 Murat Temirov. All rights reserved.
//

#import "CellMutator.h"

@implementation Cell (Mutator)

-(void) mutate:(int)replaceXpercent{
    int arrayNum = ([self.dna count]*replaceXpercent/100)%100;
//    for (int i=0; i<arrayNum; i++) {
//        [self
//    }
    NSMutableArray *usedNumber = [NSMutableArray arrayWithCapacity:arrayNum] ;
//    NSLog(@"%li", sizeof(usedNumber));
//    [usedNumber ]
    while ([usedNumber count]<arrayNum) {
        NSNumber *randomNumberFromDNA = @(arc4random() % [self.dna count]);
        NSString *oldChar = [self.dna objectAtIndex:[randomNumberFromDNA unsignedIntValue]];
        NSString *newChar = [self generateChar];
        if(![oldChar isEqualToString:newChar] && ![usedNumber containsObject:randomNumberFromDNA]){
            [self.dna replaceObjectAtIndex:[randomNumberFromDNA unsignedIntValue] withObject:newChar];
            [usedNumber addObject:randomNumberFromDNA];
//            NSLog(@"Get char %@ /replace for %@ at index %@", oldChar,newChar,randomNumberFromDNA);
        }
    }
}

@end
