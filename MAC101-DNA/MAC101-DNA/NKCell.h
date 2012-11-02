//
//  NKCell.h
//  MAC101-DNA
//
//  Created by Nikita Korchagin on 31.10.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKCell : NSObject

@property (nonatomic, retain) NSMutableArray *DNA;

- (NSUInteger)hammingDistance:(NKCell *)cell;

@end
