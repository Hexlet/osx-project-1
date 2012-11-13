//
//  Cell.h
//  DNA
//
//  Created by artem on 11/13/12.
//  Copyright (c) 2012 Wilfred. All rights reserved.
//

#import <Foundation/Foundation.h>

# define DNA_length 100

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

-(int) hammingDistance:(Cell *) DNA_elem;

@end
