//
//  main.m
//  #1 Cell
//
//  Created by evlogii on 11/6/12.
//  Copyright (c) 2012 evlogii. All rights reserved.
//

#import "Cell.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]){
    @autoreleasepool {
        Cell *myCell0;
        Cell *myCell1;
        myCell0 = [[Cell alloc] init];
        myCell1 = [[Cell alloc] init];
        //[myCell0 printDna];
        printf("%i\n",[myCell0 getHammingDistance:myCell1]);
        [myCell0 mutate:25];
        [myCell1 mutate:25];
        printf("%i\n",[myCell0 getHammingDistance:myCell1]);
    }
    return 0;
}
