//
//  Cell.h
//  02.DNK
//
//  Created by Lert on 10/30/12.
//  Copyright (c) 2012 HEXLET. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
-(NSUInteger)hammingDistance:(Cell*)obj;
-(id)initWithCapacity:(NSUInteger)count andGens:(NSArray*) dnk_gen;
@end
//category interface
@interface Cell (mutator)
-(void)mutate:(NSUInteger)percent;
@end