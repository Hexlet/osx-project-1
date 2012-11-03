//
//  Cell+Mutator.m
//  DNAProject
//
//  Created by Vitaly on 01.11.12.
//  Copyright (c) 2012 Vitaly Petrov. All rights reserved.
//

#import "Cell+Mutator.h"
#include <stdlib.h>

const int MIN_PERCENT = 1;
const int MAX_PERCENT = 100;

@implementation Cell (Mutator)

-(void) mutate:(int)x {
    int usedIndexes[ARRAY_COUNT];
    int count = ARRAY_COUNT*x*0.01;
    int index = 1;
    
    if(count>=MIN_PERCENT&&count<=MAX_PERCENT){
        usedIndexes[0] = arc4random() % ARRAY_COUNT;
        for (int i=1; i<count; i++) {
            boolean_t flag = TRUE;
            while (flag) {
                flag = FALSE;
                int rand = arc4random() % ARRAY_COUNT;
                for (int k=0; k<index; k++) {
                    if(usedIndexes[k] == rand) {
                        flag = TRUE;
                    }
                }
                if(!flag) {
                    usedIndexes[index] = rand;
                    index++;
                }
            }
        }
    }
    
    for (int i=0; i<count; i++) {
        int r = arc4random() % 100;
        if (r>=0 && r<25) {
            self.array[usedIndexes[i]] = @"A";
        } else if(r>=25 && r<50){
            self.array[usedIndexes[i]] = @"T";
        } else if(r>=50 && r<75) {
            self.array[usedIndexes[i]] = @"G";
        } else if(r>=75 && r<100) {
            self.array[usedIndexes[i]] = @"C";
        }
    }

}

@end
