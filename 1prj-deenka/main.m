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
        
        //create 2 elements
        Cell *leeloo, *korben;
        leeloo = [[Cell alloc] init];
        korben = [[Cell alloc] init];

        
        NSLog(@"Hamming Distance = %i",[leeloo hammingDistance:korben]);
        
        [korben print];
        [korben mutator:10];
/*        for (int i=0; i<100; i++) {
         NSLog(@"%li",random()%5 );
         }
*/
 }
    
    // ToDo: не забыть помыть мутатор
    return 0;
}

