//
//  Cell.h
//  DNA-project
//
//  Created by Sergey Gorelov on 04.11.12.
//  Copyright (c) 2012 Sergey Gorelov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property NSMutableArray *dna;
-(int) hammingDistance:(Cell *)cellToCompare;
@end
