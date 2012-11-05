//
//  main.m
//  DNA
//
//  Created by Kirill Beletskiy on 11/2/12.
//  Copyright (c) 2012 Kirill Beletskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
      
        Cell *myCell=[[Cell alloc] init];
        Cell *myCell1=[[Cell alloc] init];
        
        [myCell printDNA];
        
    }
    return 0;
}

