//
//  NucleotideGenerator.h
//  DNA
//
//  Created by Dmitry Davidov on 06.11.12.
//  Copyright (c) 2012 Dmitry Davidov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NucleotideGenerator : NSObject

+(NSString *) getRandom;
+(NSString *) getRandomExcept: (NSString *) nuc;

@end
