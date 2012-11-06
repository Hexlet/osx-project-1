//
//  Cell+mutator.m
//  DNA
//
//  Created by Admin on 11/2/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate: (int) X {
    int n = self.DNASize * X / 100;
    
    int A[self.DNASize];
    for(int i=0; i<self.DNASize; i++){
        A[i] = i;
    }
    
    for(int i=0; i<n; i++){
        int r = arc4random() % self.DNASize;
        if(i!=r){
            // swap A[i] and A[r]
            A[r] ^= A[i];
            A[i] ^= A[r];
            A[r] ^= A[i];
        }
    }

    for(int i=0; i<n; i++) {
        int r = arc4random() % 3;
        int l = 0;
        
        for(int j=0; j<=r; j++){
            if(self.DNA[A[i]] == self.Symbols[j])
                l = 1;
        }
        self.DNA[A[i]] = self.Symbols[r+l];
    }
}

@end
