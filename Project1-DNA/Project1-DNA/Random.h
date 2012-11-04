//
//  Random.h
//  Project1-DNA
//
//  Created by Administrator on 01.11.12.
//  Copyright (c) 2012 Mykhailo Oleksiuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>

@interface Random : NSObject

// Returns a random integer in range [0; upperBound)
+ (int)randomInteger:(int)upperBound;

// Returns a set of unique integers with specified size and range for uniqueness [0; upperBound) 
+ (NSSet *)uniqueRandomIntegersWithSize:(int)size upperBound:(int) upperBound;

@end
