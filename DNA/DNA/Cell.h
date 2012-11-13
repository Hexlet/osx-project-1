//
//  Cell.h
//  DNA
//
//  Created by Akki on 11/10/12.
//  Copyright (c) 2012 Akki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

- (int)hammingDistance:(Cell*)anotherCell;

@property NSArray *nucleotides;
@property NSMutableArray *DNA;
@end
