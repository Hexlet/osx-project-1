//
//  main.m
//  1prj-deenka
//
//  Created by Wladi on 05.11.12.
//  Copyright (c) 2012 noorg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int hddo, hdposle;
        
        //create 2 elements
        Cell *leeloo, *korben;
        leeloo = [[Cell alloc] init];
        korben = [[Cell alloc] init];

        hddo = [leeloo hammingDistance:korben];
        NSLog(@"Hamming Distance = %i",hddo);
        
       // [korben print];
        
//        [leeloo mutator:90];
        [korben mutator:99];

        hdposle = [leeloo hammingDistance:korben];
        NSLog(@"Hamming Distance after mutations = %i",hdposle);
        
        if (hddo == hdposle) NSLog(@"Мутатор мыть нужно!!!");
        
 }
    
    return 0;
}

