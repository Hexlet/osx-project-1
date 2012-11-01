//
//  Cell.h
//  DNA
//
//  Created by Dm on 10/30/12.
//  Copyright (c) 2012 Dm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic,retain) NSMutableArray *dna;
@property (nonatomic,retain) NSArray *nucleobase;

-(int) hammingDistance:(Cell *)cell;

@end
