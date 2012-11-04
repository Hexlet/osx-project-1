//
//  Cell.h
//  dna-project-1
//
//  Created by Apple on 11/3/12.
//  Copyright (c) 2012 Alexander Gedranovich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;
@property (readonly) NSUInteger size;
@property (readonly) NSString *nucleotides;

-(int) hammingDistance:(Cell*) cell;

@end
