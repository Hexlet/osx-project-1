//
//  Cell+Mutate.m
//  DNAProject
//
//  Created by test on 05.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell+Mutate.h"

@implementation Cell (Mutate)

-(void)Mutate:(int)X{
    NSString *letters = @"ATGС";
    NSString *Z = @"Z";
    int r,COU = 0;
    do {
        r = arc4random()%100;
        if ([DNA objectAtIndex:r] != Z){
            COU++;
            [DNA replaceObjectAtIndex:r withObject:Z];  
        }
    } while (COU < X);

    for (int i=0; i<100; i++) {
        if ([DNA objectAtIndex:i] == Z){
          [DNA replaceObjectAtIndex:i  withObject:[NSString stringWithFormat: @"%C",[letters characterAtIndex:arc4random()%4]]];
        }
    }
    
}
@end
