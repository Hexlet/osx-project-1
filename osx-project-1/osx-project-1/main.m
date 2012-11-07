//
//  main.m
//  osx-project-1
//
//  Created by Ivan Kuzmin on 11/5/12.
//  Copyright (c) 2012 Ivan Kuzmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        Cell *Hellen, *Hala;
        
        Hellen = [[Cell alloc] init];
        Hala = [[Cell alloc] init];
        
        printf("----------\n");
        
        int i = [Hellen hammingDistance: Hala];
        
        printf("Before mutation HD: %i\n",i);
        
        [Hala mutate:10];
        
        int j = [Hellen hammingDistance: Hala];
      
        printf("After mutation HD: %i\n",j);
        
        
        
    }
    return 0;
}

