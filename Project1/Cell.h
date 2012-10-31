//
//  Cell.h
//  Project1
//
//  Created by Sergey Atroschenko on 31.10.12.
//  Copyright (c) 2012 ASVUSER. All rights reserved.
//

#import <Foundation/Foundation.h>


extern int const kMaxDNASize;
extern int const kDNATypesLenght;
extern char const kDNATypes[];

@interface Cell : NSObject

@property (nonatomic, readonly, strong) NSMutableArray *DNA;

-(NSUInteger) hammingDistance: (Cell*)otherCell;

@end
