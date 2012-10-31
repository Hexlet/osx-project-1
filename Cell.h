//
//  Cell.h
//  DNAProject
//
//  Created by Andrew on 30.10.12.
//  Copyright (c) 2012 AndrewVanyurin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSArray *ATGC;
}

@property (nonatomic, strong) NSMutableArray *DNA;

-(int) hammingDistance: (Cell *)c;

@end
