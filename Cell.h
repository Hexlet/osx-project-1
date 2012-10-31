//
//  Cell.h
//  DNAProject
//
//  Created by Andrew on 30.10.12.
//  Copyright (c) 2012 AndrewVanyurin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ATGC @[@"A", @"T", @"G", @"C"]

@interface Cell : NSObject

@property (nonatomic, strong) NSMutableArray *DNA;

-(int) hammingDistance: (Cell *)c;

@end
