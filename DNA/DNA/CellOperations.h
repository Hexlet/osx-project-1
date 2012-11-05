//
//  CellOperations.h
//  DNA
//
//  Created by Daniel Kurapov on 11/6/12.
//  Copyright (c) 2012 Daniel Kurapov. All rights reserved.
//

#ifndef DNA_CellOperations_h
#define DNA_CellOperations_h

#import "Cell.h"

@interface Cell (dnaOperations)

-(void) mutate:(NSInteger)mutate_percent;

@end

@implementation Cell (cellOperations)

-(void) mutate:(NSInteger)mutatePercent
{
    if (mutatePercent <= 0 || mutatePercent > 100 )
        return;
    
    NSInteger mutableCount = 0;
    mutableCount = round((float)(self.DNA.count * mutatePercent) / 100);
    
    NSMutableArray *tempPos = [NSMutableArray arrayWithCapacity:mutableCount];
    
    for (int i = 0; i < mutableCount; ++i)
    {
        NSInteger randPos = arc4random() % self.DNA.count;
        if ([tempPos containsObject:[NSNumber numberWithInteger:randPos]])
            i--;
        else
        {
            [tempPos addObject:[NSNumber numberWithInteger:randPos]];
            
            while (TRUE)
            {
                NSString *randNucl = [self.dna_nucliotide objectAtIndex:arc4random() % self.dna_nucliotide.count];
                if (randNucl != [self.DNA objectAtIndex:randPos])
                {
                    [self.DNA replaceObjectAtIndex:randPos withObject:randNucl];
                    break;
                }
            }
            
        }
    }
    
    NSLog(@"Positions for mutation: %@", [tempPos componentsJoinedByString:@","]);
    NSLog(@"DNA chain after mutation: %@", [self.DNA componentsJoinedByString:@"-"]);
}

@end

#endif
