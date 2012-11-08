//
//  Cell.h
//  HomeWorkOne_DNA
//
//  Created by Anatoly Yashkin on 07.11.12.
//  Copyright (c) 2012 Anatoly Yashkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
-(int)hammingDistance:(Cell *)otherCell;
+(NSString *) getRandomDNAPart:(id)replasingPart;
@end
