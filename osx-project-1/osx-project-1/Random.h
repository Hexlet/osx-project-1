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

/*
 Returns a random non-negative integer number that not equals to specified except number
 and less that the specified upper bound
*/
+ (NSUInteger) nextNumberExcept:(NSUInteger)exceptNumber withUpperBound:(NSUInteger)upperBound;

/*
 Returns a random set of non-negative integer numbers less that the specified upper bound
 of the specified length. All numbers are different.
*/
+ (NSIndexSet *) nextSequenceOfLength:(NSUInteger)length
                       withUpperBound:(NSUInteger)upperBound;

@end
