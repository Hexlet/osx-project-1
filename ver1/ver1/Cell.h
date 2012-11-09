//
//  Cell.h
//  ver1
//
//  Created by Denis Sazonov on 11/8/12.
//  Copyright (c) 2012 Denis Sazonov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property   NSMutableArray *dna;


-(int) hammingDistance:(Cell *)cell;

@end
