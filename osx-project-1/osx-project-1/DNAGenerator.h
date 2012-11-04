//
//  DNAGenerator.h
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNAGenerator : NSObject

- (NSNumber *) randomDNASymbol;

- (NSNumber *) randomDNASymbolExcept:(NSNumber *)symbol;

- (NSMutableArray *) createDNAWithCapacity:(NSUInteger)capacity;

@end
