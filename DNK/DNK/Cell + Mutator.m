//
//  Cell + Mutator.m
//  DNK
//
//  Created by Администратор on 11/2/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "Cell + Mutator.h"
#import "Cell.h"

@implementation Cell (Mutator)
NSString *chr;
NSMutableArray *number;

- (void) mutate:(int)percent
{
    
    if ((percent<=100)&&(percent>=0))
    {
        self.arnd = [[NSMutableArray alloc] initWithCapacity:100];
        
        for (int b=0; b<100; b++) {
            [self.arnd insertObject:@"NO" atIndex:b];
        }
        
        for (int d=percent; d>0; d--)
        {
            int rnd = arc4random() %100;
            
            while (self.arnd[rnd]==@"YES")
            {
                rnd = arc4random() %100;
            }
            
            [self.arnd replaceObjectAtIndex:rnd withObject:@"YES"];
            chr = self.DNA[rnd];
            
            do
            {
                self.DNA[rnd]=self.nucleotides[arc4random() %4];
            } while (self.DNA[rnd] == chr);
        }
    }
}

@end
