//
//  Random.h
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
Methods for working with random numbers
*/
@interface Random : NSObject

/*
Returns a random non-negative integer number less that the specified upper bound
 */
+ (NSUInteger) nextNumber:(NSUInteger)upperBound;

@end
