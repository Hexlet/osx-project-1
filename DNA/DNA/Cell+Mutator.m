//
//  Cell+Mutator.m
//  DNA
//
//  Created by Павел Матвиенко on 02.11.12.
//  Copyright (c) 2012 MaMa Creative Studio. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(int) percentsOfDNA{
    
    int amountOfDNAForReplace = [self.DNA count] / 100 * percentsOfDNA;
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    int i;
    for (i=0; i<[self.DNA count]; i++) {
        
        [tempArray addObject:[NSNumber numberWithInt:i]];
    }
    
    //Mix tempArray
    for (i=0; i<amountOfDNAForReplace; i++) {
        
        int randomIndex = arc4random() % ([self.DNA count]-1);
        NSNumber *tempVar = [[NSNumber alloc] initWithInt:[[tempArray objectAtIndex:randomIndex] intValue]];
        [tempArray replaceObjectAtIndex:randomIndex withObject:[tempArray objectAtIndex:i]];
        [tempArray replaceObjectAtIndex:i withObject:tempVar];
    }
    
    for (i=0; i<amountOfDNAForReplace; i++) {
        
        NSString *randomValue;
        int rnd = arc4random() % 3;
        if (rnd == 0) randomValue = [NSString stringWithFormat:@"A"];
        if (rnd == 1) randomValue = [NSString stringWithFormat:@"T"];
        if (rnd == 2) randomValue = [NSString stringWithFormat:@"G"];
        if (rnd == 3) randomValue = [NSString stringWithFormat:@"C"];
        
        [self.DNA replaceObjectAtIndex:[[tempArray objectAtIndex:i] intValue] withObject:randomValue];
     }
}

@end
