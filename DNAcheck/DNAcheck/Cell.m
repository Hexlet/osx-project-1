//
//  Cell.m
//  DNAproject
//
//  Created by Ilya Batozskiy on 30.10.12.
//  Copyright (c) 2012 Ilya Batozskiy. All rights reserved.
//

#import "Cell.h"

@implementation Cell

NSMutableArray *DNA;

-(id) init{
    self=[super init];
    if (self) {
        int amino;
        
        for (int i=0; i<100; i++) {
            amino=arc4random() % 3;
            switch (amino) {
                case 0:
                    [DNA addObject:@"A"];
                    break;
                case 1:
                    [DNA addObject:@"T"];
                    break;
                case 2:
                    [DNA addObject:@"G"];
                    break;
                case 3:
                    [DNA addObject:@"C"];
                    break;
                    
                default:
                    break;
            }
            
        }
    }
    return self;
}

@end
