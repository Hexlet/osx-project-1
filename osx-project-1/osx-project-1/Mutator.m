//
//  Mutator.m
//  osx-project-1
//
//  Created by Sergey Kondratyev on 03.11.12.
//  Copyright (c) 2012 Sergey Kondratyev. All rights reserved.
//

#import "Mutator.h"

@implementation Cell (mutator)

- (void) mutate:(int)percent {
    
    //NSUInteger s = (sizeDna / 100)* percent;

    if (0 < percent < 100) {
        
        NSArray *nucliotids = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        
        for (int i = 0;i<percent; i++) {
            
            NSString *randNucliotid = [[self DNA] objectAtIndex:((int)arc4random() % [nucliotids count])];
            int randIndexDna = ((int) arc4random() % [DNA count]);
           
            if ([randNucliotid isNotEqualTo: [[self DNA] objectAtIndex: randIndexDna]]) {
                
                [DNA insertObject:randNucliotid atIndex:randIndexDna];
                
            } else {
                i--;
            }
        }
    } else {
        NSLog(@"Value percent define over 100");
    }
}
@end
