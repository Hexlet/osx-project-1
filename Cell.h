//
//  Cell.h
//  DNA
//
//  Created by Тимофей on 11.11.12.
//  Copyright (c) 2012 Тимофей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

+(char)dnaRandom;
//+(id)arrayGenerate;
-(id)init;
//+(int)hammingDistance: (id)DNAarray;
+(int)hammingDistance: (id)DNAarray;
//-(id)DNAHD;
/*+ (id)dnaRandom
 {
 char array[4] =
 {'A', 'T', 'G', 'C'};
 int number = arc4random()%4;
 return array[number];
 }*/
@end

