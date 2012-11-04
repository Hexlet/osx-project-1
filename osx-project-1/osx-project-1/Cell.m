//
//  Cell.m
//  osx-project-1
//
//  Created by Sergey Kondratyev on 01.11.12.
//  Copyright (c) 2012 Sergey Kondratyev. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA;

- (id) init {
    self = [super init];
    
    if (self) {
        
        DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int i=0; i<100; i++) {
            
            int rand = (int)(arc4random() % 4);
            
            NSString *str = NULL;
            if (rand == 0) {
                str = @"A";
            }else if (rand == 1) {
                str = @"T";
            }else if (rand == 2) {
                str = @"G";
            }else if (rand == 3) {
                str = @"C";
            }
            
            [DNA addObject:str];
            //NSLog(@"Addition NSSring object str: %@",str);
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)ins {
    
    NSMutableArray *arr1 = [self DNA];
    NSMutableArray *arr2 = [ins DNA];
    int count = 0;
    
    for (int i=0; i<100; i++) {
        
        NSString *str1 = [arr1 objectAtIndex:i];
        NSString *str2 = [arr2 objectAtIndex:i];
        
        if (str1 != str2) {
            //NSLog(@"str1 %@ str2 %@",str1, str2);
            count++;
        }
    }
    return count;
}
@end
