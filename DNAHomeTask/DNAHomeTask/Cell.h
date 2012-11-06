//
//  Cell.h
//  DNAHomeTask
//
//  Created by Andrei Tsukanov on 11/2/12.
//  Copyright (c) 2012 Andrei Tsukanov. All rights reserved.
//

@interface Cell : NSObject

@property  NSMutableArray *DNA;

-(id)init;
-(int)hammingDistance:(Cell *)c;
-(void)setRandomElementAtIndex:(NSInteger)index;
@end
