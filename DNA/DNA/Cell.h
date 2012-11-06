//
//  Cell.h
//  DNA
//
//  Created by Olha Romanko on 06.11.12.
//  Copyright (c) 2012 Olha Romanko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *arrDNA;
}
-(id)init;
-(void)createArrChainDNA;
-(NSString*)chooseSimbol;
-(int)hammingDistance:(Cell *)cell;
@property(strong,nonatomic) NSMutableArray *arrDNA;
@end
