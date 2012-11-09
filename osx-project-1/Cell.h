//
//  Cell.h
//  osx-project-1
//
//  Created by Aizat on 11/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic, readonly) NSMutableArray *DNA;

-(int)hammingDistance:(Cell *)cell;
-(void)fillWithRandomNucleotides;
+(NSString *)getRandomNucleotide;
-(void)print;
@end
