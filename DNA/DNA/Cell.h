//
//  Cell.h
//  DNA
//
//  Created by lexin on 01.11.12.
//  Copyright (c) 2012 lexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{

}
@property(strong,nonatomic,readonly)    NSMutableArray*arrDNA;
-(int)hammingDistance:(Cell*)inputCell;
@end
