//
//  Cell.h
//  dna
//
//  Created by Yura Tolstik on 10/31/12.
//  Copyright (c) 2012 Yura Tolstik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic) NSMutableArray *dna;

+(NSString *)randomSymbol;
-(int) hammingDistance:(Cell *)c;

@end
