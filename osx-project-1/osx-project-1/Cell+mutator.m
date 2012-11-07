//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by Ivan Kuzmin on 11/5/12.
//  Copyright (c) 2012 Ivan Kuzmin. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)


-(void)mutate: (int)percent {
    assert(percent <= 100 && percent >= 0);
    
    int absolute = (LENGTH * percent) / 100;
    
    int position[absolute];
    
    for (int i = 0; i < absolute; i++) {
        position[i] = -1;
    }
    
    
    
    for (int i = 0; i<absolute; i++) {
        position[i] = [Cell getUniqueLocus: &position[0] numerum: absolute];
        //NSLog(@"%i",position[i]);
        
        [self.DNA replaceObjectAtIndex: position[i] withObject:
         [self getNewNucteotide: [self.DNA objectAtIndex: position[i]]]];
        
    
    }
}


+(int)getUniqueLocus: (int *)usedLocuses numerum: (int)number {
    int newLocus;

    bool check = TRUE;
    while (check) {
        newLocus = arc4random() % LENGTH;
        check = FALSE;
        for (int i = 0; i < number; i++) {
            
            //NSLog(@"usedloc:%i",usedLocuses[i]);
            //NSLog(@"newloc:%i",newLocus);
            
            if (usedLocuses[i] == newLocus) {
                check = TRUE;
            }
        }
        //NSLog(@"----------------------");
            
    }
    
    return newLocus;
}

-(NSString*)getNewNucteotide: (NSString*)oldOne {
    NSString *nucleotide;
    bool check = TRUE;
    while (check) {
        int randIndex = arc4random() % 4;
        nucleotide = [self.nucleobases objectAtIndex:randIndex];
        check = FALSE;
        if (nucleotide == oldOne) {
            check = TRUE;
        }
    }
    
    return nucleotide;

}

@end
