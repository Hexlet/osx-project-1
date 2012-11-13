//
//  main.m
//  ProjectOne
//
//  Created by Pavel Gerashchenko on 09.11.12.
//  Copyright (c) 2012 Pavel Gerashchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        int i;
        for (i=0; i<=3; i++) {

            NSLog(@"слышь[%i]",i);
    
        }
        sleep(1);
       
        NSLog(@"What??");
        
    }
    return 0;
}
