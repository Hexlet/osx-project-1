//
//  DNACell.h
//  DNA Test
//
//  Created by Evgeny Golubev on 30.10.12.
//  Copyright (c) 2012 Evgeny Golubev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNACell : NSObject

@property (readonly) NSMutableArray *DNA;
@property (readonly) NSArray *DNATypes;

-(int) hammingDistance: (DNACell *)DNAForHamming;

@end