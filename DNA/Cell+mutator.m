//
//  Cell+mutator.m
//  DNA
//
//  Created by Тимофей on 11.11.12.
//  Copyright (c) 2012 Тимофей. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
+(id)mutate: (int)number {
  //  char mutate_array[number];
//    mutate_array[] = [Cell dnaRandom];

NSMutableArray *marrayr = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < number; i++) {
        int number = arc4random()%100;
        [marrayr addObject:[NSString stringWithFormat:@"%d", number]];
    }

    NSLog(@"%@", marrayr);

    
}






@end
