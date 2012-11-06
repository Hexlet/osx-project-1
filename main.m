//
//  main.m
//  DNA
//
//  Created by Ivancov Alexander on 11/3/12.
//  Copyright (c) 2012 GameStore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutantor.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *DNANormalPeople = [[Cell alloc] init];
        
        [DNANormalPeople print];
        
        Cell *DNAOtherPeople = [[Cell alloc] init];
    
        [DNAOtherPeople print];
        
        NSLog(@"%i", [DNANormalPeople hammingDistanceDNA:DNAOtherPeople]);
        
        [DNAOtherPeople mutatePercent:100];
        [DNAOtherPeople print];
        [DNANormalPeople print];
        
        NSLog(@"%i", [DNANormalPeople hammingDistanceDNA:DNAOtherPeople]);
    }
    return 0;
}

