//
//  Cell.h
//  DNA
//
//  Created by Антон Лебедев on 06.11.12.
//  Copyright (c) 2012 Антон Лебедев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray * DNA;

-(int) hammingDistance:(Cell *)compareTo;
@end
