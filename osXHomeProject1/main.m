//
//  main.m
//  osXHomeProject1
//
//  Created by admin on 11/9/12.
//  Copyright (c) 2012 Home inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray *DNA = [[NSMutableArray alloc] init];
        for (int i = 0; i <100; i++) {
            int newElement = random();
            [DNA addObject:[NSString stringWithFormat :@"%d",newElement]];
        }
        NSLog(@"%@", DNA);
    }
    return 0;
}

