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
+(NSString *)getRandomNucleotide;
+(NSString *)getRandomNucleotideExclude:(NSString *)exclude;
-(int)hammingDistance:(Cell *)cell;
-(void)fillWithRandomNucleotides;
-(void)print;
@end
