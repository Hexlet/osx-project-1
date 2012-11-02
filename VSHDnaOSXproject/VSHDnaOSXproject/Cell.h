//
//  Cell.h
//  VSHDnaOSXproject
//
//  Created by vshcryabets@gmail.com on 11/1/12.
//  Copyright (c) 2012 vshcryabets@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property NSMutableArray *dna;
-(void)print;
-(int)hammingDistance:(Cell*)secondCell;
@end
