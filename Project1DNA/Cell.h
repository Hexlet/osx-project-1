//
//  Cell.h
//  Project1DNA
//
//  Created by TT on 31.10.12.
//  Copyright (c) 2012 TT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *DNA;
    NSArray *DNALiterals;
}

@property (nonatomic, readonly) NSMutableArray *DNA;

-(id) init;
-(int) hammingDistance:(Cell *) cell;

@end
