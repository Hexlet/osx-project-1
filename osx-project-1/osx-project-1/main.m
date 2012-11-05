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
        
        NSLog(@"----------");
        
        int i = [Hellen hammingDistance: Hala];
        
        NSLog(@"Before mutation HD: %i",i);
        
        [Hala mutate:99];
        
        int j = [Hellen hammingDistance: Hala];
      
        NSLog(@"After mutation HD: %i",j);
        
        
        
    }
    return 0;
}

