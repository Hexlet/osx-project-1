//
//  Cell.h
//  DNA
//
//  Created by Администратор on 10/30/12.
//  Copyright (c) 2012 Zed Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

  @property NSMutableArray *DNA;
+(char)returnRandomGene;
-(void)print;
-(int)hammingDistance:(Cell*)SampleCell;

@end
