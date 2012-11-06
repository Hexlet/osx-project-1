//
//  Cell.h
//  DNKProject
//
//  Created by IT-Dimension on 11/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject 

@property (nonatomic,retain) NSMutableArray *DNA; 
@property int countDNA;

-(Cell*)init;
-(int)hammingDistance:(Cell*)cell1;
-(NSString*)generateSymbol;

@end
