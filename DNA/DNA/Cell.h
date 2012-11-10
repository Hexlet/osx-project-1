//
//  Cell.h
//  DNA
//
//  Created by oleksandr sharov on 11/6/12.
//  Copyright (c) 2012 oleksandr sharov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject


@property NSMutableArray *DNA;

-(int)hammingDistance:(Cell*)theCell;

@end
