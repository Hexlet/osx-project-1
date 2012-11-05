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
    assert(percent <= 100);

    int i = percent;
    
    int position[percent];
    
    for (int i = percent; i--; ) {
        position[i] = -1;
    }
    
    
    
    while (i) {
        position[i] = [Cell getUniqueLocus: &position[0] numerum: percent];
        NSLog(@"%i",position[i]);
        
        int randIndex = arc4random() % 4;
        [self.DNA replaceObjectAtIndex: position[i] withObject:[ self.nucleobases objectAtIndex:randIndex ] ];
        
        i--;
    }
}


+(int)getUniqueLocus: (int *)usedLocuses numerum: (int)number {
    int newLocus;

    bool check = TRUE;
    while (check) {
        newLocus = arc4random() % 100;
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

@end
