//
//  Cell.h
//  KobaDNA
//
//  Created by koba on 03.11.12.
//  Copyright (c) 2012 koba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

+(NSString*) getMutation: (NSString*) src;
-(int) hammingDistance: (Cell*) cell;
@end
