//
//  main.m
//  hw1
//
//  Created by Пацера on 03.11.12.
//  Copyright (c) 2012 patzera. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"


@interface Cell(Mutator)

-(void)mutate:(int) p;

@end

@implementation Cell(Mutator)


-(void)mutate:(int) p;{
    if (p>100){
        NSLog(@"Max 100.");
        return;
    }
    
    int i, ii;
    int x=(int)((float)(MAX_CELL)/100 * p);
    BOOL can_add;
    NSUInteger rnd;
    NSMutableArray *tmp =[NSMutableArray arrayWithCapacity:x];
 
    for (i=0; i<x; i++) {
        [tmp addObject:[NSNumber numberWithInt:-1]];
    }
    
    i = 0;
    rnd = arc4random() % [self.nda count];
    can_add = YES;
        
    while (i<x) {
        for (ii=0; ii<=i; ii++){
            if ([tmp objectAtIndex: ii] == [NSNumber numberWithUnsignedInteger: rnd]) {
                can_add = NO;
            }
        }

        if (can_add==YES){
            [tmp replaceObjectAtIndex:i withObject: [NSNumber numberWithUnsignedInteger: rnd]];
            i++;
            }
        else{
            rnd = arc4random() % [self.nda count];
            can_add=YES;
        }
    }
    
    for (i=0; i<=[tmp count]; i++) {
        [self.nda replaceObjectAtIndex:i withObject:[self.arr objectAtIndex: arc4random() % [self.arr count]]];
    }
    
}
@end




int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1, *cell2;

        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"before mutation - %i", [cell1 hammingDistance:cell2]);
        [cell1 mutate:10];
        [cell2 mutate:30];
        NSLog(@"after mutation - %i", [cell1 hammingDistance:cell2]);
      
    }
    return 0;
}

