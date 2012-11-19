//
//  Cell.h
//  DNAapp
//
//  Created by Michael Krinitsky on 11/13/12.
//  Copyright (c) 2012 Michael Krinitsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *DNA;
}

@property (readonly) NSMutableArray *getDNA;

+ (NSString *) randomAmino;
- (int) hammingDistance:(NSMutableArray *) DNA2;

@end
