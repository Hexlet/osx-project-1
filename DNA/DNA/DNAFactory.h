//
//  DNAFactory.h
//  DNA
//
//  Created by user on 11/8/12.
//  Copyright (c) 2012 azhohov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNAFactory : NSObject

+(NSString *)getRandomDNABase;
+(NSString *)getRandomDNABaseExclude:(NSString *) dnaBase;

@end
