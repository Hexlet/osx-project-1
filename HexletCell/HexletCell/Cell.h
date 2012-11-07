//
//  Cell.h
//  HexletCell
//
//  Created by Артем Прохоров on 06.11.12.
//  Copyright (c) 2012 Артем Прохоров. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property NSMutableArray * DNA;
-(void) print;
-(int) hammingDistance:(Cell *)cell;
-(NSString *) getRandomDNAMark;
@end
