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
    int A[self.DNA.count];
    for(int i=0; i<self.DNA.count; i++){
        A[i] = i;
    }
    for(int i=0; i<self.DNA.count; i++){
        int r = arc4random() % self.DNA.count;
        if(i!=r){
            A[r] ^= A[i];
            A[i] ^= A[r];
            A[r] ^= A[i];
        }
    }

    for(int i=0; i<X; i++) {
        int r = arc4random() % 3;
        if(self.DNA[A[i]]==@'A'){
            switch(r) {
                case 0: self.DNA[A[i]] = @'T'; break;
                case 1: self.DNA[A[i]] = @'G'; break;
                case 2: self.DNA[A[i]] = @'C'; break;
            }
        } else if(self.DNA[A[i]] ==@'T'){
            switch(r) {
                case 0: self.DNA[A[i]] = @'A'; break;
                case 1: self.DNA[A[i]] = @'G'; break;
                case 2: self.DNA[A[i]] = @'C'; break;
            }
        } else if(self.DNA[A[i]] ==@'G'){
            switch(r) {
                case 0: self.DNA[A[i]] = @'A'; break;
                case 1: self.DNA[A[i]] = @'T'; break;
                case 2: self.DNA[A[i]] = @'C'; break;
            }
        } else if(self.DNA[A[i]] ==@'C'){
            switch(r) {
                case 0: self.DNA[A[i]] = @'A'; break;
                case 1: self.DNA[A[i]] = @'T'; break;
                case 2: self.DNA[A[i]] = @'G'; break;
            }
        }
    }
}

@end
