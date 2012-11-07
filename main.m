//
//  main.m
//  DNK
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 witem.artem@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Call.h"

@interface Call (Mutator)

-(void)mutate: (int) x;

@end

@implementation Call (Mutator)

-(void)mutate: (int) x {
    int i=0;
    int j=100/x;
    for (count=0 ; count<x; count++ ) {
        i+=arc4random()%j;
        switch (arc4random()%4) {
            case 0:
                [DNA replaceObjectAtIndex:i withObject:@"A"];
                break;
            case 1:
                [DNA replaceObjectAtIndex:i withObject:@"T"];
                break;
            case 2:
                [DNA replaceObjectAtIndex:i withObject:@"G"];
                break;
            case 3:
                [DNA replaceObjectAtIndex:i withObject:@"C"];
                break;
                
            default:
                break;
        }
        i++;
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Call *myDna1,*myDna2;
        myDna1 = [[Call alloc] init];
        myDna2 = [[Call alloc] init];
        
        NSLog(@"%d",[myDna1 hammingDistance:myDna2]);
        
        [myDna1 mutate:25];
        [myDna2 mutate:25];
        
        NSLog(@"%d",[myDna1 hammingDistance:myDna2]);
        
        
        
    }
    return 0;
}

